using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Services;

namespace Edu_Online
{
    public partial class AllCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sql = "select * from TeacherInfo where TeachId ='" + Session["userId"].ToString() + "'";
                SqlDataReader sdr = DataOperate.GetRow(sql);
                sdr.Read();
                person.ImageUrl = sdr["TeachPic"].ToString();
                user.Text = sdr["TeachName"].ToString();
                img.ImageUrl = sdr["TeachPic"].ToString();
            }

            Session["userName"] = user.Text;
        }

        protected void quit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        [WebMethod]
        public static List<Dictionary<string, string>> GetAllCourses()
        {
            string sql = "SELECT * FROM CourseInfo";
            SqlDataReader sdr = DataOperate.GetRow(sql);

            var list = new List<Dictionary<string, string>>();

            while (sdr.Read())
            {
                var dic = new Dictionary<string, string>();
                //CourseName cover
                dic.Add("CourseName", sdr["CourseName"].ToString());
                dic.Add("cover", sdr["cover"].ToString());
                list.Add(dic);
            }
            return list;
        }
    }
}