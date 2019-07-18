using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Edu_Online
{
    public partial class PptUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string fileId = id.Text;
            string fileName = name.Text;
            string fileTitle = "";
            string fileType = type.SelectedValue;

            if (Page.IsPostBack)
            {
                Boolean FileOk = false;
                string Path = Server.MapPath("~/file/");

                if (path.HasFile)
                {
                    string fileExtension = System.IO.Path.GetExtension(path.FileName).ToLower();
                    string[] allowedExtensions = { ".pptx", ".docx", "pdf" };
                    for (int i = 0; i < allowedExtensions.Length; i++)
                    {
                        if (fileExtension == allowedExtensions[i])
                        {
                            FileOk = true;
                        }
                    }
                    if (FileOk)
                    {
                        try
                        {
                            path.PostedFile.SaveAs(Path + path.FileName);
                            fileTitle = path.FileName;
                            SqlConnection con = DataOperate.CreateCon();
                            string sql = "insert into FileInfo values('" + fileId + "','" + fileName + "','" + fileTitle + "','" + fileType + "')";
                            SqlCommand cmd = new SqlCommand(sql, con);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            tip.Text = "File Saved Successfully";
                            id.Text = "";
                            name.Text = "";
                        }
                        catch
                        {
                            tip.Text = "File Saved Failed";
                        }
                    }
                }
            }
        }
    }
}