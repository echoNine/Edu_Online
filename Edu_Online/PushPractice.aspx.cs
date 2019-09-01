using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class PushPractice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string teachName = Session["userName"].ToString();
            string sql = "select * from PracticeInfo inner join VideoInfo on PracticeInfo.videoId = VideoInfo.VideoId inner join CourseInfo on CourseInfo.courseId = VideoInfo.CourseId where CourseInfo.teacher = "+"'"+teachName+"'";
            WorkList.DataSource = DataOperate.GetDataset(sql, "PracticeInfo");
            WorkList.DataKeyNames = new string[] { "practiceId" };
            WorkList.DataBind();

            string sql1 = "select * from TeacherInfo where TeachId ='" + Session["userId"].ToString() + "'";
            SqlDataReader sdr = DataOperate.GetRow(sql1);
            sdr.Read();
            user.Text = Session["userName"].ToString();
            person.ImageUrl = sdr["TeachPic"].ToString();
            img.ImageUrl = sdr["TeachPic"].ToString();
        }

        protected void add_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddQues.aspx");
        }

        protected void quit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}