using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class PracticeUpload : System.Web.UI.Page
    {

        private DataTable FillTable(string sql)
        {
            using (SqlConnection con = DataOperate.CreateCon())
            {
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                beginDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                courseTitle.DataSource = FillTable("select * from VideoInfo");
                courseTitle.DataTextField = "VideoTitle";
                courseTitle.DataValueField = "VideoId";
                courseTitle.DataBind();
            }
        }

        protected void calendarImg_Click(object sender, EventArgs e)
        {
            Calendar.Visible = !Calendar.Visible;
        }
        protected void Calendar_SelectionChanged(object sender, EventArgs e)
        {
            deadLine.Text = Calendar.SelectedDate.ToShortDateString();
            Calendar.Visible = false;
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string practiceId = id.Text;
            string practiceTitle = "";
            string practiceCount = count.Text;
            string practiceCourseTitle = courseTitle.Text;
            string practiceDifficulty = difficulty.SelectedValue;
            string begin = beginDate.Text;
            string end = deadLine.Text;

            if (Page.IsPostBack)
            {
                Boolean FileOk = false;
                string Path = Server.MapPath("~/practice/");
                if (content.HasFile)
                {
                    string fileExtension = System.IO.Path.GetExtension(content.FileName).ToLower();
                    string[] allowedExtensions = { ".txt", ".docx", ".pdf" };
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
                            content.PostedFile.SaveAs(Path + content.FileName);
                            practiceTitle = content.FileName;
                            SqlConnection con = DataOperate.CreateCon();
                            string sql = "insert into PracticeInfo values('" + practiceId + "','" + practiceTitle + "'," + practiceCount + ",'" + practiceCourseTitle + "','" + practiceDifficulty + "','" + begin + "','" + end + "')";
                            SqlCommand cmd = new SqlCommand(sql, con);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            tip.Text = "Practice Uploaded Successfully";
                            id.Text = "";
                            count.Text = "";
                            beginDate.Text = "";
                            deadLine.Text = "";
                        }
                        catch
                        {
                            tip.Text = "Practice Uploaded Failed";
                        }
                    }
                }
            }
        }

    }
}