using System;
using System.Collections.Generic;
using System.Data;
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
            classifyInfo.DataSource = DataOperate.GetDataset("select * from CourseType", "CourseType");
            classifyInfo.DataKeyField = "courseTypeId";
            classifyInfo.DataBind();
            string sql = "";
            string classifyItem = Request.QueryString["classifyItem"];
            string hardLevel = Request.QueryString["hardLevel"];
            if (hardLevel == "全部")
            {
                hardLevel = null;
            }

            if (classifyItem == null && hardLevel == null)
            {
                sql = "select * from CourseInfo";
            }
            else if (classifyItem == null && hardLevel != null)
            {
                sql = "select * from CourseInfo inner join CourseType on CourseInfo.courseType = CourseType.courseTypeId where CourseInfo.courseLevel='" + hardLevel + "'";
            }
            else if (classifyItem != null && hardLevel == null)
            {
                sql = "select * from CourseInfo inner join CourseType on CourseInfo.courseType = CourseType.courseTypeId where CourseType.courseTypeName = '" + classifyItem + "'";
            }
            else
            {
                sql = "select * from CourseInfo inner join CourseType on CourseInfo.courseType = CourseType.courseTypeId where CourseType.courseTypeName = '" + classifyItem + "'and CourseInfo.courseLevel='" + hardLevel + "'";
            }
            DataSet data = DataOperate.GetDataset(sql, "CourseInfo");
            CourseDataList.DataSource = data;
            CourseDataList.DataKeyField = "courseId";
            CourseDataList.DataBind();
        }
    }
}
