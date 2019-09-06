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
    public partial class AddTeacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                init_Info();
                init_Date();
                User_Info();
            }
        }

        protected void init_Info()
        {
            string sql = "select * from TeacherInfo where TeachId ='" + Session["userId"].ToString() + "'";
            SqlDataReader sdr = DataOperate.GetRow(sql);
            sdr.Read();
            user.Text = Session["userName"].ToString();
            person.ImageUrl = sdr["TeachPic"].ToString();
            img.ImageUrl = sdr["TeachPic"].ToString();
        }
        protected void init_Date()
        {
            string TeachId = Session["userId"].ToString();
            DateTime now = DateTime.Now;
            int Year = now.Year - 50;
            string sql = "select * from TeacherInfo where TeachId='" + TeachId + "'";
            SqlDataReader sdr = DataOperate.GetRow(sql);
            sdr.Read();
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
            string teachId = Session["userId"].ToString();
            string sql = "select * from TeacherInfo where TeachId='" + teachId + "'";
            SqlDataReader sdr = DataOperate.GetRow(sql);
            sdr.Read();
            txtName.Text = sdr["TeachName"].ToString();
            txtName.Enabled = false;
            if (sdr["TeachSex"].ToString() == "男")
            {
                Male.Checked = true;
            }
            else
            {
                Female.Checked = true;
            }
            Male.Enabled = false;
            Female.Enabled = false;
            string birthYear = sdr["BirthYear"].ToString();
            string birthMonth = sdr["BirthMonth"].ToString();
            string birthDay = sdr["BirthDay"].ToString();
            year.Items.FindByValue(birthYear).Selected = true;
            month.Items.FindByValue(birthMonth).Selected = true;
            day.Items.FindByValue(birthDay).Selected = true;
            year.Enabled = false;
            month.Enabled = false;
            day.Enabled = false;
            txtCity.Text = sdr["TeachCity"].ToString();
            txtCity.Enabled = false;
            txtPhone.Text = sdr["TeachPhone"].ToString();
            txtPhone.Enabled = false;
            txtUnit.Text = sdr["TeachUnit"].ToString();
            txtUnit.Enabled = false;
            txtIntro.Text = sdr["intro"].ToString();
            txtIntro.Enabled = false;
            string type = sdr["TeachTypeId"].ToString();
            string major = sdr["TeachMajor"].ToString();
            TeachType.Enabled = false;
            TeachMajor.Enabled = false;
            UploadPic.Enabled = false;
        }
        protected void save_Click(object sender, EventArgs e)
        {
            save.Enabled = false;
            update.Enabled = true;
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
            string Type = TeachType.SelectedValue;
            string Major = TeachMajor.SelectedValue;
            string City = txtCity.Text;
            string Unit = txtUnit.Text;
            string Intro = txtIntro.Text;
            string Phone = txtPhone.Text;
            string filepath = "~/upload/image/";     //文件路径
            string serverPath = Server.MapPath(filepath);
            //判断服务器目录是否存在
            if (System.IO.Directory.Exists(serverPath) == false)//如果不存在就创建文件夹
            {
                System.IO.Directory.CreateDirectory(serverPath);
            }
            UploadPic.SaveAs(serverPath + Path.GetFileName(UploadPic.FileName));
            string picName = Path.GetFileName(UploadPic.FileName);
            string picLink = filepath + Path.GetFileName(UploadPic.FileName);
            string[] sqlT = new string[2];
            int i = 0;
            sqlT[i++] = "update TeacherInfo set TeachName='" + Name + "', TeachSex='" + Sex + "',BirthYear='" + Year + "', BirthMonth='" + Month + "',BirthDay='" + Day + "',TeachTypeId='" + Type + "',TeachCity='" + City + "',TeachUnit='" + Unit + "', TeachPhone='" + Phone + "',TeachMajor='" + Major + "',intro='" + Intro + "',TeachPic='" + picLink + "'where TeachId='" + userId + "'";
            sqlT[i] = "update CourseInfo set teacher='" + Name + "'where teacher='" + Session["userName"].ToString()+"'";
            if (DataOperate.ExecTransaction(sqlT))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('成功完善个人信息')</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('个人信息完善失败，请重试')</script>");   //提示注册失败
            }
            init_Info();
            User_Info();
        }

        protected void update_Click(object sender, EventArgs e)
        {
            save.Enabled = true;
            update.Enabled = false;
            txtName.Enabled = true;
            Male.Enabled = true;
            Female.Enabled = true;
            year.Enabled = true;
            month.Enabled = true;
            day.Enabled = true;
            txtCity.Enabled = true;
            txtPhone.Enabled = true;
            txtUnit.Enabled = true;
            txtIntro.Enabled = true;
            TeachType.Enabled = true;
            TeachMajor.Enabled = true;
            UploadPic.Enabled = true;
        }

        protected void quit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

    }
}