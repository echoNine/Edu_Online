using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class Header : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sql = "";
                string type = Session["entryType"].ToString();
                SqlConnection con = DataOperate.CreateCon();
                con.Open();
                if (type == "教师")
                {
                    sql = "select * from TeacherInfo where TeachId ='" + Session["userId"].ToString() + "'";
                    SqlDataReader sdr = DataOperate.GetRow(sql);
                    sdr.Read();
                    who.Text = sdr["TeachName"].ToString();
                    name.Text = sdr["TeachName"].ToString();
                }
                else
                {
                    sql = "select * from StudentInfo where StuId ='" + Session["userId"].ToString() + "'";
                    SqlDataReader sdr = DataOperate.GetRow(sql);
                    sdr.Read();
                    who.Text = sdr["StuName"].ToString();
                    name.Text = sdr["StuName"].ToString();
                }
                Session["userName"] = name.Text;
                SqlCommand cmd1 = new SqlCommand();
                cmd1.Connection = con;
                cmd1.CommandText = "select * from CourseInfo";
                SqlDataReader reader1 = null;
                try
                {
                    if (con.State == ConnectionState.Closed)
                        con.Open();
                    reader1 = cmd1.ExecuteReader();
                    videocourse.DataSource = reader1;
                    videocourse.DataTextField = "courseName";
                    videocourse.DataValueField = "courseId";
                    videocourse.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
                finally
                {
                    if (reader1.IsClosed == false)
                    {
                        reader1.Close();
                        if (con.State == ConnectionState.Open)
                            con.Close();
                    }
                }

                string sqlinit = "select * from CourseInfo";
                gvopened.DataSource = DataOperate.GetDataset(sqlinit, "CourseInfo");
                gvopened.DataKeyNames = new string[] { "courseId" };
                gvopened.DataBind();
            }
        }

        protected void quit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void select_Click(object sender, EventArgs e)
        {
            string sql = "";
            int item = selectcourse.SelectedIndex;
            switch (item)
            {
                case 0:
                    sql = "select * from CourseInfo";
                    break;
                case 1:
                    sql = "select * from CourseInfo where courseId like " + selectkey.Value;
                    break;
                case 2:
                    sql = "select * from CourseInfo where courseName like '" + selectkey.Value + "'";
                    break;
                case 3:
                    sql = "select * from CourseInfo where courseType like '" + selectkey.Value + "'";
                    break;
            }
            gvopened.DataSource = DataOperate.GetDataset(sql, "CourseInfo");
            gvopened.DataKeyNames = new string[] { "courseId" };
            gvopened.DataBind();
        }

        protected void coursesave_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = DataOperate.CreateCon();
                coverimg.SaveAs(Server.MapPath("~/upload/images/") + Path.GetFileName(coverimg.FileName));
                string coverName = Path.GetFileName(coverimg.FileName);
                string coverLink = "upload/images/" + Path.GetFileName(coverimg.FileName);
                string teacherName = Session["userName"].ToString();
                string sql = "insert into CourseInfo values('" + courseid.Text + "','" + coursename.Text + "','" + coursetype.SelectedValue + "','" + teacherName + "','" + coverLink + "'," + count.Text + ",'" + intro.Text + "','" + target.Text + "','" + part.Text + "')";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                courseid.Text = "";
                coursename.Text = "";
                part.Text = "";
                count.Text = "";
                target.Text = "";
                intro.Text = "";
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('成功新添信息')</script>");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('新添信息失败')</script>");
            }
        }

        protected void videosave_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = DataOperate.CreateCon();
                videopath.SaveAs(Server.MapPath("~/upload/videos/") + Path.GetFileName(videopath.FileName));
                string videoName = Path.GetFileName(videopath.FileName);
                string videoLink = "upload/videos/" + Path.GetFileName(videopath.FileName);
                string sql = "insert into VideoInfo values('" + videoid.Text + "','" + videoName + "','" + videoLink + "','" + videotype.SelectedValue + "','" + videocourse.SelectedValue + "')";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close(); 
                videoid.Text = "";
                videoname.Text = "";
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('视频上传成功')</script>");

            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('视频上传失败')</script>");
            }
        }
        protected void filesave_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = DataOperate.CreateCon();
                filepath.SaveAs(Server.MapPath("~/upload/files/") + Path.GetFileName(filepath.FileName));
                string fileLink = "upload/files/" + Path.GetFileName(videopath.FileName);
                string sql = "insert into FileInfo values('" + fileid.Text + "','" + filename.Text + "','" + fileLink + "','" + filetype.SelectedValue + "'," + filecourse.SelectedValue + ")";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                fileid.Text = "";
                filename.Text = "";
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('文件上传成功')</script>");
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('文件上传失败')</script>");
            }
        }

        protected void gvopened_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = gvopened.DataKeys[e.RowIndex].Value.ToString();
            string sqlDel = "delete CourseInfo where courseId='" + id + "'";
            DataOperate.ExecSQL(sqlDel);
            string sqlinit = "select * from CourseInfo";
            gvopened.DataSource = DataOperate.GetDataset(sqlinit, "CourseInfo");
            gvopened.DataKeyNames = new string[] { "courseId" };
            gvopened.DataBind();
            ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('删除成功')</script>");
        }
    }
}