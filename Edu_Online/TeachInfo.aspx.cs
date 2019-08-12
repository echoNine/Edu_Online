using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class TeachInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string courseId = Request.QueryString["courseId"];
            string sql1 = "select * from CourseInfo where CourseId =" + courseId;
            SqlDataReader sdr = DataOperate.GetRow(sql1);
            sdr.Read();
            string teacher = sdr["teacher"].ToString();
            string sql2 = "select * from TeacherInfo where TeachName ='" + teacher+"'";
            DataList1.DataSource = DataOperate.GetDataset(sql2, "TeacherInfo");
            DataList1.DataKeyField = "TeachId";
            DataList1.DataBind();
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string courseId = Request.QueryString["courseId"];
                string sql1 = "select * from CourseInfo where CourseId =" + courseId;
                SqlDataReader sdr = DataOperate.GetRow(sql1);
                sdr.Read();
                string teacher = sdr["teacher"].ToString();
                string sql2 = "select * from CourseInfo where teacher ='" + teacher + "'";
                DataList dl2 = (DataList)(e.Item.FindControl("list"));
                dl2.DataSource = DataOperate.GetDataset(sql2, "CourseInfo");
                dl2.DataKeyField = "courseId";
                dl2.DataBind();
            }
        }
    }
}