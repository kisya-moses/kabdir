using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebPortal.Logic
{
    public class UserHandler
    {
        StringHandler sh = new StringHandler();
        DatabaseHandler dh = new DatabaseHandler();
        EmailHandler eh = new EmailHandler();
        public string Register(string FName,
                    string LName,
                    string Gender,
                    string District,
                    string Region,
                    string Country,
                    string Email,
                    string PhoneNo,
                    string IsActivated,
                    string UserRoles,
                    string DOB,
                    string UserID = "1"
            )
        {
            string token = sh.GetUniqueKey(29);
            string Authority = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority).TrimStart('/').TrimEnd('/');
            string ApplicationPath = HttpContext.Current.Request.ApplicationPath.TrimStart('/').TrimEnd('/');
            string link = Authority + ApplicationPath + "/ResetAccount.aspx?RESET=" + token;
            string systemname = dh.GetData("GetSystemSetting", new object[] { "SYSTEM_NAME" }).Rows[0]["SettingValue"].ToString();
            string pwd = sh.GetUniqueKey(5);
            string pass = dh.GetData("GetSystemSetting", new object[] { "ENCRYPTION_KEY" }).Rows[0]["SettingValue"].ToString(); //dh.RunQueryDirectly("Select * from SystemSettings Where SettingName='ENCRYPTION_KEY'", "SettingValue");
            string EncPwd = sh.EncryptString(pwd, pass);
            dh.InsertData("AddNewUser", new object[] {
                    FName,
                    LName,
                    Gender,
                    District,
                    Region,
                    Country,
                    Email,
                    PhoneNo,
                    int.Parse(UserID),
                    IsActivated,
                    UserRoles,
                    EncPwd,
                    DOB
                });
            string Subject = systemname + " Account Credentials";
            string EmailTxt = "Hello {},\n" +
                "Your {} Account Details Have Been Set To\n\n" +
                "USER NAME: " + Email + " " +
                "PASSWORD: " + pwd +
                "\nOpen the link below To Reset Your Password.\n"
                + link +
                "\nOr Login with these same details." +
                "\n\nRegards\n" +
                "System Admin.";
            
            bool tbl = dh.InsertData("ResetAccount", new object[] { token, Email, DateTime.Now.AddHours(-48).ToString() });
            string ret = "FAILED";
            if (tbl)
            {
                eh.SendEmail(Email, EmailTxt, Subject);
                ret = "SUCCESS";
            }
            return ret;
        }

        public string ResetPwd(string Email)
        {
            string ret = "FAILED";
            string token = sh.GetUniqueKey(29);
            string Authority = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority).TrimStart('/').TrimEnd('/');
            string ApplicationPath = HttpContext.Current.Request.ApplicationPath.TrimStart('/').TrimEnd('/');
            string link = Authority + ApplicationPath + "/ResetAccount.aspx?RESET=" + token;
            string systemname = dh.GetData("GetSystemSetting", new object[] { "SYSTEM_NAME" }).Rows[0]["SettingValue"].ToString();
            string subj = "RESET YOUR " + systemname + " Account Password";
            string txt = "Hello, \n" +
                "A Password REset has been initiated for your account."+
                "Open the link below to reset your password.\n"
                + link + "\n\n" + "Regards";
            bool tbl = dh.InsertData("ResetAccount", new object[] { token, Email, DateTime.Now.ToString() });
            if (tbl)
            {
                eh.SendEmail(Email, txt, subj);
                ret = "SUCCESS";                
            }
            return ret;
        }
    }
}