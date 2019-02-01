using WebPortal.Logic;
using System;
using System.Data;
using System.Web;

namespace WebPortal.Admin
{
    public partial class AddAssessment : System.Web.UI.Page
    {
        DatabaseHandler dh = new DatabaseHandler();
        StringHandler sh = new StringHandler();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!HttpContext.Current.User.IsInRole("ADMIN"))
            {
                HttpContext.Current.Response.Redirect("Default.aspx");
            }
            QzID.Value = sh.GetUniqueKey(25);
            if (Request["Edit"] != null && !IsPostBack)
            {
                DataTable dt = dh.GetData("GetQuizByID", new object[] { Request.Params.Get(0).ToString() });
                Title1.Text = dt.Rows[0]["QuizTitle"].ToString();
                Description.Text = dt.Rows[0]["QuizDescription"].ToString();
                //StartDate.Text = dt.Rows[0]["StartDate"].ToString();
                EndDate.Text = dt.Rows[0]["EndDate"].ToString();
                QzID.Value = dt.Rows[0]["QuizID"].ToString();
                TimeToRespondToEachQuestion.Text = dt.Rows[0]["QuestionAnswerTimeout"].ToString();
            }
            if (Request["Edit"] != null && IsPostBack)
            {
                DataTable dt = dh.GetData("GetQuizByID", new object[] { Request.Params.Get(0).ToString() });
                QzID.Value = dt.Rows[0]["QuizID"].ToString();
            }
        }

        protected void Add_Quiz_Click(object sender, EventArgs e)
        {
            dh.InsertData("AddQuiz", new object[]{
                Title1.Text,
                Description.Text,
                DateTime.Now.ToString(),
                DateTime.Now.ToString(),
                EndDate.Text,
                TimeToRespondToEachQuestion.Text,
                "ADMINISTRATOR", //Session["USERIDENTITY"].ToString(),
                QzID.Value
            });
            Title1.Text = "";
            Description.Text = "";
            EndDate.Text = "";
            TimeToRespondToEachQuestion.Text = "";
            QzID.Value = "";
            Response.Redirect("AddAssessment.aspx");
        }
    }
}