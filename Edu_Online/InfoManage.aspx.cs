using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class VideoManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql1 = "select * from TeacherInfo where TeachId ='" + Session["userId"].ToString() + "'";
            SqlDataReader sdr = DataOperate.GetRow(sql1);
            sdr.Read();
            user.Text = Session["userName"].ToString();
            person.ImageUrl = sdr["TeachPic"].ToString();
            img.ImageUrl = sdr["TeachPic"].ToString();
        }

        protected void quit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void Infosave_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = DataOperate.CreateCon();
                coverimg.SaveAs(Server.MapPath("~/upload/image/") + Path.GetFileName(coverimg.FileName));
                string coverName = Path.GetFileName(coverimg.FileName);
                string coverLink = "~/upload/image/" + Path.GetFileName(coverimg.FileName);
                string teacherName = Session["userName"].ToString();
                string openDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                string sql = "insert into CourseInfo(courseId,courseName,courseType,teacher,cover,intro,target,part,courseLevel,openDate) values('" + courseid.Text + "','" + coursename.Text + "','" + coursetype.SelectedValue + "','" + teacherName + "','" + coverLink + "','" + intro.Text + "','" + target.Text + "','" + part.Text + "','" + courselevel.SelectedValue + "','" + openDate + "')";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                courseid.Text = "";
                coursename.Text = "";
                part.Text = "";
                target.Text = "";
                intro.Text = "";
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('成功新设课程')</script>");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('新设课程失败')</script>");
            }
        }
    }
}