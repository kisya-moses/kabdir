using WebPortal.Logic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        DatabaseHandler dh = new DatabaseHandler();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string GetCount(string tbl, string cond)
        {
            string Data = dh.RunQueryDirectly("SELECT COUNT(*) as total from " + tbl + cond, "total");
            return Data;
        }
    }
}