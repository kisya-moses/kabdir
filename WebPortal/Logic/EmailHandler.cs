using System;
using System.Net;
using System.Net.Mail;

namespace WebPortal.Logic
{
    public class EmailHandler
    {
        DatabaseHandler dh = new DatabaseHandler();
        public void SendEmail(string To, string EmailText, string Subject)
        {
            string SystemName = dh.GetData("GetSystemSetting", new string[] { "SYSTEM_NAME" }).Rows[0]["SettingValue"].ToString();
            string SystemEmail = dh.GetData("GetSystemSetting", new string[] { "MAILING_ADDRESS" }).Rows[0]["SettingValue"].ToString();
            string SystemEmailPassword = dh.GetData("GetSystemSetting", new string[] { "MAILING_PASSWORD" }).Rows[0]["SettingValue"].ToString();
            string SystemEmailHost = dh.GetData("GetSystemSetting", new string[] { "MAILING_HOST" }).Rows[0]["SettingValue"].ToString();
            string SystemEmailPort = dh.GetData("GetSystemSetting", new string[] { "MAILING_PORT" }).Rows[0]["SettingValue"].ToString();
            try
            {
                // Credentials
                var credentials = new NetworkCredential(SystemEmail, SystemEmailPassword);
                // Mail message
                var mail = new MailMessage()
                {
                    From = new MailAddress(SystemEmail, SystemName),
                    Subject = Subject,
                    Body = EmailText
                };
                mail.To.Add(new MailAddress(To));
                // Smtp client
                var client = new SmtpClient()
                {
                    Port = int.Parse(SystemEmailPort),
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Host = SystemEmailHost,
                    Credentials = credentials,
                    EnableSsl = true,
                };
                // Send it...         
                client.Send(mail);
                dh.LogError("Email Sent To [ " + To + " ]");
            }
            catch (Exception ex)
            {
                dh.LogError("Error in sending email To [ " + To + " ]" + ex.Message);
            }
        }
    }
}