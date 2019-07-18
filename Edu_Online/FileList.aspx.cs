using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class FileList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            SqlConnection con = DataOperate.CreateCon();
            SqlDataAdapter da = new SqlDataAdapter("select * from FileInfo", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "file");
            gvFile.DataSource = ds;
            gvFile.DataBind();
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            GridViewRow gvrow = btn.NamingContainer as GridViewRow;
            string filePath = "file\\" + gvFile.DataKeys[gvrow.RowIndex].Value.ToString();
            Response.Clear();
            Response.ClearContent();
            Response.ClearHeaders();
            String filename = Server.MapPath(filePath);
            FileInfo fileInfo = new FileInfo(filename);
            Response.AddHeader("Content-Disposition", "attachment;filename=" + filename);
            Response.AddHeader("Content-Length", fileInfo.Length.ToString());
            Response.AddHeader("Content-Transfer-Encoding", "binary");
            Response.ContentType = "Application/octet-stream";
            Response.TransmitFile(fileInfo.FullName);
            //Response.ContentEncoding = System.Text.Encoding.GetEncoding("gb2312");//utf-8 啥的  如果有编码问题 可以加这个
            Response.Flush();
            Response.End();
        }

        protected void gvFile_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string title = gvFile.DataKeys[e.RowIndex].Value.ToString();
            string sqlDel = "delete FileInfo where FileTitle='" + title + "'";
            DataOperate.ExecSQL(sqlDel);
            BindGridView();
            ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('删除成功')</script>");
        }
    }
}