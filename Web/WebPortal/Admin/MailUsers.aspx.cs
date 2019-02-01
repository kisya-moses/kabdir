using System;
using System.Web;
using WebPortal.Logic;
using System.Data;

namespace WebPortal.Admin
{
    public partial class NewQuestion : System.Web.UI.Page
    {
        DatabaseHandler dh = new DatabaseHandler();
        StringHandler sh = new StringHandler();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.IsInRole("ADMIN"))
            {
                HttpContext.Current.Response.Redirect("Default.aspx");
            }
        }

        protected void EditProfile_Click(object sender, EventArgs e)
        {
            string ToGrp = ToGroup.SelectedValue.ToString().ToUpper();
            int count = 0;
            string info = "MAIL DELIVERED TO {0} {1}<br/>";
            if (ToGrp.Contains("Business"))
            {
                sh.SendMails("Business", out count, Message.Text, Subject.Text, Session["USERIDENTITY"].ToString());
            }
            else if (ToGrp.Contains("NewsLetter"))
            {
                sh.SendMails("NewsLetterSubscribers", out count, Message.Text, Subject.Text, Session["USERIDENTITY"].ToString());
            }
            else if (ToGrp.Contains("Delivery"))
            {
                sh.SendMails("DeliveryAgents", out count, Message.Text, Subject.Text, Session["USERIDENTITY"].ToString());
            }
            else if (ToGrp.Contains("Customers"))
            {
                sh.SendMails("Customers", out count, Message.Text, Subject.Text, Session["USERIDENTITY"].ToString());
            }
            Msg.Text = string.Format(info, count, ToGrp);
        }
    }
}