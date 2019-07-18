using System;
using System.Collections.Generic;
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
        protected void submit_Click(object sender, EventArgs e)
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
            string Birth = year.SelectedValue + "-" + month.SelectedValue + "-" + day.SelectedValue;
            string Type = TeacherType.SelectedValue;
            string Course = TeachCourse.SelectedValue;
            string City = txtCity.Text;
            string Unit = txtUnit.Text;
            string Phone = txtPhone.Text;

            string sql = "update TeacherInfo set TeachName='" + Name + "', TeachSex='" + Sex + "',TeachBirth='" + Birth + "', TeachTypeId='" + Type + "',TeachCity='" + City + "',TeachUnit='" + Unit + "',TeacheCourse='" + Course + "', TeachPhone='" + Phone + "' where TeachId='" + userId + "'";
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