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
                string sql = "select * from CourseInfo where courseName =" + Name;
                SqlDataReader sdr = DataOperate.GetRow(sql);
                sdr.Read();
                img.ImageUrl = sdr["cover"].ToString();
                name.Text = sdr["CourseName"].ToString();
                restCount.Text = sdr["count"].ToString();
                partCount.Text = sdr["part"].ToString();
                teacherName.Text = sdr["teacher"].ToString();
                maininfo_left.Text = sdr["intro"].ToString();
                maininfo_right.Text = sdr["target"].ToString();
            }
        }

        protected void close_Click(object sender, ImageClickEventArgs e)
        {
            listInfo.Visible = false;
        }

        protected void open_Click(object sender, EventArgs e)
        {
            listInfo.Visible = true;
        }
    }
}