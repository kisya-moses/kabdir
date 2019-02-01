using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPortal.Logic;

namespace WebPortal.Account
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        DatabaseHandler dh = new DatabaseHandler();
        StringHandler sh = new StringHandler();
        EmailHandler eh = new EmailHandler();
        public string token { get; private set; }
        public string email { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            if (!IsPostBack)
            {
                try
                {
                    if (Request.Params.GetKey(0) == "RESET")
                    {
                        token = Request.Params.Get(0);
                        //string Date2 = dh.RunQueryDirectly("select DateRequested from AccountReset where Token='" + token + "'", "DateRequested");
                        //if (DateTime.Compare(DateTime.Now, DateTime.Parse(Date2).AddHours(6)) < 0)
                        //{
                        //}
                        Reset2.Visible = true;
                        Reset1.Visible = false;
                    }else
                    {
                        Reset2.Visible = false;
                        Reset1.Visible = true;
                    }
                }
                catch (Exception)
                {

                }
            }
        }

        protected void Loginbtn_Click(object sender, EventArgs e)
        {
            token = sh.GetUniqueKey(29);
            email = uname.Text;
            DataTable dt1 = dh.GetData("GetUserByEmail", new object[] { email });
            bool exists = dt1.Rows.Count == 1;
            if (exists)
            {
                string subj, txt;
                string Authority = Request.Url.GetLeftPart(UriPartial.Authority).TrimStart('/').TrimEnd('/');
                string ApplicationPath = Request.ApplicationPath.TrimStart('/').TrimEnd('/');
                string fullname = dt1.Rows[0]["firstName"].ToString() + " " + dt1.Rows[0]["LastName"].ToString();
                string link = Authority + ApplicationPath + "/ResetAccount.aspx?RESET=" + token;

                string systemname = dh.GetData("GetSystemSetting", new object[] { "SYSTEM_NAME" }).Rows[0]["SettingValue"].ToString();
                subj = "RESET YOUR " + systemname + " Account Password";
                txt = "Hello " + fullname + ", \n" +
                    "Open the link below to reset your password.\n"
                    + link + "\n\n" + "Regards";
                bool tbl = dh.InsertData("ResetAccount", new object[] { token, email, DateTime.Now.ToString() });
                eh.SendEmail(email, txt, subj);
                msg.Text = "An Email Has Been Sent To The Address You Gave IF It Exists In The System";
                uname.Visible = false;
                //lbl1.Visible = false;
                //ResetBtn.Visible = false;
            }
        }

        protected void ResetPwd_Click(object sender, EventArgs e)
        {
            if (string.Compare(pwd1.Text, pwd2.Text) == 0)
            {
                string pass = dh.RunQueryDirectly("Select * from SystemSettings Where SettingName='ENCRYPTION_KEY'", "SettingValue");
                string EncPwd = sh.EncryptString(pwd2.Text, pass);
                msg.Text = "";
                token = Request.Params.Get(0);
                dh.InsertData("UpdateMyPassword", new object[] { EncPwd, token });
                Response.Redirect("uLogin.aspx");
            }
            else
            {
                msg.Text = "PASSWORDS DO NOT MATCH";
                pwd1.Text = "";
                pwd2.Text = "";
            }
        }
    }
}