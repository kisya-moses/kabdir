using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Data;
using WebPortal.Logic;

namespace WebPortal
{
    public partial class uLogin : System.Web.UI.Page
    {
        //private SqlDataReader rd;
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
                    string userid = Session["USERIDENTITY"].ToString();
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
                        dh.InsertData("LogAuditTrail", new string[] { "LOG OUT", DateTime.Now.ToString(), " USER "+Session["USERIDENTITY"].ToString()+"HAS LOGGED OUT " });
                        Session.Clear();
                        FormsAuthentication.SignOut();
                        HttpContext.Current.Response.Redirect("~/uLogin.aspx");
                    }else
                    {
                        Response.Redirect("~/uLogin.aspx");
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
            string EncPwd = E.EncryptString(pwd.Text, pass);
            DataTable tbl = dh.GetData("Validate_User", new object[] { uname.Text, EncPwd });

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
                    msg.Text = "Account has not been activated.";
                    break;
                case 0:
                    Response.Redirect("uLogin.aspx");
                    break;
                default:
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                        701, uname.Text, DateTime.Now, DateTime.Now.AddMinutes(60 * 24 * 2),
                        true, roles, FormsAuthentication.FormsCookiePath
                    );
                    string hash = FormsAuthentication.Encrypt(ticket);
                    HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hash);
                    Session["USERIDENTITY"] = userX;
                    Session["USERROLE"] = roles;
                    if (ticket.IsPersistent)
                    {
                        cookie.Expires = ticket.Expiration;
                    }
                    Response.Cookies.Add(cookie);
                    Response.Redirect(FormsAuthentication.GetRedirectUrl(uname.Text, true));
                    break;
            }
        }
    }
}