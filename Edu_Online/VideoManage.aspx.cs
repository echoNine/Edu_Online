using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class VideoManage1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sql = "select * from TeacherInfo where TeachId ='" + Session["userId"].ToString() + "'";
                SqlDataReader sdr = DataOperate.GetRow(sql);
                sdr.Read();
                user.Text = Session["userName"].ToString();
                person.ImageUrl = sdr["TeachPic"].ToString();
                img.ImageUrl = sdr["TeachPic"].ToString();
                SqlConnection con = DataOperate.CreateCon();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "select * from CourseInfo where teacher ='" + user.Text + "'";
                SqlDataReader reader = null;
                if (con.State == ConnectionState.Closed)
                    con.Open();
                reader = cmd.ExecuteReader();
                videocourse.DataSource = reader;
                videocourse.DataTextField = "courseName";
                videocourse.DataValueField = "courseId";
                videocourse.DataBind();
            }

        }

        protected void quit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void videosave_Click(object sender, EventArgs e)
        {
            try
            {
                string videoName = videoname.Text;
                SqlConnection con = DataOperate.CreateCon();
                videopath.SaveAs(Server.MapPath("~/upload/video/") + Path.GetFileName(videopath.FileName));
                string videoLink = "~/upload/video/" + Path.GetFileName(videopath.FileName);
                string sql = "insert into VideoInfo values('" + videoName + "','" + videoLink + "','" + videocourse.SelectedValue + "')";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                videoname.Text = "";
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('视频上传成功')</script>");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('视频上传失败')</script>");
            }
        }

    }
}