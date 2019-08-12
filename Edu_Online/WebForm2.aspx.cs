using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Edu_Online
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
        }
        private void BindData()
        {
            SqlConnection con = new SqlConnection();
            SqlCommand cmd = new SqlCommand("select * from CommentInfo and ReplyInfo where CommentInfo.commentID = ReplyInfo.commentId", con);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ad.Fill(ds);
            ds.Relations.Add(new DataRelation("Relation", ds.Tables[0].Columns["commentId"], ds.Tables[1].Columns["commentId"]));
            outerDataList.DataSource = ds.Tables[0];
            outerDataList.DataBind();
        }

        protected void outerRep_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item)
            {
                DataRowView drv = e.Item.DataItem as DataRowView;
                DataList innerDataList = e.Item.FindControl("innerDataList") as DataList;
                innerDataList.DataSource = drv.CreateChildView("Relation");
                innerDataList.DataBind();
            }
        }
    }
}