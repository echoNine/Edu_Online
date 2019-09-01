using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loginInfo.Visible = true;
                registerInfoTeach.Visible = false;
                registerInfoStu.Visible = false;
                show_login.Style["border-bottom"]= "2px solid #3f9ae8";
                show_register.Style["border-bottom"] = "2px solid #cdd2d6";
            }

        }

        protected void show_login_Click(object sender, EventArgs e)
        {
            loginInfo.Visible = true;
            registerInfoTeach.Visible = false;
            registerInfoStu.Visible = false;
            show_login.Style["border-bottom"] = "2px solid #3f9ae8";
            show_register.Style["border-bottom"] = "2px solid #cdd2d6";
        }

        protected void show_register_Click(object sender, EventArgs e)
        {
            loginInfo.Visible = false;
            registerInfoTeach.Visible = true;
            registerInfoStu.Visible = false;
            show_login.Style["border-bottom"] = "2px solid #cdd2d6";
            show_register.Style["border-bottom"] = "2px solid #3f9ae8";
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            string userId = txtUserId.Text;
            string Pwd = txtPwd.Text;
            Session["entryType"] = RadioUserType.SelectedValue;
            string cs = Session["entryType"].ToString();
            string sql;
            if (cs == "教师")
            {
                sql = "select count(*) from TeacherInfo where TeachId=@userId and TeachPassword=@Pwd ";
                if (CheckPwd(sql, userId, Pwd))
                {
                    Session["userId"] = userId;
                    Response.Redirect("AllCourses.aspx");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('登录失败')</script>");
                }
            }
            else
            {
                sql = "select count(*) from StudentInfo where StuId=@userId and StuPassword=@Pwd ";
                if (CheckPwd(sql, userId, Pwd))
                {
                    Session["userId"] = userId;
                    Response.Redirect("StuHeader.aspx");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('登录失败')</script>");   //提示登录失败
                }
            }

            
        }

        public static bool CheckPwd(string sql, string userId, string Pwd)
        {
            SqlConnection con = DataOperate.CreateCon();       //创建数据库连接
            con.Open();         //打开数据库连接
            SqlCommand cmd = new SqlCommand(sql, con);        //创建SqlCommand对象
            cmd.Parameters.Add(new SqlParameter("userId", SqlDbType.VarChar, 50));        //设置参数类型
            cmd.Parameters["userId"].Value = userId;        //设置参数值
            cmd.Parameters.Add(new SqlParameter("Pwd", SqlDbType.VarChar, 50));       //设置参数类型
            cmd.Parameters["Pwd"].Value = Pwd;        //设置参数值
                                                      //判断验证用户名和密码是否正确，并返回布尔值
            if (Convert.ToInt32(cmd.ExecuteScalar()) > 0)   //返回指定用户名和密码的记录数大于0，此用户名和密码正确。
            {
                con.Close();
                return true;
            }
            else
            {
                con.Close();
                return false;
            }
        }

        protected void btn_register_Click1(object sender, EventArgs e)
        {
            string userId = userIdTeach.Text;
            string userPwd = userPwdTeach.Text;
            string mailCode = mailTeach.Text;
            string str = Session["code"].ToString();
            if (str == mailCode)
            {
                string sql = "insert into TeacherInfo(TeachId,TeachPassword) values(@userId,@userPwd)";
                SqlConnection con = DataOperate.CreateCon();
                con.Open();
                SqlCommand com = new SqlCommand(sql, con);
                com = new SqlCommand(sql, con);        //创建SqlCommand对象
                com.Parameters.Add(new SqlParameter("@userId", SqlDbType.VarChar, 50));        //设置参数类型
                com.Parameters["@userId"].Value = userId;        //设置参数值
                com.Parameters.Add(new SqlParameter("@userPwd", SqlDbType.VarChar, 50));        //设置参数类型
                com.Parameters["@userPwd"].Value = userPwd;        //设置参数值
                if (com.ExecuteNonQuery() > 0)
                {
                    Session["userId"] = userId;
                    ClientScript.RegisterStartupScript(Page.GetType(), "true", "<script>alert('成功注册新用户，请完善个人信息');window.location.href='PerfectTeachInfo.aspx'</script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('注册失败，请重新注册')</script>");   //提示注册失败
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('验证码有误')</script>");   //提示注册失败
            }
        }

        public void SendEmail1(string strSmtpServer, string strFrom, string strFromPass, string strto, string strSubject, string strBody)
        {
            System.Net.Mail.SmtpClient client = new SmtpClient(strSmtpServer);
            //client.UseDefaultCredentials = true;
            client.Credentials = new System.Net.NetworkCredential(strFrom, strFromPass);
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            System.Net.Mail.MailMessage message = new MailMessage(strFrom, strto, strSubject, strBody);
            message.BodyEncoding = System.Text.Encoding.UTF8;
            message.IsBodyHtml = true;
            client.Send(message);
            ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('已发送')</script>");
        }

        protected void Send_Click1(object sender, EventArgs e)
        {
            string userId = userIdTeach.Text;
            string userPwd = userIdTeach.Text;
            string sql = "select count(*) from TeacherInfo where TeachId=@userId";
            SqlConnection con = DataOperate.CreateCon();
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add(new SqlParameter("@userId", SqlDbType.VarChar, 50));
            cmd.Parameters["@userId"].Value = userId;
            if (Convert.ToInt32(cmd.ExecuteScalar()) == 0)
            {
                String To = userIdTeach.Text;
                Random random = new Random(Guid.NewGuid().GetHashCode());
                int code = random.Next(100000, 1000000);
                string content = "您正在使用邮箱安全验证服务，您本次操作的验证码是：" + code;

                string strSmtpServer = ConfigurationManager.AppSettings["STR_SMTP_SERVER"];
                string strFrom = ConfigurationManager.AppSettings["STR_SMTP_FROM"];
                string strFromPass = ConfigurationManager.AppSettings["STR_SMTP_PASSWORD"];
                SendEmail1(strSmtpServer, strFrom, strFromPass, To, "激活邮箱", content);
                Session["code"] = code;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('该用户已存在')</script>");   //提示注册失败

            }
        }

        protected void btn_register_Click2(object sender, EventArgs e)
        {
            string userId = userIdStu.Text;
            string userPwd = userPwdStu.Text;
            string mailCode = mailStu.Text;
            string str = Session["code"].ToString();
            if (str == mailCode)
            {
                string sql = "insert into StudentInfo(StuId,StuPassword) values(@userId,@userPwd)";
                SqlConnection con = DataOperate.CreateCon();
                con.Open();
                SqlCommand com = new SqlCommand(sql, con);
                com = new SqlCommand(sql, con);        //创建SqlCommand对象
                com.Parameters.Add(new SqlParameter("@userId", SqlDbType.VarChar, 50));        //设置参数类型
                com.Parameters["@userId"].Value = userId;        //设置参数值
                com.Parameters.Add(new SqlParameter("@userPwd", SqlDbType.VarChar, 50));        //设置参数类型
                com.Parameters["@userPwd"].Value = userPwd;        //设置参数值
                if (com.ExecuteNonQuery() > 0)
                {
                    Session["userId"] = userId;
                    ClientScript.RegisterStartupScript(Page.GetType(), "true", "<script>alert('成功注册新用户，请完善个人信息');window.location.href='PerfectStuInfo.aspx'</script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('注册失败，请重新注册')</script>");   //提示注册失败
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('验证码有误')</script>");   //提示注册失败
            }
        }

        public void SendEmail2(string strSmtpServer, string strFrom, string strFromPass, string strto, string strSubject, string strBody)
        {
            System.Net.Mail.SmtpClient client = new SmtpClient(strSmtpServer);
            //client.UseDefaultCredentials = true;
            client.Credentials = new System.Net.NetworkCredential(strFrom, strFromPass);
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            System.Net.Mail.MailMessage message = new MailMessage(strFrom, strto, strSubject, strBody);
            message.BodyEncoding = System.Text.Encoding.UTF8;
            message.IsBodyHtml = true;
            client.Send(message);
            ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('已发送')</script>");
        }

        protected void Send_Click2(object sender, EventArgs e)
        {
            string userId = userIdStu.Text;
            string userPwd = userPwdStu.Text;
            string sql = "select count(*) from StudentInfo where StuId=@userId";
            SqlConnection con = DataOperate.CreateCon();
            con.Open();
            SqlCommand com = new SqlCommand(sql, con);
            com.Parameters.Add(new SqlParameter("@userId", SqlDbType.VarChar, 50));
            com.Parameters["@userId"].Value = userId;
            if (Convert.ToInt32(com.ExecuteScalar()) == 0)
            {
                String To = userIdStu.Text;
                Random random = new Random(Guid.NewGuid().GetHashCode());
                int code = random.Next(100000, 1000000);
                string content = "您正在使用邮箱安全验证服务，您本次操作的验证码是：" + code;
                string strSmtpServer = ConfigurationManager.AppSettings["STR_SMTP_SERVER"];
                string strFrom = ConfigurationManager.AppSettings["STR_SMTP_FROM"];
                string strFromPass = ConfigurationManager.AppSettings["STR_SMTP_PASSWORD"];
                SendEmail2(strSmtpServer, strFrom, strFromPass, To, "激活邮箱", content);
                Session["code"] = code;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('该用户已存在')</script>");   //提示注册失败

            }
        }

        protected void linkStu_Click(object sender, EventArgs e)
        {
            registerInfoStu.Visible = false;
            registerInfoTeach.Visible = true;
        }

        protected void linkTeach_Click(object sender, EventArgs e)
        {
            registerInfoStu.Visible = true;
            registerInfoTeach.Visible = false;
        }
    }
}