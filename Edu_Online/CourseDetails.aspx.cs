using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class CommentList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string courseId = Request.QueryString["courseId"];
            string sql = "select * from CourseInfo inner join VideoInfo on CourseInfo.courseId = VideoInfo.CourseId where CourseInfo.courseId=" + courseId;
            SqlDataReader sdr = DataOperate.GetRow(sql);
            sdr.Read();
            video.Src = sdr["VideoPath"].ToString();
            maininfo_top.Text= sdr["intro"].ToString();
            maininfo_bottom.Text = sdr["target"].ToString();
        }
    }
}