using WebPortal.Logic;
using System;
using System.IO;
using System.Web;
using System.Data;

namespace WebPortal.Admin
{
    
    public partial class BusinessCategories : System.Web.UI.Page
    {
        DatabaseHandler dh = new DatabaseHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.IsInRole("ADMIN"))
            {
                HttpContext.Current.Response.Redirect("Default.aspx");
            }
            else
            {
                if (Request.Params.Keys[0].Equals("Delete"))
                {
                    int ID = int.Parse(Request.Params.Get(0).ToString());
                    dh.InsertData("DeleteBusinessCategoryByID", new object[] { ID, Session["USERIDENTITY"].ToString(), DateTime.Now.ToString() });
                    Response.Redirect("BusinessCategories.aspx");
                }
            }
        }

    }
}