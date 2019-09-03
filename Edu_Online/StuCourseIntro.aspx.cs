using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class StuCourseIntro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        protected void join_Click(object sender, EventArgs e)
        {
            string courseId = Request.QueryString["id"];
            string stuId = Session["userId"].ToString();
            string sql = "select * from CourseInfo where courseId =" + courseId;
            SqlDataReader sdr = DataOperate.GetRow(sql);
            sdr.Read();
            string SC_sql = "select count(*) from SCInfo where StuId='" + stuId + "' and CourseId='" + courseId + "' ";
            if (DataOperate.SeleSQL(SC_sql) == 0)
            {
                string[] sqlT = new string[2];
                int i = 0;
                sqlT[i++] = "update CourseInfo set orderNum=orderNum+1 where courseId='" + courseId + "'";
                sqlT[i] = "insert into SCInfo values('" + stuId + "','" + courseId + "')";
                if (DataOperate.ExecTransaction(sqlT))
                {
                    BindData();
                    Response.Redirect("StuCourseDetails.aspx?tip=new&courseId=" + courseId);
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('加入课程失败！')</script>");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('您已加入过此课程！');location.href='StuCourseDetails.aspx?tip=again&courseId=" + courseId + "';</script>");
            }
        }

        protected void return_Click(object sender, EventArgs e)
        {
            Response.Redirect("StuHeader.aspx");
        }

        public void BindData()
        {
            string courseId = Request.QueryString["id"];
            string sql = "select * from CourseInfo where courseId =" + courseId;
            SqlDataReader sdr = DataOperate.GetRow(sql);
            sdr.Read();
            img.ImageUrl = sdr["cover"].ToString();
            name.Text = sdr["CourseName"].ToString();
            orderNum.Text = sdr["orderNum"].ToString();
            partCount.Text = sdr["part"].ToString();
            teacherName.Text = sdr["teacher"].ToString();
            maininfo_left.Text = sdr["intro"].ToString();
            maininfo_right.Text = sdr["target"].ToString();
        }
    }
}