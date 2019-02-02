using System;
using System.Security.Cryptography;
using System.Text;
using PortalAPI_rest.Entities;
using System.Net.Http;
using System.Web.Http;
using System.Net;
using System.IO;
using System.Net.Http.Headers;
using System.Collections.Generic;
using System.Data;
using System.Collections;
using System.Linq;
using System.Reflection;
using Newtonsoft.Json;

namespace PortalAPI_rest.Logic
{
    public class BusinessLogic
    {
        DatabaseHandler dh = new DatabaseHandler();
        WebPortal.Logic.UserHandler uh = new WebPortal.Logic.UserHandler();
        WebPortal.Logic.DatabaseHandler wdh = new WebPortal.Logic.DatabaseHandler();
        WebPortal.Logic.StringHandler sh = new WebPortal.Logic.StringHandler();
        public string Signature { get; private set; }
        internal APIResponse GetBusinesses(Business request)
        {
            APIResponse resp = new APIResponse();

            return resp;
        }

        internal bool ValidAPIKey(string key)
        {
            bool isValidAPIKey = false;
            isValidAPIKey = key.Equals("12345");
            return isValidAPIKey;
        }

        public string GetKey(string key)
        {
            //SHA256 sha256; //= new SHA256Managed();//SHA1.Create();
            try
            {
                using (SHA256 sha256Hash = SHA256.Create())
                {
                    // ComputeHash - returns byte array  
                    byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(key));
                    Signature = Convert.ToBase64String(bytes);
                }
            }
            catch (Exception e)
            {
                dh.LogError("BusinessLogic.GetSignature", e.Message.ToString(), "");
                Signature = "";
            }
            return Signature;
        }


        internal APIResponse UserLogin(Credentials request)
        {
            APIResponse resp = new APIResponse();
            resp.Response = "";
            GetKey(DateTime.Now.Ticks.ToString() + "SESS").Substring(0, 19);
            string[] data = { request.UserName, request.Password, DateTime.Now.ToString() };

            DataTable tbl = dh.GetData("Validate_User", data);
            try
            {
                if (tbl.Rows.Count > 0)
                {
                    DataRow dtrow = tbl.Rows[0];
                    //string SessionID = GetKey(DateTime.Now.Ticks.ToString()+"SESS").Substring(0,19);
                    resp.StatusCode = "0";
                    resp.StatusDescription = "User Found";
                    resp.Response = JsonConvert.SerializeObject(new { Message = "SUCCESS", Data = dtrow });
                    //resp.Response.Add(SessionID);
                }
                else
                {
                    resp.StatusCode = "100";
                    resp.StatusDescription = "User Not Found";
                    resp.Response = JsonConvert.SerializeObject(new { Message = "FAILED" });
                }
            }
            catch (Exception e)
            {

            }
            return resp;
        }

        internal APIResponse AddSytemUser(SystemUser request)
        {
            APIResponse resp = new APIResponse();
            resp.Response = uh.Register(request.FirstName, request.LastName,
                request.Gender, request.DistrictID, "",
                request.DistrictID, request.Email,
                request.PhoneNumber, "0", request.UserType, request.DateOfBirth
                );
            return resp;
        }

        internal APIResponse UserReset(string emailOrPhone)
        {
            APIResponse resp = new APIResponse();
            resp.Response = uh.ResetPwd(emailOrPhone);
            if (resp.Response == "SUCCESS")
            {
                resp.StatusCode = "0";
            }
            else
            {
                resp.StatusCode = "100";
            }
            return resp;
        }

        public bool PhoneNumberValid(string phoneNumber)
        {
            bool Valid = false;
            if ((phoneNumber.StartsWith("256") && phoneNumber.Length == 12 && !NumberContainsLetters(phoneNumber)) ||
                phoneNumber.Equals("ALL")) //256781234569
                Valid = true;
            return Valid;
        }

        public bool NumberContainsLetters(string number)
        {
            bool containsLetters = false;
            ArrayList digits = new ArrayList();
            digits.Add('0');
            digits.Add('1');
            digits.Add('2');
            digits.Add('3');
            digits.Add('4');
            digits.Add('5');
            digits.Add('6');
            digits.Add('7');
            digits.Add('8');
            digits.Add('9');
            char[] chars = number.ToCharArray();
            foreach (char c in chars)
            {
                if (!digits.Contains(c))
                {
                    containsLetters = true;//find any letter return
                    break;
                }
            }
            return containsLetters;
        }

        public bool DateRangeValid(string endDate, string startDate)
        {
            bool Valid = false;
            DateTime SDate = DateTime.Parse(startDate);
            DateTime EDate = DateTime.Parse(endDate);
            if (DateTime.Compare(EDate, SDate) > 0)
                Valid = true;
            return Valid;
        }

        public bool ValidDate(string sDate)
        {
            DateTime dateValue;
            bool valid = false;
            if (DateTime.TryParse(sDate, out dateValue))
            {
                valid = true;
            }
            return valid;
        }

        public HttpResponseMessage DownloadFile(string downloadFilePath, string fileName)
        {
            try
            {
                //Check if the file exists. If the file doesn't exist, throw a file not found exception

                if (!System.IO.File.Exists(downloadFilePath))
                {
                    dh.LogError("DownloadFile", "FILE NOT EXISTS TO DOWNLOAD " + downloadFilePath, "");
                    throw new HttpResponseException(HttpStatusCode.NotFound);
                }

                //Copy the source file stream to MemoryStream and close the file stream
                MemoryStream responseStream = new MemoryStream();
                Stream fileStream = System.IO.File.Open(downloadFilePath, FileMode.Open);

                fileStream.CopyTo(responseStream);
                fileStream.Close();
                responseStream.Position = 0;

                HttpResponseMessage response = new HttpResponseMessage();
                response.StatusCode = HttpStatusCode.OK;

                //Write the memory stream to HttpResponseMessage content
                response.Content = new StreamContent(responseStream);
                string contentDisposition = string.Concat("attachment; filename=", fileName);
                response.Content.Headers.ContentDisposition = ContentDispositionHeaderValue.Parse(contentDisposition);
                return response;
            }
            catch
            {
                dh.LogError("DownloadFile", "INTERNAL SERVER ERROR" + downloadFilePath, "");
                throw new HttpResponseException(HttpStatusCode.InternalServerError);
            }
        }

    }
}