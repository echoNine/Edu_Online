using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class PracticePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string practiceId = Request.QueryString["practiceId"];
            string singleSql = "select * from SingleChoice where practiceId=" + practiceId;
            singleList.DataSource = DataOperate.GetDataset(singleSql, "SingleChoice");
            singleList.DataKeyField = "practiceId";
            singleList.DataBind();

            string judgeSql = "select * from JudgeQuestion where practiceId=" + practiceId;
            judgeList.DataSource = DataOperate.GetDataset(judgeSql, "JudgeQuestion");
            judgeList.DataKeyField = "practiceId";
            judgeList.DataBind();

            Session["practiceId"] = practiceId;
            string sql = "select * from PracticeInfo where practiceId=" + practiceId;
            SqlDataReader sdr = DataOperate.GetRow(sql);
            sdr.Read();
            Name.Text = sdr["practiceName"].ToString();

            string resultSql = "select * from AnswerResult inner join PracticeInfo on AnswerResult.practiceId = PracticeInfo.practiceId inner join StudentInfo on AnswerResult.stuId = StudentInfo.StuId where AnswerResult.practiceId=" + practiceId;
            gvResult.DataSource = DataOperate.GetDataset(resultSql, "AnswerResult");
            gvResult.DataKeyNames = new string[] { "answerId" };
            gvResult.DataBind();
        }

        protected void return_Click(object sender, EventArgs e)
        {
            Response.Redirect("PushPractice.aspx");
        }
    }
}