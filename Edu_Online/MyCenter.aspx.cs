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
    public partial class MyCenter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                init_Info();
                Course_Info();
                init_Date();
                User_Info();
                Note_Info();
                Note_Info();
                Practice_Done();
                DoneList.Style["display"] = "block";
                TodoList.Style["display"] = "none";

                string item = Request.QueryString["item"].ToString();
                switch (item)
                {
                    case "course":
                        CourseInfo.Visible = true;
                        courseTitle.Style["color"] = "black";
                        break;
                    case "note":
                        NoteInfo.Visible = true;
                        noteTitle.Style["color"] = "black";
                        break;
                    case "work":
                        PracticeInfo.Visible = true;
                        workTitle.Style["color"] = "black";
                        break;
                    case "info":
                        UserInfo.Visible = true;
                        settingTitle.Style["color"] = "black";
                        break;
                }
            }

        }
        protected void init_Info()
        {
            string StuId = Session["userId"].ToString();
            string sql = "select * from StudentInfo inner join StudentTypeInfo on StudentInfo.StuTypeId = StudentTypeInfo.TypeId where StudentInfo.StuId='" + StuId + "'";
            headerDataList.DataSource = DataOperate.GetDataset(sql, "StudentInfo");
            headerDataList.DataKeyField = "StuId";
            headerDataList.DataBind();
        }
        protected void Course_Info()
        {
            string StuId = Session["userId"].ToString();
            string sql = "select * from CourseInfo inner join SCInfo on CourseInfo.courseId = SCInfo.CourseId inner join StudentInfo on StudentInfo.StuId = SCInfo.StuId where SCInfo.StuId='" + StuId + "'";
            CourseInfo.DataSource = DataOperate.GetDataset(sql, "CourseInfo");
            CourseInfo.DataKeyField = "courseId";
            CourseInfo.DataBind();
        }

        protected void drop_Click(object sender, EventArgs e)
        {
            string stuId = Session["userId"].ToString();
            string courseId = ((LinkButton)sender).CommandArgument.ToString();

            string[] sqlT = new string[3];
            int i = 0;
            sqlT[i++] = "update CourseInfo set orderNum=orderNum-1 where courseId='" + courseId + "'";
            sqlT[i++] = "delete from SCInfo where StuId='" + stuId + "' and CourseId='" + courseId + "'";
            sqlT[i] = "delete from LearnRecord where StuId='" + stuId + "' and CourseId='" + courseId + "'";
            if (DataOperate.ExecTransaction(sqlT))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('退课成功！')</script>");
                Course_Info();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('退课失败！')</script>");
            }
        }
        protected void init_Date()
        {
            string stuId = Session["userId"].ToString();
            DateTime now = DateTime.Now;
            int Year = now.Year - 50;
            string sql = "select * from StudentInfo where StuId='" + stuId + "'";
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

        protected void Note_Info()
        {
            string stuId = Session["userId"].ToString();
            string sql = "select * from NoteInfo inner join VideoInfo on NoteInfo.videoId = VideoInfo.videoId inner join CourseInfo on CourseInfo.courseId = VideoInfo.CourseId where stuId='" + stuId + "'";
            NoteInfo.DataSource = DataOperate.GetDataset(sql, "NoteInfo");
            NoteInfo.DataKeyField = "NoteId";
            NoteInfo.DataBind();
        }
        protected void User_Info()
        {
            string stuId = Session["userId"].ToString();
            string sql = "select * from StudentInfo where StuId='" + stuId + "'";
            SqlDataReader sdr = DataOperate.GetRow(sql);
            sdr.Read();
            txtName.Text = sdr["StuName"].ToString();
            txtName.Enabled = false;
            if (sdr["StuSex"].ToString() == "男")
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
            txtCity.Text = sdr["StuCity"].ToString();
            txtCity.Enabled = false;
            txtPhone.Text = sdr["StuPhone"].ToString();
            txtPhone.Enabled = false;
            txtUnit.Text = sdr["StuSchool"].ToString();
            txtUnit.Enabled = false;
            string type = sdr["StuTypeId"].ToString();
            string major = sdr["StuMajor"].ToString();
            UserType.Enabled = false;
            MajorCourse.Enabled = false;
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
            string TypeName = UserType.SelectedValue;
            string type_sql = "select * from StudentInfo inner join StudentTypeInfo on StudentInfo.StuTypeId = StudentTypeInfo.TypeId";
            SqlDataReader sdr = DataOperate.GetRow(type_sql);
            sdr.Read();
            string TypeId = sdr["StuTypeId"].ToString();
            string Major = MajorCourse.SelectedValue;
            string City = txtCity.Text;
            string Unit = txtUnit.Text;
            string Phone = txtPhone.Text;
            UploadPic.SaveAs(Server.MapPath("~/upload/image/") + Path.GetFileName(UploadPic.FileName));
            string picName = Path.GetFileName(UploadPic.FileName);
            string picLink = "~/upload/image/" + Path.GetFileName(UploadPic.FileName);
            string sql = "update StudentInfo set StuName='" + Name + "', StuSex='" + Sex + "',BirthYear='" + Year + "', BirthMonth='" + Month + "',BirthDay='" + Day + "',StuTypeId='" + TypeId + "',StuCity='" + City + "',StuSchool='" + Unit + "',StuMajor='" + Major + "', StuPhone='" + Phone + "',StuPic='" + picLink + "' where StuId='" + userId + "'";
            if (DataOperate.ExecSQL(sql))
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
            UserType.Enabled = true;
            MajorCourse.Enabled = true;
            UploadPic.Enabled = true; ;
        }

        protected void Practice_Done()
        {
            string userId = Session["userId"].ToString();
            string sql = "select * from PracticeInfo inner join SCInfo on PracticeInfo.courseId = SCInfo.CourseId inner join CourseInfo on CourseInfo.courseId = SCInfo.CourseId inner join VideoInfo on VideoInfo.VideoId = PracticeInfo.videoId inner join AnswerResult on PracticeInfo.practiceId = AnswerResult.practiceId where PracticeInfo.practiceId in (select practiceId from AnswerResult where stuId = '" + userId + "') and SCInfo.StuId = '" + userId + "'";
            DoneList.DataSource = DataOperate.GetDataset(sql, "PracticeInfo");
            DoneList.DataKeyNames = new string[] { "practiceId" };
            DoneList.DataBind();
        }

        protected void Practice_Todo()
        {
            string userId = Session["userId"].ToString();
            string sql = "select * from PracticeInfo inner join SCInfo on PracticeInfo.courseId = SCInfo.CourseId  inner join CourseInfo on CourseInfo.courseId = SCInfo.CourseId inner join VideoInfo on VideoInfo.VideoId = PracticeInfo.videoId where PracticeInfo.practiceId not in (select practiceId from AnswerResult where stuId = '" + userId + "') and SCInfo.StuId = '" + userId + "'";
            TodoList.DataSource = DataOperate.GetDataset(sql, "PracticeInfo");
            TodoList.DataKeyNames = new string[] { "practiceId" };
            TodoList.DataBind();
        }

        protected void myCourse_Click(object sender, EventArgs e)
        {
            CourseInfo.Visible = true;
            courseTitle.Style["color"] = "black";
            NoteInfo.Visible = false;
            noteTitle.Style["color"] = "#676767";
            PracticeInfo.Visible = false;
            workTitle.Style["color"] = "#676767";
            UserInfo.Visible = false;
            settingTitle.Style["color"] = "#676767";
        }

        protected void myNote_Click(object sender, EventArgs e)
        {
            CourseInfo.Visible = false;
            courseTitle.Style["color"] = "#676767";
            NoteInfo.Visible = true;
            noteTitle.Style["color"] = "black";
            PracticeInfo.Visible = false;
            workTitle.Style["color"] = "#676767";
            UserInfo.Visible = false;
            settingTitle.Style["color"] = "#676767";
        }

        protected void myWork_Click(object sender, EventArgs e)
        {
            CourseInfo.Visible = false;
            courseTitle.Style["color"] = "#676767";
            NoteInfo.Visible = false;
            noteTitle.Style["color"] = "#676767";
            PracticeInfo.Visible = true;
            workTitle.Style["color"] = "black";
            UserInfo.Visible = false;
            settingTitle.Style["color"] = "#676767";
        }

        protected void mySetting_Click(object sender, EventArgs e)
        {
            CourseInfo.Visible = false;
            courseTitle.Style["color"] = "#676767";
            NoteInfo.Visible = false;
            noteTitle.Style["color"] = "#676767";
            PracticeInfo.Visible = false;
            workTitle.Style["color"] = "#676767";
            UserInfo.Visible = true;
            settingTitle.Style["color"] = "black";
        }

        protected void PracticeStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (PracticeStatus.SelectedValue == "done")
            {
                Practice_Done();
                DoneList.Style["display"] = "block";
                TodoList.Style["display"] = "none";
            }
            else
            {
                Practice_Todo();
                TodoList.Style["display"] = "block";
                DoneList.Style["display"] = "none";
            }
        }

        protected void return_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("StuHeader.aspx");
        }
    }
}