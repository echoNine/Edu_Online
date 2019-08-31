using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class StuCourseDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string courseId = Request.QueryString["courseId"];
                Session["courseId"] = courseId;
                string sql1 = "select * from CourseInfo where courseId =" + courseId;
                SqlDataReader sdr1 = DataOperate.GetRow(sql1);
                sdr1.Read();
                courseTitle.Text = sdr1["courseName"].ToString();
                string tip = Request.QueryString["tip"];
                string sql2 = "";
                SqlDataReader sdr2 = null;
                if (tip == "new")
                {
                    sql2 = "select top 1 * from CourseInfo inner join VideoInfo on CourseInfo.courseId = VideoInfo.CourseId where CourseInfo.courseId=" + courseId;
                    sdr2 = DataOperate.GetRow(sql2);
                    sdr2.Read();
                    video.Src = sdr2["VideoPath"].ToString();
                    currentVideo.Text= sdr2["VideoId"].ToString();
                }
                else
                {
                    sql2 = "select top 1 * from LearnRecord inner join VideoInfo on LearnRecord.videoId = VideoInfo.videoId where LearnRecord.courseId = '" + courseId + "' order by updatedAt desc";
                    sdr2 = DataOperate.GetRow(sql2);
                    sdr2.Read();
                    video.Src = sdr2["VideoPath"].ToString();
                    getTime.Text = sdr2["currentTime"].ToString();
                    currentVideo.Text = sdr2["VideoId"].ToString();
                }
                video.Src = sdr2["VideoPath"].ToString();
                NBindData();
                QABindData(sdr2["VideoId"].ToString());
                RBindData();
                LBindData();
                showlist.Visible = true;
                list.ForeColor = System.Drawing.Color.White;
                list.BackColor = System.Drawing.Color.DodgerBlue;
                notedata.Style["display"] = "block";
                quesdata.Style["display"] = "none";
                resdata.Style["display"] = "none";
                notetitle.Style["border-bottom"] = "2px solid #47abdd";
                notetitle.Style["color"] = "#47abdd";
            }
        }

        [WebMethod(EnableSession = true)]
        public static string CurrentTime(float currentTime, string videoPath)
        {
            string courseId = "";
            string stuId = "";
            if (HttpContext.Current.Session != null && HttpContext.Current.Session["courseId"] != null && HttpContext.Current.Session["userId"] != null)
            {
                courseId = HttpContext.Current.Session["courseId"].ToString();
                stuId = HttpContext.Current.Session["userId"].ToString();
            }
            SqlConnection con = DataOperate.CreateCon();
            string sql1 = "select * from VideoInfo where VideoPath=" + "'" + videoPath + "'";
            SqlDataReader sdr1 = DataOperate.GetRow(sql1);
            sdr1.Read();
            string videoId = sdr1["VideoId"].ToString();
            string sql2 = "select count(*) from LearnRecord where stuId='" + stuId + "' and videoId=" + videoId;
            string sql3 = "";
            string updatedAt = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            if (DataOperate.SeleSQL(sql2) == 0)
            {
                sql3 = "insert into LearnRecord(stuId,courseId,videoId,currentTime,updatedAt) values('" + stuId + "','" + courseId + "'," + videoId + "," + currentTime + ",'" + updatedAt + "')";
            }
            else
            {
                sql3 = "update LearnRecord set currentTime = " + currentTime + ",updatedAt = '" + updatedAt + "' where stuId='" + stuId + "' and videoId=" + videoId;
            }
            DataOperate.ExecSQL(sql3);
            return "success";
        }

        protected void link_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string videoName = btn.CommandArgument.ToString();
            string sql = "select * from VideoInfo where VideoName=" + "'" + videoName + "'";
            SqlDataReader sdr1 = DataOperate.GetRow(sql);
            sdr1.Read();
            video.Src = sdr1["VideoPath"].ToString();
            currentVideo.Text = sdr1["VideoId"].ToString();
            Label lb = (Label)btn.FindControl("title");
            lb.Style["color"] = "red";
            string stuId = Session["userId"].ToString();
            string videoId = sdr1["VideoId"].ToString();
            string courseId = Session["courseId"].ToString();
            string updatedAt = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string timeSql = "select count(*) from LearnRecord where stuId='" + stuId + "' and videoId=" + videoId;
            if (DataOperate.SeleSQL(timeSql) == 0)
            {
                string insertSql = "insert into LearnRecord(stuId,courseId,videoId,updatedAt) values('" + stuId + "','" + courseId + "'," + videoId + ",'" + updatedAt + "')";
                DataOperate.ExecSQL(insertSql);
            }
            string selectSql = "select * from LearnRecord where stuId='" + stuId + "' and videoId=" + videoId;
            SqlDataReader sdr2 = DataOperate.GetRow(selectSql);
            sdr2.Read();
            getTime.Text = sdr2["currentTime"].ToString();
            QABindData(videoId);
            NBindData();
            RBindData();
        }

        protected void LBindData()
        {
            string courseId = Request.QueryString["courseId"];
            SqlConnection con = DataOperate.CreateCon();
            SqlCommand cmd = new SqlCommand("select * from VideoInfo where CourseId=" + courseId, con);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ad.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        protected void NBindData()
        {
            string videoPath = video.Src;
            string sql1 = "select * from VideoInfo where VideoPath=" + "'" + videoPath + "'";
            SqlDataReader sdr = DataOperate.GetRow(sql1);
            sdr.Read();
            string videoId = sdr["VideoId"].ToString();
            string stuId = Session["userId"].ToString();
            string sql2 = "select * from NoteInfo inner join VideoInfo on NoteInfo.videoId = VideoInfo.VideoId inner join CourseInfo on CourseInfo.courseId = VideoInfo.CourseId where NoteInfo.videoId=" + videoId + "and NoteInfo.stuId='" + stuId + "'";
            NoteDataList.DataSource = DataOperate.GetDataset(sql2, "NoteInfo");
            NoteDataList.DataKeyField = "noteId";
            NoteDataList.DataBind();
        }

        protected void list_Click(object sender, EventArgs e)
        {
            showlist.Visible = true;
            takenotes.Visible = false;
            askques.Visible = false;
            list.ForeColor = System.Drawing.Color.White;
            list.BackColor = System.Drawing.Color.DodgerBlue;
            note.ForeColor = System.Drawing.Color.Black;
            note.BackColor = System.Drawing.Color.GhostWhite;
            ques.ForeColor = System.Drawing.Color.Black;
            ques.BackColor = System.Drawing.Color.GhostWhite;
        }

        protected void note_Click(object sender, EventArgs e)
        {
            showlist.Visible = false;
            takenotes.Visible = true;
            askques.Visible = false;
            list.ForeColor = System.Drawing.Color.Black;
            list.BackColor = System.Drawing.Color.GhostWhite;
            note.ForeColor = System.Drawing.Color.White;
            note.BackColor = System.Drawing.Color.DodgerBlue;
            ques.ForeColor = System.Drawing.Color.Black;
            ques.BackColor = System.Drawing.Color.GhostWhite;
        }

        protected void ques_Click(object sender, EventArgs e)
        {
            showlist.Visible = false;
            takenotes.Visible = false;
            askques.Visible = true;
            list.ForeColor = System.Drawing.Color.Black;
            list.BackColor = System.Drawing.Color.GhostWhite;
            note.ForeColor = System.Drawing.Color.Black;
            note.BackColor = System.Drawing.Color.GhostWhite;
            ques.ForeColor = System.Drawing.Color.White;
            ques.BackColor = System.Drawing.Color.DodgerBlue;
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            string videoPath = video.Src;
            string sql1 = "select * from VideoInfo where VideoPath=" + "'" + videoPath + "'";
            SqlDataReader sdr = DataOperate.GetRow(sql1);
            sdr.Read();
            string videoId = sdr["VideoId"].ToString();
            string noteContent = notecontent.InnerText;
            string stuId = Session["userId"].ToString();
            string courseId = Request.QueryString["courseId"];
            string noteTime = DateTime.Now.ToString("yyyy-MM-dd");
            string sql = "insert into NoteInfo values('" + stuId + "','" + videoId + "','" + noteContent + "','" + noteTime + " ')";
            if (DataOperate.ExecSQL(sql))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('保存成功！')</script>");
                notecontent.InnerText = "";
                NBindData();
            }
        }

        protected void btn_push_Click(object sender, EventArgs e)
        {
            string videoPath = video.Src;
            string sql1 = "select * from VideoInfo where VideoPath=" + "'" + videoPath + "'";
            SqlDataReader sdr = DataOperate.GetRow(sql1);
            sdr.Read();
            string videoId = sdr["VideoId"].ToString();
            string questionBy = Session["userId"].ToString();
            string quesContent = quescontent.InnerText;
            string quesTime = DateTime.Now.ToString("yyyy-MM-dd");
            string sql2 = "insert into QuestionInfo values('" + videoId + "','" + questionBy + "','" + quesContent + "','" + quesTime + " ')";
            if (DataOperate.ExecSQL(sql2))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('发布成功！')</script>");
                quescontent.InnerText = "";
            }
        }
        private void QABindData(string videoId)
        {
            SqlConnection con = DataOperate.CreateCon();
            SqlCommand cmd = new SqlCommand("PROC_QA", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter ad = new SqlDataAdapter(cmd);

            SqlParameter param = new SqlParameter("@videoId", SqlDbType.VarChar);
            param.Direction = ParameterDirection.Input;
            param.Value = videoId;
            cmd.Parameters.Add(param);

            DataSet ds = new DataSet();
            ad.Fill(ds);
            ds.Relations.Add(new DataRelation("QA_Relation", ds.Tables[0].Columns["questionId"],
            ds.Tables[1].Columns["questionId"]));
            outer.DataSource = ds;
            outer.DataBind();
        }
        protected void outer_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = e.Item.DataItem as DataRowView;
                DataList innerDataList = e.Item.FindControl("inner") as DataList;
                innerDataList.DataSource = drv.CreateChildView("QA_Relation");
                innerDataList.DataBind();
            }
        }

        protected void lbtnDown_Click(Object sender, CommandEventArgs e)
        {
            string fileName = "";
            string url = e.CommandArgument.ToString();
            if (url == "")
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script defer>alert('该文件暂不提供下载！');</script>");
                return;
            }

            if (url.IndexOf("\\") > -1)
            {
                fileName = url.Substring(url.LastIndexOf("\\") + 1);

            }
            else
            {
                fileName = url;
            }

            string urlServer = Server.MapPath(url);
            FileStream fileStream = new FileStream(urlServer, FileMode.Open);
            byte[] bytes = new byte[(int)fileStream.Length];
            fileStream.Read(bytes, 0, bytes.Length);
            fileStream.Close();
            Response.ContentType = "application/octet-stream";

            Response.AddHeader("Content-Disposition", "attachment; filename=" + HttpUtility.UrlEncode(fileName, System.Text.Encoding.UTF8));
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }

        protected void RBindData()
        {
            string videoPath = video.Src;
            string sql1 = "select * from VideoInfo where VideoPath=" + "'" + videoPath + "'";
            SqlDataReader sdr = DataOperate.GetRow(sql1);
            sdr.Read();
            string videoId = sdr["VideoId"].ToString();
            string sql2 = "select * from FileInfo inner join VideoInfo on FileInfo.videoId = VideoInfo.VideoId where FileInfo.videoId=" + videoId;
            gvResource.DataSource = DataOperate.GetDataset(sql2, "FileInfo");
            gvResource.DataKeyNames = new string[] { "fileId" };
            gvResource.DataBind();
        }

        protected void NoteDataList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                ((Panel)e.Item.FindControl("noteItem")).Style["height"] = "200px";
                ((Panel)e.Item.FindControl("notelist")).Style["display"] = "none";
                ((Panel)e.Item.FindControl("editbox")).Style["display"] = "block";

                ((TextBox)e.Item.FindControl("inputnote")).Text = ((Label)e.Item.FindControl("noteContent")).Text;
            }

            if (e.CommandName == "delete")
            {
                int noteId = Convert.ToInt32(e.CommandArgument);
                string sql = "delete from NoteInfo where noteId=" + noteId;
                if (DataOperate.ExecSQL(sql))
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('删除成功！')</script>");
                    NBindData();
                }
            }

            if (e.CommandName == "cancel")
            {
                ((Panel)e.Item.FindControl("noteItem")).Style["height"] = "120px";
                ((Panel)e.Item.FindControl("notelist")).Style["display"] = "block";
                ((Panel)e.Item.FindControl("editbox")).Style["display"] = "none";
                ((TextBox)e.Item.FindControl("inputnote")).Text = "";
            }

            if (e.CommandName == "save")
            {
                int noteId = Convert.ToInt32(e.CommandArgument);
                string updatedContent = ((TextBox)e.Item.FindControl("inputnote")).Text;
                string noteTime = DateTime.Now.ToString("yyyy-MM-dd");
                string sql = "update NoteInfo set noteContent ='" + updatedContent + "',noteTime='" + noteTime + "'where noteId =" + noteId;
                if (DataOperate.ExecSQL(sql))
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('修改成功！')</script>");
                    ((Panel)e.Item.FindControl("noteItem")).Style["height"] = "120px";
                    ((Panel)e.Item.FindControl("notelist")).Style["display"] = "block";
                    ((Panel)e.Item.FindControl("editbox")).Style["display"] = "none";
                    ((TextBox)e.Item.FindControl("inputnote")).Text = "";
                    NBindData();
                }

            }
        }

        protected void notetitle_Click(object sender, EventArgs e)
        {
            notedata.Style["display"] = "block";
            quesdata.Style["display"] = "none";
            resdata.Style["display"] = "none";
            notetitle.Style["border-bottom"] = "2px solid #47abdd";
            questitle.Style["border-bottom"] = "none";
            restitle.Style["border-bottom"] = "none";
            notetitle.Style["color"] = "#47abdd";
            questitle.Style["color"] = "black";
            restitle.Style["color"] = "black";
            NBindData();
        }

        protected void questitle_Click(object sender, EventArgs e)
        {
            string videoPath = video.Src;
            string sql = "select * from VideoInfo where VideoPath=" + "'" + videoPath + "'";
            SqlDataReader sdr = DataOperate.GetRow(sql);
            sdr.Read();
            string videoId = sdr["VideoId"].ToString();
            notedata.Style["display"] = "none";
            quesdata.Style["display"] = "block";
            resdata.Style["display"] = "none";
            notetitle.Style["border-bottom"] = "none";
            questitle.Style["border-bottom"] = "2px solid #47abdd";
            restitle.Style["border-bottom"] = "none";
            notetitle.Style["color"] = "black";
            questitle.Style["color"] = "#47abdd";
            restitle.Style["color"] = "black";
            QABindData(videoId);
        }

        protected void restitle_Click(object sender, EventArgs e)
        {
            notedata.Style["display"] = "none";
            quesdata.Style["display"] = "none";
            resdata.Style["display"] = "block";
            notetitle.Style["border-bottom"] = "none";
            questitle.Style["border-bottom"] = "none";
            restitle.Style["border-bottom"] = "2px solid #47abdd";
            notetitle.Style["color"] = "black";
            questitle.Style["color"] = "black";
            restitle.Style["color"] = "#47abdd";
            RBindData();
        }
    }
}