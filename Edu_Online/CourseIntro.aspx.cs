using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class CourseIndex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Name = Request.QueryString["name"];
                string sql1 = "select * from CourseInfo where courseName =" + Name;
                SqlDataReader sdr = DataOperate.GetRow(sql1);
                sdr.Read();
                img.ImageUrl = sdr["cover"].ToString();
                name.Text = sdr["CourseName"].ToString();
                orderNum.Text = sdr["orderNum"].ToString();
                partCount.Text = sdr["part"].ToString();
                teacherName.Text = sdr["teacher"].ToString();
                maininfo_left.Text = sdr["intro"].ToString();
                maininfo_right.Text = sdr["target"].ToString();

                string sql2 = "select * from CourseInfo inner join VideoInfo on CourseInfo.courseId = VideoInfo.CourseId where courseName =" + Name;
                DataList1.DataSource = DataOperate.GetDataset(sql2, "CourseInfo");
                DataList1.DataKeyField = "courseId";
                DataList1.DataBind();
            }
        }

        protected void close_Click(object sender, ImageClickEventArgs e)
        {
            tipdiv.Visible = false;
        }

        protected void open_Click(object sender, EventArgs e)
        {
            tipdiv.Visible = true;
        }

        protected void return_Click(object sender, EventArgs e)
        {
            Response.Redirect("AllCourses.aspx");
        }
    }
}