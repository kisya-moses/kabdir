﻿using System;
using System.Data;
using System.Web;
using WebPortal.Logic;

namespace WebPortal.Admin
{
    public partial class AddDeliveryAgent : System.Web.UI.Page
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
                    DataTable dt1 = dh.GetData("GetAllBusinessCategory", null);
                    DataTable dt2 = dh.GetData("GetAllDistricts", null);
                    District.DataSource = dt2;
                    District.DataBind();
                }
            }
        }

        protected void EditProfile_Click(object sender, EventArgs e)
        {
            dh.InsertData("AddDeliveryAgent", new object[] {
                BName.Text,
                BEmail.Text,
                BWebsite.Text,
                BPhone.Text,
                BDescription.Text,
                District.SelectedValue.ToString(),
                Division.SelectedValue.ToString(),
                DateTime.Now.ToString(),
                Session["USERIDENTITY"].ToString()
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