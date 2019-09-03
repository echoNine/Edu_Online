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
    public partial class StuCourseSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql = "select * from StudentInfo where StuId ='" + Session["userId"].ToString() + "'";
            SqlDataReader sdr = DataOperate.GetRow(sql);
            sdr.Read();
            user.Text = sdr["StuName"].ToString();
            userImg.ImageUrl = sdr["StuPic"].ToString();

            classifyInfo.DataSource = DataOperate.GetDataset("select * from CourseType", "CourseType");
            classifyInfo.DataKeyField = "courseTypeId";
            classifyInfo.DataBind();
            string sqlclassify = "";
            string classifyItem = Request.QueryString["classifyItem"];
            string hardLevel = Request.QueryString["hardLevel"];
            if (hardLevel == "全部")
            {
                hardLevel = null;
            }

            if (classifyItem == null && hardLevel == null)
            {
                sqlclassify = "select * from CourseInfo";
            }
            else if (classifyItem == null && hardLevel != null)
            {
                sqlclassify = "select * from CourseInfo inner join CourseType on CourseInfo.courseType = CourseType.courseTypeId where CourseInfo.courseLevel='" + hardLevel + "'";
            }
            else if (classifyItem != null && hardLevel == null)
            {
                sqlclassify = "select * from CourseInfo inner join CourseType on CourseInfo.courseType = CourseType.courseTypeId where CourseType.courseTypeName = '" + classifyItem + "'";
            }
            else
            {
                sqlclassify = "select * from CourseInfo inner join CourseType on CourseInfo.courseType = CourseType.courseTypeId where CourseType.courseTypeName = '" + classifyItem + "'and CourseInfo.courseLevel='" + hardLevel + "'";
            }
            DataSet data = DataOperate.GetDataset(sqlclassify, "CourseInfo");
            CourseDataList.DataSource = data;
            CourseDataList.DataKeyField = "courseId";
            CourseDataList.DataBind();
        }

        protected void myCourse_Click(object sender, EventArgs e)
        {
            string userId = Session["userId"].ToString();
            Response.Redirect("MyCenter.aspx?stuId=userId&item=course");
        }

        protected void myNote_Click(object sender, EventArgs e)
        {
            string userId = Session["userId"].ToString();
            Response.Redirect("MyCenter.aspx?stuId=userId&item=note");
        }

        protected void myWork_Click(object sender, EventArgs e)
        {
            string userId = Session["userId"].ToString();
            Response.Redirect("MyCenter.aspx?stuId=userId&item=work");
        }

        protected void myInfo_Click(object sender, EventArgs e)
        {
            string userId = Session["userId"].ToString();
            Response.Redirect("MyCenter.aspx?stuId=userId&item=info");
        }
    }
}
