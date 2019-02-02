using System;
using System.Data;
using System.Web;
using WebPortal.Logic;

namespace WebPortal.Admin
{
    public partial class AddProduct : System.Web.UI.Page
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
                else
                {
                    DataTable dt1 = dh.GetData("GetAllBusiness", null);
                    inputmanufacturer.DataSource = dt1;
                    ///////////////////////////
                    inputmanufacturer.DataTextField = "Name";
                    inputmanufacturer.DataValueField = "ID";
                    inputmanufacturer.DataBind();
                }
            }
        }

        protected void EditProfile_Click(object sender, EventArgs e)
        {
            dh.InsertData("AddProduct", new object[] { inputquantity.Text
        ,""
        ,inputmanufacturer.SelectedItem.Text.ToString()
        ,inputisbn.Text
        ,inputwidth.Text
        ,inputheight.Text
        ,input
        ,@TaxAmount varchar(50)
        ,@Discount varchar(50)
        ,@Price varchar(50)
        ,@Length varchar(50)
        ,@Viewed varchar(50)
        ,@DateAvailable varchar(50)
        ,@Image varchar(50)
        ,@Type varchar(50)
        ,@Description varchar(50)
        ,@Name varchar(50)
        ,@UnitsInStock varchar(50)
        ,@Category varchar(50)
        ,@LengthUnit varchar(50)
        ,@WeightUnit varchar(50)
        ,@SpeedUnit varchar(50)
        ,        
        ,Session["USERIDENTITY"].ToString(),
        DateTime.Now.ToString()
            });
        }

        protected void District_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt3 = dh.GetData("GetAllDivisions", new string[] { District.SelectedValue.ToString() });
            Division.DataSource = dt3;

            Division.DataTextField = "Name";
            Division.DataValueField = "ID";
            Division.DataBind();
        }
    }
}