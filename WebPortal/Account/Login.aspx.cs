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
    public partial class Login : System.Web.UI.Page
    {
        DatabaseHandler dh = new DatabaseHandler();
        StringHandler E = new StringHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpContext ct = HttpContext.Current;
                //msg.Text = E.DecryptString("51E+QEZh3moYG60vifv7XA==", pass) + " -- " + E.EncryptString("Admin.123", pass);
                try
                {
                    string userid = Session["CUSTOMERIDENTITY"].ToString();
                    //Response.Redirect("~/Default.aspx");
                }
                catch (NullReferenceException)
                {
                    Console.WriteLine("ERR");
                }

                if (Request["Logout"] == "True")
                {
                    FormsAuthentication.SignOut();
                    if (ct.Request.Url.ToString().Contains("ReturnUrl"))
                    {
                        dh.InsertData(
                            "LogAuditTrail", new string[] {
                            "LOG IN",
                            DateTime.Now.ToString(),
                            " USER " + Session["CUSTOMERIDENTITY"].ToString() + " HAS LOGGED IN"
                        });
                        Session.Clear();
                        FormsAuthentication.SignOut();
                        HttpContext.Current.Response.Redirect("~/account/Login");
                    }
                    else
                    {
                        Response.Redirect("~/account/login");
                    }
                }
            }
        }

        protected void Loginbtn_Click(object sender, EventArgs e)
        {

            int userId = 0;
            string roles = string.Empty;
            string userX = "";
            string pass = dh.RunQueryDirectly("Select * from SystemSettings Where SettingName='ENCRYPTION_KEY'", "SettingValue");
            string EncPwd = E.EncryptString(password.Text, pass);
            DataTable tbl = dh.GetData(
                    "Validate_User",
                    new object[] { email.Text, EncPwd }
                );
            foreach (DataRow reader in tbl.Rows)
            {
                userX = reader["UserId"].ToString();
                userId = Convert.ToInt32(userX);
                roles = reader["Roles"].ToString();
            }
            switch (userId)
            {
                case -1:
                    msg.Text = "Username and/or password is incorrect.";
                    break;
                case -2:
                    msg.Text = "Your Account has not been activated.";
                    break;
                case 0:
                    dh.InsertData("LogAuditTrail", new string[] { "LOG IN", DateTime.Now.ToString(), " USER " + Session["USERIDENTITY"].ToString() + "HAS LOGGED IN " });
                    Response.Redirect("account/account");
                    break;
                default:
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                        701, email.Text, DateTime.Now, DateTime.Now.AddMinutes(60 * 24 * 2),
                        true, roles, FormsAuthentication.FormsCookiePath
                    );
                    string hash = FormsAuthentication.Encrypt(ticket);
                    HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hash);
                    Session["CUSTOMERIDENTITY"] = userX;
                    Session["CUTOMERROLE"] = roles;
                    if (ticket.IsPersistent)
                    {
                        cookie.Expires = ticket.Expiration;
                    }
                    Response.Cookies.Add(cookie);
                    Response.Redirect(FormsAuthentication.GetRedirectUrl(email.Text, true));
                    break;
            }
        }
    }
}