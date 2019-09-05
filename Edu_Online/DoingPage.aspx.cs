using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class DoingPage : System.Web.UI.Page
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
        }

        [WebMethod(EnableSession = true)]
        public static int SubmitResult(Dictionary<string, string>[] single, Dictionary<string, string>[] judge)
        {
            string practiceId = HttpContext.Current.Session["practiceId"].ToString();
            string stuId = HttpContext.Current.Session["userId"].ToString();
            int QuesCount = single.Length + judge.Length;
            float singleCount = 0;
            float judgeCount = 0;
            foreach (Dictionary<string, string> item in single)
            {
                string quesId = item["quesId"];
                string answer = item["answer"];
                string singleSql = "select * from SingleChoice where quesId=" + quesId;
                SqlDataReader sdr = DataOperate.GetRow(singleSql);
                sdr.Read();
                string correct = sdr["answer"].ToString();
                if (correct == answer)
                {
                    singleCount++;
                }
            }

            foreach (Dictionary<string, string> item in judge)
            {
                string quesId = item["quesId"];
                string answer = item["answer"];
                string judgeSql = "select * from JudgeQuestion where quesId=" + quesId;
                SqlDataReader sdr = DataOperate.GetRow(judgeSql);
                sdr.Read();
                string correct = sdr["answer"].ToString();
                if (correct == answer)
                {
                    judgeCount++;
                }
            }
            float count = singleCount + judgeCount;
            int score = Convert.ToInt32((count / QuesCount) * 100);
            string doneTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string addResult = "insert into AnswerResult(practiceId,stuId,score,doneTime) values(" + practiceId + ",'" + stuId + "'," + score + ",'"+ doneTime+"')";
            DataOperate.ExecSQL(addResult);
            return score;
        }
    }
}