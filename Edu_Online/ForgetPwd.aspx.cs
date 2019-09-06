using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class ForgetPwd : System.Web.UI.Page
    {
        string str = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                firstImg.Visible = true;
                secondImg.Visible = false;
                thirdImg.Visible = false;
                first.Visible = true;
                second.Visible = false;
                third.Visible = false;
            }
        }

        protected void find_Click(object sender, EventArgs e)
        {
            string mail = txtMail.Text;
            SqlConnection con = DataOperate.CreateCon();
            con.Open();
            string sql1 = "select count(*) from TeacherInfo where TeachId = '" + mail + "'";
            string sql2 = "select count(*) from StudentInfo where StuId = '" + mail + "'";
            SqlCommand cmd1 = new SqlCommand(sql1, con);
            SqlCommand cmd2 = new SqlCommand(sql2, con);
            Session["mail"] = mail;
            if ((Convert.ToInt32(cmd1.ExecuteScalar()) > 0) || (Convert.ToInt32(cmd2.ExecuteScalar()) > 0))
            {
                firstImg.Visible = false;
                secondImg.Visible = true;
                thirdImg.Visible = false;
                first.Visible = false;
                second.Visible = true;
                third.Visible = false;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('该邮箱未被注册')</script>");
            }
        }

        protected void getcode_Click(object sender, EventArgs e)
        {
            String To = Session["Mail"].ToString();
            Random random = new Random(Guid.NewGuid().GetHashCode());
            int code = random.Next(100000, 1000000);
            string content = "您正在使用邮箱安全验证服务，您本次操作的验证码是：" + code;

            string strSmtpServer = ConfigurationManager.AppSettings["STR_SMTP_SERVER"];
            string strFrom = ConfigurationManager.AppSettings["STR_SMTP_FROM"];
            string strFromPass = ConfigurationManager.AppSettings["STR_SMTP_PASSWORD"];
            SendEmail(strSmtpServer, strFrom, strFromPass, To, "忘记密码", content);
            Session["code"] = code;
        }

        public void SendEmail(string strSmtpServer, string strFrom, string strFromPass, string strto, string strSubject, string strBody)
        {
            System.Net.Mail.SmtpClient client = new SmtpClient(strSmtpServer);
            client.Credentials = new System.Net.NetworkCredential(strFrom, strFromPass);
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            System.Net.Mail.MailMessage message = new MailMessage(strFrom, strto, strSubject, strBody);
            message.BodyEncoding = System.Text.Encoding.UTF8;
            message.IsBodyHtml = true;
            client.Send(message);
            ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('已发送')</script>");
        }

        protected void check_Click(object sender, EventArgs e)
        {
            string code = txtCode.Text.ToString();
            string str = Session["code"].ToString();
            if (str == code)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('验证成功 请重置密码')</script>");
                firstImg.Visible = false;
                secondImg.Visible = false;
                thirdImg.Visible = true;
                first.Visible = false;
                second.Visible = false;
                third.Visible = true;
                tip.Text += txtMail.Text;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('验证码有误')</script>");
            }
        }

        protected void change_Click(object sender, EventArgs e)
        {
            string newpass = newone.Text.ToString();
            string sql1 = "update TeacherInfo set TeachPassword ='" + newpass + "' where TeachId='" + Session["Mail"].ToString() + "'";
            string sql2 = "update StudentInfo set StuPassword ='" + newpass + "' where StuId='" + Session["Mail"].ToString() + "'";
            SqlConnection con = DataOperate.CreateCon();
            con.Open();
            SqlCommand cmd1 = new SqlCommand(sql1, con);
            SqlCommand cmd2 = new SqlCommand(sql2, con);
            if (cmd1.ExecuteNonQuery() > 0 || cmd2.ExecuteNonQuery() > 0)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "true", "<script>alert('密码重置成功 请重新登录');window.location.href='Index.aspx'</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", " <script>alert('密码重置失败')</script>");
            }
        }
    }
}