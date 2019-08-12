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
    public partial class AllCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sql = "";
                string type = Session["entryType"].ToString();
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
                }
                Session["userName"] = user.Text;
                }
            }

        protected void quit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}