using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class AddQues : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownListBind();
                string sql = "select * from TeacherInfo where TeachId ='" + Session["userId"].ToString() + "'";
                SqlDataReader sdr = DataOperate.GetRow(sql);
                sdr.Read();
                user.Text = Session["userName"].ToString();
                person.ImageUrl = sdr["TeachPic"].ToString();
                img.ImageUrl = sdr["TeachPic"].ToString();
            }

        }

        protected void DropDownListBind()
        {
            SqlConnection con = DataOperate.CreateCon();
            SqlCommand cmd1 = new SqlCommand();
            cmd1.Connection = con;
            string teacher = Session["userName"].ToString();
            cmd1.CommandText = "select * from CourseInfo where teacher ='" + teacher + "'";
            SqlDataReader reader1 = null;
            if (con.State == ConnectionState.Closed)
                con.Open();
            reader1 = cmd1.ExecuteReader();
            CourseName.DataSource = reader1;
            CourseName.DataTextField = "courseName";
            CourseName.DataValueField = "courseId";
            CourseName.DataBind();
            if (con.State == ConnectionState.Open)
                con.Close();
            SqlCommand cmd2 = new SqlCommand();
            cmd2.Connection = con;
            cmd2.CommandText = "select * from VideoInfo where CourseId ='" + CourseName.SelectedValue + "'";
            SqlDataReader reader2 = null;
            if (con.State == ConnectionState.Closed)
                con.Open();
            reader2 = cmd2.ExecuteReader();
            VideoName.DataSource = reader2;
            VideoName.DataTextField = "videoName";
            VideoName.DataValueField = "videoId";
            VideoName.DataBind();
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        protected void quit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        [WebMethod(EnableSession = true)]
        public static string CreatePracticeInfo(Dictionary<string, string>[] list, string PracticeName, string hard, string course, string video)
        {
            // 新增 practice 拿到 practiceId
            string practiceSql = "insert into PracticeInfo(practiceName,hardLevel,courseId,videoId) values('" + PracticeName + "','" + hard + "','" + course + "'," + video + ")";
            string practiceId = "";
            string quesSql = "";
            if (DataOperate.ExecSQL(practiceSql))
            {
                string practiceIdSql = "select * from PracticeInfo where practiceName='" + PracticeName + "'";
                SqlDataReader sdr = DataOperate.GetRow(practiceIdSql);
                sdr.Read();
                //不需要放在那个context里 一个变量 foreach 的代码应该在这里面  practiceIdSql 成功才执行后面froeach 有逻辑依赖的 了解吗
                practiceId = sdr["practiceId"].ToString();

                foreach (Dictionary<string, string> item in list)
                {
                    // 通过循环 list 拿到 type 区分是单选题还是 判断题 insert 
                    string type = item["type"];
                    string content = item["name"];
                    string options = item["options"];
                    string correct = item["correct"];//答案
                    if (type == "single")
                    {
                        string[] optionList = options.Split(';');
                        string A = optionList[0];
                        string B = optionList[1];
                        string C = optionList[2];
                        string D = optionList[3];
                        quesSql = "insert into SingleChoice(quesContent,practiceId,A,B,C,D,answer) values('" + content + "'," + practiceId + ",'" + A + "','" + B + "','" + C + "','" + D + "','" + correct + "')";
                    }
                    else
                    {
                        quesSql = "insert into JudgeQuestion(quesContent,practiceId,answer) values('" + content + "'," + practiceId + ",'" + correct + "')";
                    }
                    DataOperate.ExecSQL(quesSql);
                }
                return "success";
            }

            else
                return "error";
        }

        protected void CourseName_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = DataOperate.CreateCon();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from VideoInfo where CourseId ='" + CourseName.SelectedValue + "'";
            SqlDataReader reader = null;
            if (con.State == ConnectionState.Closed)
                con.Open();
            reader = cmd.ExecuteReader();
            VideoName.DataSource = reader;
            VideoName.DataTextField = "videoName";
            VideoName.DataValueField = "videoId";
            VideoName.DataBind();
            if (con.State == ConnectionState.Open)
                con.Close();
        }
    }
}