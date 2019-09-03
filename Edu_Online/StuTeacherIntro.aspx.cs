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
    public partial class StuTeacherIntro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql = "select * from StudentInfo where StuId ='" + Session["userId"].ToString() + "'";
            SqlDataReader sdr = DataOperate.GetRow(sql);
            sdr.Read();
            user.Text = sdr["StuName"].ToString();
            userImg.ImageUrl = sdr["StuPic"].ToString();

            TeacherBind();
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

        protected void TeacherBind()
        {
            string sql = "select * from TeacherInfo inner join TeacherTypeInfo on TeacherInfo.TeachTypeId = TeacherTypeInfo.TypeId";
            DataSet data = DataOperate.GetDataset(sql, "TeacherInfo");
            TeacherData.DataSource = data;
            TeacherData.DataKeyField = "TeachId";
            TeacherData.DataBind();
        }
    }
}