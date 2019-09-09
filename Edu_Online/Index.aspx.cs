using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services;
using MimeKit;

namespace Edu_Online
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod(EnableSession = true)]
        public static string Login(string userId, string Pwd, string entryType)
        {
            HttpContext.Current.Session["entryType"] = entryType;
            string cs = entryType;
            string sql;
            if (cs == "教师")
            {
                sql = "select count(*) from TeacherInfo where TeachId=@userId and TeachPassword=@Pwd ";
                if (CheckPwd(sql, userId, Pwd))
                {
                    HttpContext.Current.Session["userId"] = userId;
                    return "success";
                }
                else
                {
                    return "fail";
                }
            }
            else
            {
                sql = "select count(*) from StudentInfo where StuId=@userId and StuPassword=@Pwd ";
                if (CheckPwd(sql, userId, Pwd))
                {
                    HttpContext.Current.Session["userId"] = userId;
                    return "success";
                }
                else
                {
                    return "fail";
                }
            }
        }

        private static bool CheckPwd(string sql, string userId, string Pwd)
        {
            SqlConnection con = DataOperate.CreateCon();
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add(new SqlParameter("userId", SqlDbType.VarChar, 50));
            cmd.Parameters["userId"].Value = userId;
            cmd.Parameters.Add(new SqlParameter("Pwd", SqlDbType.VarChar, 50));
            cmd.Parameters["Pwd"].Value = Pwd;
            if (Convert.ToInt32(cmd.ExecuteScalar()) > 0)
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

        [WebMethod(EnableSession = true)]
        public static string ToRegister(string userId, string Pwd, string entryType, string mailCode)
        {
            string MailCode = mailCode;
            string str = HttpContext.Current.Session["code"].ToString();
            string sql = "";
            if (str == MailCode)
            {
                if ("teacher" == entryType)
                {
                    sql = "insert into TeacherInfo(TeachId,TeachPassword) values(@userId,@userPwd)";
                }
                else
                {
                    sql = "insert into StudentInfo(StuId,StuPassword) values(@userId,@userPwd)";
                }

                SqlConnection con = DataOperate.CreateCon();
                con.Open();
                SqlCommand com = new SqlCommand(sql, con);
                com = new SqlCommand(sql, con);
                com.Parameters.Add(new SqlParameter("@userId", SqlDbType.VarChar, 50));
                com.Parameters["@userId"].Value = userId;
                com.Parameters.Add(new SqlParameter("@userPwd", SqlDbType.VarChar, 50));
                com.Parameters["@userPwd"].Value = Pwd;
                if (com.ExecuteNonQuery() > 0)
                {
                    HttpContext.Current.Session["userId"] = userId;
                    return "success";
                }
                else
                {
                    return "fail"; //提示注册失败ToRegister
                }
            }
            else
            {
                return "wrong code";
            }
        }

        private static void SendEmail(string strSmtpServer, string strFrom, string strFromPass, string strto,
            string strSubject, string strBody)
        {
            BodyBuilder builder = new BodyBuilder();
            MimeMessage mail = new MimeMessage();
            mail.From.Add(new MailboxAddress("", strFrom));
            mail.To.Add(new MailboxAddress("", strto));
            mail.Subject = strSubject;
            builder.HtmlBody = "<html><body>" + strBody;
            builder.HtmlBody += "</body></html>";
            mail.Body = builder.ToMessageBody();

            MailKit.Net.Smtp.SmtpClient client = new MailKit.Net.Smtp.SmtpClient();
            client.Connect(strSmtpServer, 465, true);
            client.AuthenticationMechanisms.Remove("XOAUTH2");
            client.Authenticate(strFrom, strFromPass);
            client.Send(mail);
            client.Disconnect(true);
        }

        [WebMethod(EnableSession = true)]
        public static string SendEmail(string email, string userType)
        {
            string sql = "";
            if (userType == "student")
            {
                sql = "select count(*) from StudentInfo where StuId=@userId";
            }
            else
            {
                sql = "select count(*) from TeacherInfo where TeachId=@userId";
            }

            SqlConnection con = DataOperate.CreateCon();
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add(new SqlParameter("@userId", SqlDbType.VarChar, 50));
            cmd.Parameters["@userId"].Value = email;
            if (Convert.ToInt32(cmd.ExecuteScalar()) == 0)
            {
                String to = email;
                Random random = new Random(Guid.NewGuid().GetHashCode());
                int code = random.Next(100000, 1000000);
                string content = "您正在使用邮箱安全验证服务，您本次操作的验证码是：" + code;

                string strSmtpServer = ConfigurationManager.AppSettings["STR_SMTP_SERVER"];
                string strFrom = ConfigurationManager.AppSettings["STR_SMTP_FROM"];
                string strFromPass = ConfigurationManager.AppSettings["STR_SMTP_PASSWORD"];
                SendEmail(strSmtpServer, strFrom, strFromPass, to, "激活邮箱", content);
                HttpContext.Current.Session["code"] = code;
                return "success";
            }

            return "user existed";
        }
    }
}