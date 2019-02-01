using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPortal.Logic;

namespace WebPortal.Admin
{
    public partial class Customers : System.Web.UI.Page
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
                DataTable dt1 = dh.GetData("GetAllCustomers", null);
                GridView1.DataSource = dt1;
                GridView1.DataBind();
            }

        }
    }
}