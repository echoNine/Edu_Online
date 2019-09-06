using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class CommentList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string courseId = Request.QueryString["courseId"];
                string sql = "select * from CourseInfo inner join VideoInfo on CourseInfo.courseId = VideoInfo.CourseId where CourseInfo.courseId=" + courseId;

                SqlDataReader sdr = DataOperate.GetRow(sql);
                sdr.Read();
                video.Src = sdr["VideoPath"].ToString();
                currentVideo.Text = sdr["VideoId"].ToString();
                maininfo_top.Text = sdr["intro"].ToString();
                maininfo_bottom.Text = sdr["target"].ToString();

                QABindData(sdr["VideoId"].ToString());
                SqlConnection con = DataOperate.CreateCon();
                SqlCommand cmd = new SqlCommand("select * from VideoInfo where CourseId=" + courseId, con);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                DataList1.DataSource = ds;
                DataList1.DataBind();
                someIntro.Visible = true;
                questionList.Visible = false;
                resdata.Visible = false;
                introPart.ForeColor = System.Drawing.Color.DodgerBlue;
                RBindData();
            }
        }

        protected void link_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string courseName = btn.CommandArgument.ToString();
            string sql = "select * from VideoInfo where VideoName=" + "'" + courseName + "'";
            SqlDataReader sdr = DataOperate.GetRow(sql);
            sdr.Read();
            video.Src = sdr["VideoPath"].ToString();
            QABindData(sdr["VideoId"].ToString());
            RBindData();
            currentVideo.Text = sdr["VideoId"].ToString();
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
            ds.Relations.Add(new DataRelation("QA_Relation", ds.Tables[0].Columns["quesId"],
            ds.Tables[1].Columns["quesId"],false));
            outerDataList.DataSource = ds;
            outerDataList.DataBind();
        }
        

        protected void outerDataList_OnItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = e.Item.DataItem as DataRowView;
                DataList innerDataList = e.Item.FindControl("innerDataList") as DataList;
                innerDataList.DataSource = drv.CreateChildView("QA_Relation");
                innerDataList.DataBind();
            }
        }

        protected void outerDataList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            ((TextBox)e.Item.FindControl("AddAnswer")).Visible = true;
            ((Button)e.Item.FindControl("Submit")).Visible = true;
            if (e.CommandName == "submit")
            {
                int questionId = Convert.ToInt32(e.CommandArgument);
                ((TextBox)e.Item.FindControl("AddAnswer")).Visible = false;
                ((Button)e.Item.FindControl("Submit")).Visible = false;
                string answerContent = ((TextBox)e.Item.FindControl("AddAnswer")).Text;
                string answerBy = Session["userName"].ToString();
                string answerTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                SqlConnection con = DataOperate.CreateCon();
                string sql = "insert into AnswerInfo(AnswerContent,AnswerBy,QuesId,AnswerTime) values('" + answerContent + "','" + answerBy + "'," + questionId + ",'" + answerTime + "')";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                QABindData(getVideoIdByQuestionId(questionId));
            }
        }

        protected void RBindData()
        {
            string courseId = Request.QueryString["courseId"].ToString();
            string videoPath = video.Src;
            string sql1 = "select * from VideoInfo where CourseId=" + courseId + " and VideoPath='" + videoPath + "'";
            SqlDataReader sdr = DataOperate.GetRow(sql1);
            sdr.Read();
            string videoId = sdr["VideoId"].ToString();
            string sql2 = "select * from FileInfo inner join VideoInfo on FileInfo.videoId = VideoInfo.VideoId where VideoInfo.videoId=" + videoId;
            gvResource.DataSource = DataOperate.GetDataset(sql2, "FileInfo");
            gvResource.DataKeyNames = new string[] { "fileId" };
            gvResource.DataBind();
        }

        private string getVideoIdByQuestionId(int questionId)
        {
            string sql = "select * from QuesInfo where QuesId=" + questionId;
            SqlDataReader sdr = DataOperate.GetRow(sql);
            sdr.Read();
            return sdr["VideoId"].ToString();
        }

        protected void introPart_Click(object sender, EventArgs e)
        {
            someIntro.Visible = true;
            questionList.Visible = false;
            resdata.Visible = false;
            introPart.ForeColor = System.Drawing.Color.DodgerBlue;
            QAPart.ForeColor = System.Drawing.Color.DimGray;
            SrcPart.ForeColor = System.Drawing.Color.DimGray;
        }

        protected void QAPart_Click(object sender, EventArgs e)
        {
            someIntro.Visible = false;
            questionList.Visible = true;
            resdata.Visible = false;
            introPart.ForeColor = System.Drawing.Color.DimGray;
            QAPart.ForeColor = System.Drawing.Color.DodgerBlue;
            SrcPart.ForeColor = System.Drawing.Color.DimGray;
        }

        protected void Src_Click(object sender, EventArgs e)
        {
            someIntro.Visible = false;
            questionList.Visible = false;
            resdata.Visible = true;
            introPart.ForeColor = System.Drawing.Color.DimGray;
            QAPart.ForeColor = System.Drawing.Color.DimGray;
            SrcPart.ForeColor = System.Drawing.Color.DodgerBlue;
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
        protected void return_Click(object sender, EventArgs e)
        {
            Response.Redirect("OpenedCourses.aspx");
        }
    }
}