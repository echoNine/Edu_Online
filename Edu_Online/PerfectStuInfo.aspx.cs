using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class PerfectStuInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            init_Date();
            User_Info();
        }

        protected void init_Date()
        {
            DateTime now = DateTime.Now;
            int Year = now.Year - 50;
            for (int i = 0; i < 50; i++)
            {
                string value = (Year + i).ToString();
                year.Items.Add(new ListItem(value, value));
            }

            for (int i = 1; i <= 12; i++)
            {
                string value = i.ToString();
                month.Items.Add(new ListItem(value, value));
            }

            for (int i = 1; i <= 31; i++)
            {
                string value = i.ToString();
                day.Items.Add(new ListItem(value, value));
            }
        }

        protected void User_Info()
        {
            string stuId = Session["userId"].ToString();
            string sql = "select * from StudentInfo where StuId='" + stuId + "'";
            SqlDataReader sdr = DataOperate.GetRow(sql);
            sdr.Read();
            StuId.Text = sdr["StuId"].ToString();
        }
        protected void save_Click(object sender, EventArgs e)
        {
            string userId = Session["userId"].ToString();
            string Name = txtName.Text;
            string Sex = "";
            if (Female.Checked)
            {
                Sex = Female.Text;
            }
            else
            {
                Sex = Male.Text;
            }
            string Year = year.SelectedValue;
            string Month = month.SelectedValue;
            string Day = day.SelectedValue;
            string TypeName = UserType.SelectedValue;
            string type_sql = "select * from StudentInfo inner join StudentTypeInfo on StudentInfo.StuTypeId = StudentTypeInfo.TypeId";
            SqlDataReader sdr = DataOperate.GetRow(type_sql);
            sdr.Read();
            string TypeId = sdr["StuTypeId"].ToString();
            string Major = MajorCourse.SelectedValue;
            string City = txtCity.Text;
            string Unit = txtUnit.Text;
            string Phone = txtPhone.Text;
            string filepath = "~/upload/image/";     //文件路径

            //判断服务器目录是否存在
            if (System.IO.Directory.Exists(filepath) == false)//如果不存在就创建file文件夹
            {
                System.IO.Directory.CreateDirectory(filepath);
            }

            UploadPic.SaveAs(Server.MapPath(filepath) + Path.GetFileName(UploadPic.FileName));
            string picName = Path.GetFileName(UploadPic.FileName);
            string picLink = filepath + Path.GetFileName(UploadPic.FileName);
            string sql = "update StudentInfo set StuName='" + Name + "', StuSex='" + Sex + "',BirthYear='" + Year + "', BirthMonth='" + Month + "',BirthDay='" + Day + "',StuTypeId='" + TypeId + "',StuCity='" + City + "',StuSchool='" + Unit + "',StuMajor='" + Major + "', StuPhone='" + Phone + "',StuPic='" + picLink + "' where StuId='" + userId + "'";
            if (DataOperate.ExecSQL(sql))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('成功完善个人信息')</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('个人信息完善失败，请重试')</script>");   //提示注册失败
            }
        }
    }
}