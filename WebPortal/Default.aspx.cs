using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool isAdmin = HttpContext.Current.User.IsInRole("ADMIN");
            bool isSuperAdmin = HttpContext.Current.User.IsInRole("ADMIN");
            bool isBusiness = HttpContext.Current.User.IsInRole("BUSINESS");
            bool isDelivery = HttpContext.Current.User.IsInRole("DELIVERY");
            if (isAdmin)
            {
                Response.Redirect("Admin/Dashboard.aspx");
            }
            if (isBusiness)
            {
                Response.Redirect("Business/Dashboard.aspx");
            }
            if (isDelivery)
            {
                Response.Redirect("Delivery/Dashboard.aspx");
            }
            if (isSuperAdmin)
            {
                Response.Redirect("SAdmin/Dashboard.aspx");
            }
        }
    }
}