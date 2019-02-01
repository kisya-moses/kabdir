using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //bool isAdmin = HttpContext.Current.User.IsInRole("ADMIN");
            //bool isReferee = HttpContext.Current.User.IsInRole("REFEREE");
            //if (isAdmin)
            //{https://refat.azurewebsites.net/
                Response.Redirect("../uLogin.aspx");
            //}
            //else if (isReferee)
            //{
            //    Response.Redirect("Referee/Dashboard.aspx");
            //}
        }
    }
}