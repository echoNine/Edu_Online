using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class MyCenter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string StuId = Session["userId"].ToString();
            string sql1 = "select * from StudentInfo inner join StudentTypeInfo on StudentInfo.StuTypeId = StudentTypeInfo.TypeId where StudentInfo.StuId='" + StuId + "'";
            headerDataList.DataSource = DataOperate.GetDataset(sql1, "StudentInfo");
            headerDataList.DataKeyField = "StuId";
            headerDataList.DataBind();

            string sql2 = "select * from CourseInfo inner join SCInfo on CourseInfo.courseId = SCInfo.CourseId inner join StudentInfo on StudentInfo.StuId = SCInfo.StuId where SCInfo.StuId='" + StuId + "'";
            InfoDataList.DataSource = DataOperate.GetDataset(sql2, "CourseInfo");
            InfoDataList.DataKeyField = "courseId";
            InfoDataList.DataBind();
        }
    }
}