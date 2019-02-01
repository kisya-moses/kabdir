using PdfSharp;
using PdfSharp.Pdf;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web;
using TheArtOfDev.HtmlRenderer.PdfSharp;
using WebPortal.Logic;

namespace WebPortal.Admin
{
    public partial class Performance : System.Web.UI.Page
    {
        DatabaseHandler dh = new DatabaseHandler();
        StringHandler sh = new StringHandler();
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (!HttpContext.Current.User.IsInRole("ADMIN"))
            {
                HttpContext.Current.Response.Redirect("../Default.aspx");
            }
            if (!IsPostBack) {
                DataTable dt = dh.GetData("GetAllAuditTrail", null);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void GetPDF_Click(object sender, EventArgs e)
        {
            sh.GeneratePDF(Response, "GetAllAuditTrail", null, "System Audit Trail Report");
        }

    }
}