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
    public partial class SrcManage : System.Web.UI.Page
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
                SqlCommand cmd1 = new SqlCommand();
                cmd1.Connection = con;
                cmd1.CommandText = "select * from CourseInfo where teacher ='" + user.Text + "'";
                SqlDataReader reader1 = null;
                if (con.State == ConnectionState.Closed)
                    con.Open();
                reader1 = cmd1.ExecuteReader();
                filecourse.DataSource = reader1;
                filecourse.DataTextField = "courseName";
                filecourse.DataValueField = "courseId";
                filecourse.DataBind();
                if (con.State == ConnectionState.Open)
                    con.Close();
                SqlCommand cmd2 = new SqlCommand();
                cmd2.Connection = con;
                cmd2.CommandText = "select * from VideoInfo where CourseId ='" + filecourse.SelectedValue + "'";
                SqlDataReader reader2 = null;
                if (con.State == ConnectionState.Closed)
                    con.Open();
                reader2 = cmd2.ExecuteReader();
                filevideo.DataSource = reader2;
                filevideo.DataTextField = "videoName";
                filevideo.DataValueField = "videoId";
                filevideo.DataBind();
                if (con.State == ConnectionState.Open)
                    con.Close();

            }
        }

        protected void quit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void filesave_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = DataOperate.CreateCon();
                filepath.SaveAs(Server.MapPath("~/upload/file/") + Path.GetFileName(filepath.FileName));
                string fileLink = "~/upload/file/" + Path.GetFileName(filepath.FileName);
                string upTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                string sql = "insert into FileInfo values('" + filename.Text + "','" + fileLink + "','" + filevideo.SelectedValue + "','" + remark.Text + "','" + upTime + "')";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                filename.Text = "";
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('文件上传成功')</script>");
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('文件上传失败')</script>");
            }
        }

        protected void filecourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = DataOperate.CreateCon();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from VideoInfo where CourseId ='" + filecourse.SelectedValue + "'";
            SqlDataReader reader = null;
            if (con.State == ConnectionState.Closed)
                con.Open();
            reader = cmd.ExecuteReader();
            filevideo.DataSource = reader;
            filevideo.DataTextField = "videoName";
            filevideo.DataValueField = "videoId";
            filevideo.DataBind();
            if (con.State == ConnectionState.Open)
                con.Close();
        }
    }
}