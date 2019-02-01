using WebPortal.Logic;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.Admin
{
    public partial class AddUser : System.Web.UI.Page
    {
        DatabaseHandler dh = new DatabaseHandler();
        EmailHandler eh = new EmailHandler();
        StringHandler sh = new StringHandler();
        private string token;

        public string EmailTxt { get; private set; }
        public string Subject { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = dh.GetData("GetAllDistricts", null);
            Country.DataSource = dt;
            Country.DataTextField = "name";
            Country.DataValueField = "id";


            DataTable dt1 = dh.GetData("GetUserRoles", null);
            UserRoles.DataSource = dt1;
            UserRoles.DataTextField = "RoleName";
            UserRoles.DataValueField = "RoleId";
            if (!IsPostBack) {
                Country.DataBind();
                UserRoles.DataBind();
            }
            UserID.Value = (int.Parse(dh.RunQueryDirectly("select top 1 id_ from users order by id_ desc","id_").ToString())+1).ToString();
            if (Request.Params.GetKey(0) == "EDIT")
            {
                //editing user data

                DataTable dt5 = dh.GetData("GetUserByID", new object[] { int.Parse(Request.Params.Get(0))});
                if (dt5.Rows.Count > 0) {
                    FName.Text = dt5.Rows[0]["firstName"].ToString();
                    LName.Text = dt5.Rows[0]["LastName"].ToString();
                    Country.Items.Insert(0, new ListItem(dt5.Rows[0]["Country"].ToString()));
                    Gender.SelectedValue = dt5.Rows[0]["Gender"].ToString();
                    District.Items.Insert(0, new ListItem(dt5.Rows[0]["District"].ToString()));
                    Region.Items.Insert(0, new ListItem(dt5.Rows[0]["Region"].ToString()));
                    Email.Text = dt5.Rows[0]["Email"].ToString();
                    PhoneNo.Text = dt5.Rows[0]["TelNumber"].ToString();
                    UserID.Value = Request.Params.Get(0);
                }
            }
        }

        protected void AddUserBtn_Click(object sender, EventArgs e)
        {
            if (FName.Text.ToString() == "")
            {
                msg.Text = "ENTER THE FIRST NAME";
            }
            else if (Email.Text.ToString() == "")
            {
                msg.Text = "ENTER AN EMAIL ADDRESS.";
            }
            else if (PhoneNo.Text.ToString() == "")
            {
                msg.Text = "ENTER A PHONE NUMBER.";
            }
            else
            {
                token = sh.GetUniqueKey(29);
                string Authority = Request.Url.GetLeftPart(UriPartial.Authority).TrimStart('/').TrimEnd('/');
                string ApplicationPath = Request.ApplicationPath.TrimStart('/').TrimEnd('/');
                string link = Authority + ApplicationPath + "/ResetAccount.aspx?RESET=" + token;
                string systemname = dh.GetData("GetSystemSetting", new object[] { "SYSTEM_NAME" }).Rows[0]["SettingValue"].ToString();
                string pwd = sh.GetUniqueKey(5);
                string pass = dh.GetData("GetSystemSetting", new object[] { "ENCRYPTION_KEY" }).Rows[0]["SettingValue"].ToString(); //dh.RunQueryDirectly("Select * from SystemSettings Where SettingName='ENCRYPTION_KEY'", "SettingValue");
                string EncPwd = sh.EncryptString(pwd, pass);
                dh.InsertData("AddNewUser", new object[] {
                    FName.Text,
                    LName.Text,
                    Gender.SelectedValue.ToString(),
                    District.SelectedValue.ToString(),
                    Region.SelectedValue.ToString(),
                    Country.SelectedValue.ToString(),
                    Email.Text,
                    PhoneNo.Text,
                    int.Parse(UserID.Value.ToString()),
                    IsActivated.SelectedValue.ToString(),
                    UserRoles.SelectedValue.ToString(),
                    EncPwd
                });
                Subject = systemname+" Account Credentials";
                EmailTxt = "Hello {},\n"+
                    "Your {} Account Details Have Been Set To\n\n"+ 
                    "USER NAME: " +Email.Text+" "+
                    "PASSWORD: " + pwd +
                    "\nOpen the link below To Reset Your Password.\n"
                    +link+
                    "\nOr Login with these same details." +
                    "\n\nRegards\n" +
                    "System Admin.";                
                msg.Text = "USER ADDED.";
                bool tbl = dh.InsertData("ResetAccount", new object[] { token, Email.Text, DateTime.Now.AddHours(-48).ToString() });
                eh.SendEmail(Email.Text, EmailTxt, Subject);
            }
        }
        protected void Country_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt2 = dh.GetData("GetAllRegions", new object[] { Country.Text });
            Region.DataSource = dt2;
            Region.DataTextField = "name";
            Region.DataValueField = "id";
            Region.DataBind();
        }

        protected void Region_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt3 = dh.GetData("GetAllCities",
                new object[] {
                Region.SelectedValue.ToString(),
                Country.SelectedValue.ToString()
            });
            District.DataSource = dt3;
            District.DataTextField = "name";
            District.DataValueField = "id";
            District.DataBind();
        }

    }
}