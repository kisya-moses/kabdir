using System;
using System.IO;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;

namespace Tester
{
    class Program
    {
        static void Main(string[] args)
        {
            TestFetchTransactions();
            TestGetRequestStatus();
            TestGetFile();
        }

        private static void TestFetchTransactions()
        {
            Console.WriteLine("TESTING FETCH TRANSACTIONS");
            string url = "http://localhost:54104/msaveapi/fetchtransactions";
            //PhoneNumber=ALL&Password=1234&
            //VendorCode=MTN
            //DigitalSignature=%2FVDTlDWpMZsaCn7BDdnX7tfGCAy064GefW3BDPzRCRE%3D&
            //StartDate =2018-01-01+17%3A00&
            //EndDate =2018-09-03+07%3A07
            string json = "{ " +
                    "\"StartDate\" : \"2018-01-01 17:00\"," +
                    "\"EndDate\" : \"2018-09-03 07:07\"," +
                    "\"DigitalSignature\" : \"/VDTlDWpMZsaCn7BDdnX7tfGCAy064GefW3BDPzRCRE=\"," +
                    " \"VendorCode\" : \"MTN\", " +
                    "\"PhoneNumber\" : \"ALL\"," +
                    "\"Password\" : \"1234\" }";
            performOperation(url,json);
        }

        private static void TestGetRequestStatus()
        {
            string url = @"http://localhost:54104/msaveapi/getrequeststatus";
            string json = "{ " +
                    "\"RequestID\" : \"636725167039759383\"," +
                    " \"VendorCode\" : \"MTN\", " +
                    "\"Password\" : 1234 }";
            performOperation(url, json);
        }

        private static void TestGetFile()
        {
            string url = @"http://localhost:54104/msaveapi/getfile";
            string json = "{ " +
                    "\"RequestID\" : \"636725167039759383\"," +
                    " \"VendorCode\" : \"MTN\", " +
                    "\"Password\" : 1234 }";
            performOperation(url, json);
        }

        private static void performOperation(string url, string json, string Type = "POST")
        {
            // code for json Response consumption from WCF rest Service[Start]
            WebRequest HttpRequestToURL = WebRequest.Create(url);
            HttpRequestToURL.Method = Type;
            HttpRequestToURL.ContentType = "application/json";
            // req2.ContentLength = 0;                    

            using (var streamWriter = new StreamWriter(HttpRequestToURL.GetRequestStream()))
            {
                streamWriter.Write(json);
                streamWriter.Flush();
            }
            ServicePointManager.ServerCertificateValidationCallback = RemoteCertificateValidation;
            HttpWebResponse response = (HttpWebResponse)HttpRequestToURL.GetResponse();
            string jsonResponse = string.Empty;
            using (StreamReader sr = new StreamReader(response.GetResponseStream()))
            {
                jsonResponse = sr.ReadToEnd();
                Console.WriteLine(jsonResponse);
                Console.ReadLine();
            }
            //code for json Response consumption from WCF rest Service[END]
        }

        private static bool RemoteCertificateValidation(Object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
        {
            return true;
        }

    }
}
