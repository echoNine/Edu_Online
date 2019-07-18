using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Edu_Online
{
    public partial class Up : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = DataOperate.CreateCon();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from CourseInfo";
            SqlDataReader reader = null;
            try
            {
                if (con.State == ConnectionState.Closed)
                    con.Open();
                reader = cmd.ExecuteReader();
                course.DataSource = reader;
                course.DataTextField = "courseName";
                course.DataValueField = "courseId";
                course.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                if (reader.IsClosed == false)
                {
                    reader.Close();
                    if (con.State == ConnectionState.Open)
                        con.Close();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = DataOperate.CreateCon();
                path.SaveAs(Server.MapPath("~/videos/") + Path.GetFileName(path.FileName));
                string Title = Path.GetFileName(path.FileName);
                string Link = "videos/" + Path.GetFileName(path.FileName);
                string sql = "insert into VideoInfo values('" + id.Text + "','" + name.Text + "','" + Title + "','" + Link + "','" + type.SelectedValue + "','1001')";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                tip.Text = "Video Saved Successfully";
                id.Text = "";
                name.Text = "";
            }
            catch (Exception ex)
            {
                tip.Text = ex.ToString();
            }

        }
    }
}