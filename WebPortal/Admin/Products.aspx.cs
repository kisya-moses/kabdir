using WebPortal.Logic;
using System;
using System.IO;
using System.Web;
using System.Data;
using System.Web.UI.WebControls;

namespace WebPortal.Admin
{
    
    public partial class Products1 : System.Web.UI.Page
    {
        DatabaseHandler dh = new DatabaseHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.IsInRole("ADMIN"))
            {
                HttpContext.Current.Response.Redirect("Default.aspx");
                GridView2.Visible = false;
                GridView1.Visible = true;
            }
            else if (HttpContext.Current.User.IsInRole("BUSINESS"))
            {
                if (!Page.IsPostBack)
                {
                    // Create a new table.
                    DataTable taskTable = dh.GetData("GetAllProductsByBusinessID", new string[] { Session["USERID"].ToString()});
                    //Persist the table in the Session object.
                    Session["TaskTable"] = taskTable;
                    //Bind data to the GridView control.
                    BindData();
                }
                GridView1.Visible = false;
                GridView1.Visible = true;
            }
        }
        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            //Bind data to the GridView control.
            BindData();
        }

        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Set the edit index.
            GridView2.EditIndex = e.NewEditIndex;
            //Bind data to the GridView control.
            BindData();
        }

        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //Reset the edit index.
            GridView2.EditIndex = -1;
            //Bind data to the GridView control.
            BindData();
        }


        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Retrieve the table from the session object.
            DataTable dt = (DataTable)Session["TaskTable"];

            //Update the values.
            GridViewRow row = GridView2.Rows[e.RowIndex];
            string ID = ((TextBox)(row.Cells[1].Controls[0])).Text;
            string Quantity = ((TextBox)(row.Cells[2].Controls[0])).Text;
            string Supplier = ((TextBox)(row.Cells[3].Controls[0])).Text;
            string BusinessName = ((TextBox)(row.Cells[4].Controls[0])).Text;
            string ISBN = ((TextBox)(row.Cells[5].Controls[0])).Text;
            string Width = ((TextBox)(row.Cells[6].Controls[0])).Text;
            string Height = ((TextBox)(row.Cells[7].Controls[0])).Text;
            string Weight = ((TextBox)(row.Cells[8].Controls[0])).Text;
            string TaxAmount = ((TextBox)(row.Cells[9].Controls[0])).Text;
            string Discount = ((TextBox)(row.Cells[10].Controls[0])).Text;
            string Price = ((TextBox)(row.Cells[11].Controls[0])).Text;
            string Length = ((TextBox)(row.Cells[12].Controls[0])).Text;
            string Viewed = ((TextBox)(row.Cells[13].Controls[0])).Text;
            string DateAvailable = ((TextBox)(row.Cells[14].Controls[0])).Text;
            string Image = ((TextBox)(row.Cells[15].Controls[0])).Text;
            string Type = ((TextBox)(row.Cells[16].Controls[0])).Text;
            string Description = ((TextBox)(row.Cells[17].Controls[0])).Text;
            string Name = ((TextBox)(row.Cells[18].Controls[0])).Text;
            string UnitsInStock = ((TextBox)(row.Cells[19].Controls[0])).Text;
            string Category = ((TextBox)(row.Cells[20].Controls[0])).Text;
            string LengthUnit = ((TextBox)(row.Cells[21].Controls[0])).Text;
            string WeightUnit = ((TextBox)(row.Cells[22].Controls[0])).Text;
            string SpeedUnit = ((TextBox)(row.Cells[23].Controls[0])).Text;
            string ProductID = ((TextBox)(row.Cells[25].Controls[0])).Text;

            //Reset the edit index.
            GridView2.EditIndex = -1;
            dh.InsertData("UpdateProduct", new object[] {
                Quantity
               ,Supplier
               ,BusinessName
               ,ISBN
               ,Width
               ,Height
               ,Weight
               ,TaxAmount
               ,Discount
               ,Price
               ,Length
               ,Viewed
               ,DateAvailable
               ,Image
               ,Type
               ,Description
               ,Name
               ,UnitsInStock
               ,Category
               ,LengthUnit
               ,WeightUnit
               ,SpeedUnit
               ,Session["USERID"].ToString()
               ,ProductID
            });
            //Bind data to the GridView control.
            BindData();
        }

        private void BindData()
        {
            DataTable taskTable = dh.GetData("GetAllProductsByBusinessID", new string[] { Session["USERID"].ToString() });
            GridView2.DataSource = taskTable;
            GridView2.DataBind();
        }

    }
}