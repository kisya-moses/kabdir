using System;
using System.Data;
using System.Web;
using WebPortal.Logic;

namespace WebPortal.Admin
{
    public partial class AddBusinessCategory : System.Web.UI.Page
    {
        DatabaseHandler dh = new DatabaseHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!HttpContext.Current.User.IsInRole("ADMIN"))
                {
                    HttpContext.Current.Response.Redirect("Default.aspx");
                }
            }
        }

        protected void EditProfile_Click(object sender, EventArgs e)
        {
            dh.InsertData("AddBusinessCategory", new object[] {
                BName.Text,
                BDescription.Text,
                DateTime.Now.ToString(),
                Session["USERIDENTITY"].ToString()
            });
        }
    }
}