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

                SqlCommand cmd2 = new SqlCommand();
                cmd2.Connection = con;
                cmd2.CommandText = "select * from CourseInfo";
                SqlDataReader reader2 = null;
                try
                {
                    if (con.State == ConnectionState.Closed)
                        con.Open();
                    reader2 = cmd2.ExecuteReader();
                    filecourse.DataSource = reader2;
                    filecourse.DataTextField = "courseName";
                    filecourse.DataValueField = "courseId";
                    filecourse.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
                finally
                {
                    if (reader2.IsClosed == false)
                    {
                        reader2.Close();
                        if (con.State == ConnectionState.Open)
                            con.Close();
                    }
                }
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
                SqlConnection con = DataOperate.CreateCon();
                videopath.SaveAs(Server.MapPath("~/videos/") + Path.GetFileName(videopath.FileName));
                string videoName = Path.GetFileName(videopath.FileName);
                string videoLink = "videos/" + Path.GetFileName(videopath.FileName);
                string sql = "insert into VideoInfo values('" + videoid.Text + "','" + videoName + "','" + videoLink + "','" + videotype.SelectedValue + "','" + videocourse.SelectedValue + "')";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                videotip.Text = "视频上传成功";
                videoid.Text = "";
                videoname.Text = "";
            }
            catch (Exception ex)
            {
                videotip.Text = ex.ToString();
            }
        }
        protected void filesave_Click(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                Boolean FileOk = false;
                string Path = Server.MapPath("~/file/");

                if (filepath.HasFile)
                {
                    string fileExtension = System.IO.Path.GetExtension(filepath.FileName).ToLower();
                    string[] allowedExtensions = { ".pptx", ".docx", "pdf" };
                    for (int i = 0; i < allowedExtensions.Length; i++)
                    {
                        if (fileExtension == allowedExtensions[i])
                        {
                            FileOk = true;
                        }
                    }
                    if (FileOk)
                    {
                        try
                        {
                            filepath.PostedFile.SaveAs(Path + filepath.FileName);
                            string fileName = filepath.FileName;
                            SqlConnection con = DataOperate.CreateCon();
                            string sql = "insert into FileInfo values('" + fileid.Text + "','" + fileName + "','" + filetype.SelectedValue + "'" + filecourse.SelectedValue + "')";
                            SqlCommand cmd = new SqlCommand(sql, con);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            filetip.Text = "文件上传成功";
                            fileid.Text = "";
                            filename.Text = "";
                        }
                        catch
                        {
                            filetip.Text = "File Saved Failed";
                        }
                    }
                }
            }
        }
    }
}