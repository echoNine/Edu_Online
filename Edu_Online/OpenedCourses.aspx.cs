using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class OpenedCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindInfo();
            string sql1 = "select * from TeacherInfo where TeachId ='" + Session["userId"].ToString() + "'";
            SqlDataReader sdr = DataOperate.GetRow(sql1);
            sdr.Read();
            user.Text = Session["userName"].ToString();
            person.ImageUrl = sdr["TeachPic"].ToString();
            img.ImageUrl = sdr["TeachPic"].ToString();
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
                    sql = "select * from CourseInfo inner join CourseType on CourseInfo.courseType = CourseType.courseTypeId where CourseInfo.teacher='" + Session["userName"].ToString() + "'";
                    break;
                case 1:
                    sql = "select * from CourseInfo inner join CourseType on CourseInfo.courseType = CourseType.courseTypeId where CourseInfo.teacher='" + Session["userName"].ToString() + "' and courseId like " + selectkey.Value;
                    break;
                case 2:
                    sql = "select * from CourseInfo inner join CourseType on CourseInfo.courseType = CourseType.courseTypeId where CourseInfo.teacher='" + Session["userName"].ToString() + "' and courseName like '" + selectkey.Value + "'";
                    break;
                case 3:
                    sql = "select * from CourseInfo inner join CourseType on CourseInfo.courseType = CourseType.courseTypeId where CourseInfo.teacher='" + Session["userName"].ToString() + "' and courseTypeName like '" + selectkey.Value + "'";
                    break;
            }
            gvopened.DataSource = DataOperate.GetDataset(sql, "CourseInfo");
            gvopened.DataKeyNames = new string[] { "courseId" };
            gvopened.DataBind();
        }

        protected void gvopened_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = gvopened.DataKeys[e.RowIndex].Value.ToString();
            string sqlDel = "delete CourseInfo where courseId='" + id + "'";
            if (DataOperate.ExecSQL(sqlDel))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('删除成功')</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('删除失败')</script>");
            }

            BindInfo();

        }

        protected void BindInfo()
        {
            string sqlinit = "select * from CourseInfo inner join CourseType on CourseInfo.courseType = CourseType.courseTypeId where CourseInfo.teacher='" + Session["userName"].ToString() + "'";
            gvopened.DataSource = DataOperate.GetDataset(sqlinit, "CourseInfo");
            gvopened.DataKeyNames = new string[] { "courseId" };
            gvopened.DataBind();
        }
    }
}