using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class PartList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string courseId = Request.QueryString["courseId"];
            string sql = "select * from VideoInfo where CourseId =" + courseId;
            DataList1.DataSource = DataOperate.GetDataset(sql, "VideoInfo");
            DataList1.DataKeyField = "VideoId";
            DataList1.DataBind();
        }
    }
}