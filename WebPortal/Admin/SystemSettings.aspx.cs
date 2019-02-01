using WebPortal.Logic;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.Admin
{
    public partial class SystemSettings : System.Web.UI.Page
    {
        DatabaseHandler dh = new DatabaseHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Create a new table.
                DataTable taskTable = dh.GetData("GetSystemSettings", null);
                //Persist the table in the Session object.
                Session["TaskTable"] = taskTable;
                //Bind data to the GridView control.
                BindData();
            }
        }
        protected void TaskGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            TaskGridView.PageIndex = e.NewPageIndex;
            //Bind data to the GridView control.
            BindData();
        }

        protected void TaskGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Set the edit index.
            TaskGridView.EditIndex = e.NewEditIndex;
            //Bind data to the GridView control.
            BindData();
        }

        protected void TaskGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //Reset the edit index.
            TaskGridView.EditIndex = -1;
            //Bind data to the GridView control.
            BindData();
        }

        protected void TaskGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Retrieve the table from the session object.
            DataTable dt = (DataTable)Session["TaskTable"];

            //Update the values.
            GridViewRow row = TaskGridView.Rows[e.RowIndex];
            string ID = ((TextBox)(row.Cells[1].Controls[0])).Text;
            string SettingValue = ((TextBox)(row.Cells[3].Controls[0])).Text;
            //Reset the edit index.
            TaskGridView.EditIndex = -1;
            dh.InsertData("UpdateSetting",new object[] { int.Parse(ID), SettingValue });
            //Bind data to the GridView control.
            BindData();
        }

        private void BindData()
        {
            DataTable dt = dh.GetData("GetSystemSettings", null);
            TaskGridView.DataSource = dt;
            TaskGridView.DataBind();
        }
    }
}