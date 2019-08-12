using System;
using System.Collections.Generic;
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
            user.Text = Session["userName"].ToString();
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

        protected void gvopened_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = gvopened.DataKeys[e.RowIndex].Value.ToString();
            string sqlDel = "delete CourseInfo where courseId='" + id + "'";
            DataOperate.ExecSQL(sqlDel);
            BindInfo();
            ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('删除成功')</script>");
        }

        protected void BindInfo()
        {
            string sqlinit = "select * from CourseInfo";
            gvopened.DataSource = DataOperate.GetDataset(sqlinit, "CourseInfo");
            gvopened.DataKeyNames = new string[] { "courseId" };
            gvopened.DataBind();
        }
    }
}