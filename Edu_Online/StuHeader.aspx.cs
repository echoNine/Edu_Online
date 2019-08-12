using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class StuHeader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sql = "";
                string type = Session["entryType"].ToString();
                string userId = "";
                if (type == "教师")
                {
                    sql = "select * from TeacherInfo where TeachId ='" + Session["userId"].ToString() + "'";
                    SqlDataReader sdr = DataOperate.GetRow(sql);
                    sdr.Read();
                    user.Text = sdr["TeachName"].ToString();
                }
                else
                {
                    sql = "select * from StudentInfo where StuId ='" + Session["userId"].ToString() + "'";
                    SqlDataReader sdr = DataOperate.GetRow(sql);
                    sdr.Read();
                    user.Text = sdr["StuName"].ToString();
                    userImg.ImageUrl = sdr["StuPic"].ToString();
                }
            }
        }

        protected void myCourse_Click(object sender, EventArgs e)
        {
            string userId = Session["userId"].ToString();
            Response.Redirect("MyCenter.aspx?stuId=userId");
        }
    }
}