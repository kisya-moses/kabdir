using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPortal.Logic;

namespace WebPortal.Account
{
    public partial class Register : System.Web.UI.Page
    {
        DatabaseHandler dh = new DatabaseHandler();
        StringHandler sh = new StringHandler();
        EmailHandler eh = new EmailHandler();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            if (Pwd1.Text.Equals(Pwd2.Text))
            {
                string Token = sh.GetUniqueKey(7);
                string[] data = new string[] {
                    Fname.Text,
                    Lname.Text,
                    Email.Text,
                    Phone.Text,
                    Pwd2.Text,
                    NewsLetter.Checked.ToString()
                };
                string link = Request.Url.Scheme + "://" + 
                    Request.Url.Authority + 
                    Request.ApplicationPath.TrimEnd('/') + 
                    "/verify?email="+ Email.Text + "&Token=" + Token;

                string Message = ""+
                    "Hello {0},\n"+
                    "\tYour {1} Account Has Been Created.\n"+
                    "To Verify Your Account click here <a href='"+link+"' >VERIFY</a>" +
                    "\n\n" +
                    "Thank You." +
                    "";
                bool inserted = dh.InsertData("AddCustomer", data);
                if (inserted)
                {
                    eh.SendEmail(Email.Text, Message, "ACCOUNT CREATED");
                }
            }else
            {
                Msg.Text = "Passwords Not Match!";
            }
        }
    }
}