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
            BindInfo();
            string sql = "select * from TeacherInfo where TeachId ='" + Session["userId"].ToString() + "'";
            SqlDataReader sdr = DataOperate.GetRow(sql);
            sdr.Read();
            user.Text = Session["userName"].ToString();
            person.ImageUrl = sdr["TeachPic"].ToString();
            img.ImageUrl = sdr["TeachPic"].ToString();
        }
        protected void BindInfo()
        {
            string teachName = Session["userName"].ToString();
            string sql = "select * from PracticeInfo inner join VideoInfo on PracticeInfo.videoId = VideoInfo.VideoId inner join CourseInfo on CourseInfo.courseId = VideoInfo.CourseId where CourseInfo.teacher = " + "'" + teachName + "'";
            WorkList.DataSource = DataOperate.GetDataset(sql, "PracticeInfo");
            WorkList.DataKeyNames = new string[] { "practiceId" };
            WorkList.DataBind();
        }

        protected void add_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddQues.aspx");
        }

        protected void quit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void WorkList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = WorkList.DataKeys[e.RowIndex].Value.ToString();
            string[] sqlT = new string[3];
            sqlT[0] = "delete PracticeInfo where practiceId='" + id + "'";
            sqlT[1] = "delete SingleChoice where practiceId='" + id + "'";
            sqlT[2] = "delete JudgeQuestion where practiceId='" + id + "'";
            if (DataOperate.ExecTransaction(sqlT))
            {
                BindInfo();
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('删除成功')</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('删除失败')</script>");
            }
        }
    }
}