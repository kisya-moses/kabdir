using WebPortal.Logic;
using System;
using System.Data;

namespace WebPortal.Admin
{
    public partial class UserManagement : System.Web.UI.Page
    {
        DatabaseHandler dh = new DatabaseHandler();
        StringHandler sh = new StringHandler();
        EmailHandler eh = new EmailHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params.GetKey(0) == "SWITCH")
            {
                string pass = dh.RunQueryDirectly("Select * from SystemSettings Where SettingName='ENCRYPTION_KEY'", "SettingValue");
                string UserID = Request.Params.Get(0);
                string RoleID = Request.Params.Get(1);
                string Password = sh.GetUniqueKey(8);//create a random password for the user.
                //deleting user                
                string EncPassword = sh.EncryptString(Password, pass);
                bool inserted = dh.InsertData("ActivateUser", new object [] {
                    int.Parse(UserID),
                    EncPassword,
                    DateTime.Now.ToString(),
                    RoleID
                });
                if (inserted)
                {


                    Message.Text = "ACTION WAS SUCCESSFUL";
                    string SystemName = dh.GetData("GetSystemSetting", new string[] { "SYSTEM_NAME" }).Rows[0]["SettingValue"].ToString();
                    string To = dh.GetData("GetUserEmailByUserID", new string[] { UserID }).Rows[0]["Email"].ToString();
                    string ActionTaken = dh.GetData("GetUserEmailByUserID", new string[] { UserID }).Rows[0]["Activated"].ToString();
                    string UserName = dh.GetData("GetUserEmailByUserID", new string[] { UserID }).Rows[0]["fullname"].ToString();
                    string cred = "\nUse The Following Credentials\n" +
                        "\nUsername: " + To +
                        "\nPassword: " + Password +
                        "\n\n\n";
                    string contactAdmin = "\n\nContact The System Administrator\n"+ dh.GetData("GetSystemSetting", new string[] { "SYSTEM_ADMIN_EMAIL" }).Rows[0]["SettingValue"].ToString()+"\n\n";
                    string detail1 = null, detail2 = null;
                    if (ActionTaken.ToString() == "1") {
                        detail1 = "ACTIVATED";
                        detail2 = detail1 + cred;
                    }
                    else {
                        detail1 = "DE-ACTIVATED";
                        detail2 = detail1 + contactAdmin;
                    };
                    string EmailText = "Hello "+UserName+",\n\nYour "+
                        SystemName+
                        " Account has been "+detail2+".\n"+
                        "\nBest Regards.\n"+SystemName;
                    eh.SendEmail(To, EmailText, SystemName+" ACCOUNT "+ detail1);
                }
            }

            if (Request.Params.GetKey(0) == "DEL")
            {
                string UserID = Request.Params.Get(0);
                //deleting user
                bool inserted = dh.InsertData("DeleteUserByID", new object [] { int.Parse(UserID) });
                if (inserted)
                {
                    Message.Text = "USER WAS DELETED";
                }
            }
            BindData();
        }

        private void BindData()
        {
            DataTable dt = dh.GetData("GetAllUsers", null);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}