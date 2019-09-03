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
    public partial class StuTeachCourseInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string teachId = Request.QueryString["id"];
            string sql = "select * from TeacherInfo inner join TeacherTypeInfo on TeacherInfo.TeachTypeId = TeacherTypeInfo.TypeId where TeachId='" + teachId + "'";
            SqlDataReader sdr = DataOperate.GetRow(sql);
            sdr.Read();
            Pic.ImageUrl = sdr["TeachPic"].ToString();
            Name.Text = sdr["TeachName"].ToString();
            City.Text = sdr["TeachCity"].ToString();
            Type.Text = sdr["TypeName"].ToString();

            CourseBind();
        }

        protected void CourseBind()
        {
            string teachId = Request.QueryString["id"];
            string sql = "select * from CourseInfo inner join TeacherInfo on CourseInfo.teacher = TeacherInfo.TeachName where TeachId='" + teachId + "'";
            DataSet data = DataOperate.GetDataset(sql, "CourseInfo");
            CourseData.DataSource = data;
            CourseData.DataKeyField = "courseId";
            CourseData.DataBind();
        }

        protected void return_Click(object sender, EventArgs e)
        {
            Response.Redirect("StuTeacherIntro.aspx");
        }
    }
}