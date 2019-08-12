using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class CommentList : System.Web.UI.Page
    {
        int num = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string courseId = Request.QueryString["courseId"];
                string sql = "select * from CourseInfo inner join VideoInfo on CourseInfo.courseId = VideoInfo.CourseId where CourseInfo.courseId=" + courseId;

                SqlDataReader sdr = DataOperate.GetRow(sql);
                sdr.Read();
                video.Src = sdr["VideoPath"].ToString();
                maininfo_top.Text = sdr["intro"].ToString();
                maininfo_bottom.Text = sdr["target"].ToString();

                QABindData(sdr["VideoId"].ToString());
                CBindData(sdr["VideoId"].ToString());
                SqlConnection con = DataOperate.CreateCon();
                SqlCommand cmd = new SqlCommand("select * from VideoInfo where CourseId=" + courseId, con);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                DataList1.DataSource = ds;
                DataList1.DataBind();
                someIntro.Visible = true;
                questionList.Visible = false;
                commentList.Visible = false;
                introPart.ForeColor = System.Drawing.Color.DodgerBlue;
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
            CBindData(sdr["VideoId"].ToString());
            QABindData(sdr["VideoId"].ToString());
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
            ds.Relations.Add(new DataRelation("QA_Relation", ds.Tables[0].Columns["QuestionId"],
            ds.Tables[1].Columns["QuestionId"]));
            outerDataList.DataSource = ds;
            outerDataList.DataBind();
        }
        private void CBindData(string videoId)
        {
            SqlConnection con = DataOperate.CreateCon();
            SqlCommand cmd = new SqlCommand("select * from CommentInfo where VideoId=" + videoId, con);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ad.Fill(ds);
            DataList2.DataSource = ds;
            DataList2.DataBind();
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
                DateTime answerTime = DateTime.Now.ToLocalTime();
                SqlConnection con = DataOperate.CreateCon();
                string sql = "insert into AnswerInfo(AnswerContent,AnswerBy,QuestionId,AnswerTime) values('" + answerContent + "','" + answerBy + "'," + questionId + ",'" + answerTime + "')";
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                QABindData(getVideoIdByQuestionId(questionId));
            }
        }
        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "good")
            {
                num++;
                Response.Write(num);
                string sql1 = "";
                SqlConnection con = DataOperate.CreateCon();
                if (num % 2 == 1)
                {
                    sql1 = "update CommentInfo set GoodCount=GoodCount+1 where CommentId=" + e.CommandArgument;
                }
                else
                {
                    sql1 = "update CommentInfo set GoodCount=GoodCount-1 where CommentId=" + e.CommandArgument;
                }
                
                SqlCommand cmd = new SqlCommand(sql1, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                string sql2 = "select * from CommentInfo where CommentId=" + e.CommandArgument;
                SqlDataReader sdr = DataOperate.GetRow(sql2);
                sdr.Read();
                CBindData(sdr["VideoId"].ToString());
                ((Image)e.Item.FindControl("Good")).ImageUrl = "~/img/gooded.png";
            }
        }

        private string getVideoIdByQuestionId(int questionId)
        {
            string sql = "select * from QuestionInfo where QuestionId=" + questionId;
            SqlDataReader sdr = DataOperate.GetRow(sql);
            sdr.Read();
            return sdr["VideoId"].ToString();
        }

        protected void introPart_Click(object sender, EventArgs e)
        {
            someIntro.Visible = true;
            questionList.Visible = false;
            commentList.Visible = false;
            introPart.ForeColor = System.Drawing.Color.DodgerBlue;
            QAPart.ForeColor = System.Drawing.Color.DimGray;
            Comment.ForeColor = System.Drawing.Color.DimGray;
        }

        protected void QAPart_Click(object sender, EventArgs e)
        {
            someIntro.Visible = false;
            questionList.Visible = true;
            commentList.Visible = false;
            introPart.ForeColor = System.Drawing.Color.DimGray;
            QAPart.ForeColor = System.Drawing.Color.DodgerBlue;
            Comment.ForeColor = System.Drawing.Color.DimGray;
        }

        protected void Comment_Click(object sender, EventArgs e)
        {
            someIntro.Visible = false;
            questionList.Visible = false;
            commentList.Visible = true;
            introPart.ForeColor = System.Drawing.Color.DimGray;
            QAPart.ForeColor = System.Drawing.Color.DimGray;
            Comment.ForeColor = System.Drawing.Color.DodgerBlue;
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("OpenedCourses.aspx");
        }
    }
}