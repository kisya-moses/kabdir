using WebPortal.Logic;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.Referee
{
    public partial class Profile : System.Web.UI.Page
    {
        DatabaseHandler dh = new DatabaseHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string newcss = "form-control disabled";
                Email.CssClass = newcss;
                EditProfile.Visible = false;
                DataTable dt = dh.GetData("GetMyProfile", new object[] {
                    Session["USERIDENTITY"].ToString()
                });
                //Email.CssClass = newcss;
                FName.CssClass = newcss;
                LName.CssClass = newcss;
                UName.CssClass = newcss;
                Gender.CssClass = newcss;
                //district.CssClass = newcss;
                Gender.CssClass = newcss;
                //nationality.CssClass = newcss;
                Phone.CssClass = newcss;
                //region.CssClass = newcss;
                //ProfileSetup.Visible = true;
                EditProfile.Visible = false;

                Email.Text = dt.Rows[0]["Email"].ToString();
                FName.Text = dt.Rows[0]["firstName"].ToString();
                LName.Text = dt.Rows[0]["LastName"].ToString();
                UName.Text = dt.Rows[0]["Username"].ToString();
                string UType = dt.Rows[0]["UserType"].ToString();

                if (UType.Contains("DELIVERY")||UType.Contains("DELIVERY"))
                {
                    Gender.Visible = false;
                }

                Gender.Text = dt.Rows[0]["Gender"].ToString();

                District.SelectedValue = dt.Rows[0]["District"].ToString();
                District.SelectedItem.Text = dt.Rows[0]["District"].ToString();

                Division.SelectedValue = dt.Rows[0]["Division"].ToString();
                Division.SelectedItem.Text = dt.Rows[0]["Division"].ToString();
                Address.Text = dt.Rows[0]["Address"].ToString();
                Phone.Text = dt.Rows[0]["TelNumber"].ToString();
            }
        }

        protected void ProfileSetup_Click(object sender, EventArgs e)
        {
            string newcss = "form-control";
            ///DataTable dt = dh.GetData("GetMyProfile", new object[] { Session["USERIDENTITY"].ToString() });
            Email.CssClass = newcss;
            FName.CssClass = newcss;
            LName.CssClass = newcss;
            UName.CssClass = newcss;
            //ProfileSetup.Visible = false;
            EditProfile.Visible = true;
        }

        protected void EditProfile_Click(object sender, EventArgs e)
        {
            dh.InsertData("UpdateUser", new object[] {
            Email.Text,
            FName.Text,
            LName.Text,
            UName.Text,
            Gender.Text,
            District.SelectedValue.ToString(),
            Division.SelectedValue.ToString(),
            Address.Text,
            Phone.Text,
            Session["USERIDENTITY"].ToString(),
            DateTime.Now.ToString()
        });
        }

    }
}