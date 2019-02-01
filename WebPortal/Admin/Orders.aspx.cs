using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPortal.Logic;
using System.Data;

namespace WebPortal.Admin
{
    public partial class Orders : System.Web.UI.Page
    {
        DatabaseHandler dh = new DatabaseHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.IsInRole("ADMIN"))
            {
                HttpContext.Current.Response.Redirect("Default.aspx");
            }else
            {
                if (Request.Params.Keys[0].Equals("Delete"))
                {
                    int ID = int.Parse(Request.Params.Get(0).ToString());
                    dh.InsertData("DeleteOrderByID", new object[] { ID, Session["USERIDENTITY"].ToString(), DateTime.Now.ToString() });
                    Response.Redirect("Orders.aspx");
                }
                else
                {
                    DataTable dt1 = dh.GetData("GetAllOrders", null);
                    GridView1.DataSource = dt1;
                    GridView1.DataBind();
                }
            }
            //if (Request.Params.Keys[0].Equals("Edit"))
            //{
            //    string ID = Request.Params.Get(0).ToString();
            //    DataTable dt = dh.GetData("GetAllAssessments", new object[] { ID });
            //    AllQuestions.DataSource = dt;
            //    AllQuestions.DataBind();
            //}
        }
    }
}