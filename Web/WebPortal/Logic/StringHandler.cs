using PdfSharp;
using PdfSharp.Pdf;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using TheArtOfDev.HtmlRenderer.PdfSharp;

namespace WebPortal.Logic
{
    public class StringHandler
    {
        DatabaseHandler dh = new DatabaseHandler();
        EmailHandler eh = new EmailHandler();

        public void GeneratePDF(HttpResponse Response, string StoredProcedure, string[] StoredProcedureParams = null, string FileName = "Report")
        {
            DataTable dt = dh.GetData(StoredProcedure, StoredProcedureParams);
            string header = "<h3 style='text-align:center'>Referee Performance Report</h3>";
            string html = header + ConvertDataTableToHTML(dt);
            PdfDocument document = PdfGenerator.GeneratePdf(html, PageSize.A4);            // Create new PDF document
            document.Info.Title = FileName;
            document.Info.Author = "Kishea Moses";
            document.Info.Subject = "Created On: " +
            DateTime.Now.ToString("F", CultureInfo.InvariantCulture);
            document.Options.NoCompression = true;
            document.Info.ModificationDate = DateTime.Now;
            // Send PDF to browser
            MemoryStream stream = new MemoryStream();
            document.Save(stream, false);
            Response.Clear();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-length", stream.Length.ToString());
            Response.BinaryWrite(stream.ToArray());
            Response.Flush();
            stream.Close();
            Response.End();
        }

        internal void SendMails(string GroupTo, out int count, string Message, string Subj, string User)
        {
            count = 0;
            DataTable dt = dh.GetData("GetAllMails",new string[] { GroupTo, User.ToUpper(), DateTime.Now.ToString()});
            string email = "";
            foreach(DataRow Row in dt.Rows)
            {
                email = Row["Email"].ToString();
                if (!string.IsNullOrEmpty(email))
                {
                    eh.SendEmail(email, Message, Subj);
                    count++;
                }
            }
            //return dt.Rows.Count;
        }

        public static string ConvertDataTableToHTML(DataTable dt)
        {
            string html = "<table style='width:100%;font-size:10px;border:1px solid #000;border-collapse:collapse' cellspacing='0' border='1'><tr>";
            for (int i = 0; i < dt.Columns.Count; i++)
            {
                html += "<td style='padding-left:3px;border:1px solid #000;'>" + dt.Columns[i].ColumnName + "</td>";
            }
            html += "</tr>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                html += "<tr>";
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    html += "<td style='padding-left:3px;border:1px solid #000;'>" + dt.Rows[i][j] + "</td>";
                }
                html += "</tr>";
            }
            return html + "</table>";
        }

        public string GetUniqueKey(int maxSize)
        {
            char[] chars = new char[62];
            chars =
            "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".ToCharArray();
            byte[] data = new byte[1];
            using (RNGCryptoServiceProvider crypto = new RNGCryptoServiceProvider())
            {
                crypto.GetNonZeroBytes(data);
                data = new byte[maxSize];
                crypto.GetNonZeroBytes(data);
            }
            StringBuilder result = new StringBuilder(maxSize);
            foreach (byte b in data)
            {
                result.Append(chars[b % (chars.Length)]);
            }
            //Guid result = new Guid();
            return result.ToString();
        }

        // This size of the IV (in bytes) must = (keysize / 8).  
        // Default keysize is 256, so the IV must be
        // 32 bytes long.  Using a 16 character string 
        // here gives us 32 bytes when converted to a byte array.

        private const string initVector = "moSe510v3sH4nn4h"; //
        // This constant is used to determine the keysize of the encryption algorithm
        private const int keysize = 256;

        //Encrypt
        public string EncryptString(string plainText, string passPhrase)
        {
            byte[] initVectorBytes = Encoding.UTF8.GetBytes(initVector);
            byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);
            PasswordDeriveBytes password = new PasswordDeriveBytes(passPhrase, null);
            byte[] keyBytes = password.GetBytes(keysize / 8);
            RijndaelManaged symmetricKey = new RijndaelManaged();
            symmetricKey.Mode = CipherMode.CBC;
            ICryptoTransform encryptor = symmetricKey.CreateEncryptor(keyBytes, initVectorBytes);
            MemoryStream memoryStream = new MemoryStream();
            CryptoStream cryptoStream = new CryptoStream(memoryStream, encryptor, CryptoStreamMode.Write);
            cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);
            cryptoStream.FlushFinalBlock();
            byte[] cipherTextBytes = memoryStream.ToArray();
            memoryStream.Close();
            cryptoStream.Close();
            return Convert.ToBase64String(cipherTextBytes);
        }

        public string DecryptString(string cipherText, string passPhrase)
        {
            byte[] initVectorBytes = Encoding.UTF8.GetBytes(initVector);
            byte[] cipherTextBytes = Convert.FromBase64String(cipherText);
            PasswordDeriveBytes password = new PasswordDeriveBytes(passPhrase, null);
            byte[] keyBytes = password.GetBytes(keysize / 8);
            RijndaelManaged symmetricKey = new RijndaelManaged();
            symmetricKey.Mode = CipherMode.CBC;
            ICryptoTransform decryptor = symmetricKey.CreateDecryptor(keyBytes, initVectorBytes);
            MemoryStream memoryStream = new MemoryStream(cipherTextBytes);
            CryptoStream cryptoStream = new CryptoStream(memoryStream, decryptor, CryptoStreamMode.Read);
            byte[] plainTextBytes = new byte[cipherTextBytes.Length];
            int decryptedByteCount = cryptoStream.Read(plainTextBytes, 0, plainTextBytes.Length);
            memoryStream.Close();
            cryptoStream.Close();
            return Encoding.UTF8.GetString(plainTextBytes, 0, decryptedByteCount);
        }

    }
}