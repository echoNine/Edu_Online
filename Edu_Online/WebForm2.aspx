<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Edu_Online.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DataList ID="outerDataList" runat="server" OnItemDataBound="outerRep_ItemDataBound">
                <ItemTemplate>
                    <asp:Label ID="lblCategoryName" runat="server" Text='<%# Eval("commentBy")%>' />
                    <asp:Label ID="commentContent" runat="server" Text='<%# Eval("commentContent")%>' />
                    <asp:Label ID="commentTime" runat="server" Text='<%# Eval("commentTime")%>' />
                    <asp:DataList ID="innerDataList" runat="server">
                        <ItemTemplate>
                            <asp:Label ID="hlProductName" runat="server" Text='<%# Eval("replyBy")%>' />
                            <asp:Label ID="replyContent" runat="server" Text='<%# Eval("replyContent")%>' />
                            <asp:Label ID="replyTime" runat="server" Text='<%# Eval("replyTime")%>' />
                        </ItemTemplate>
                    </asp:DataList>
                    </ul>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </form>
</body>
</html>
