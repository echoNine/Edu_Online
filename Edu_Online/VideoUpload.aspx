<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aaa.aspx.cs" Inherits="Edu_Online.Up" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <style type="text/css">
        
        .auto-style3 {
            width: 56%;
        }
        .auto-style4 {
            width: 202px;
            height: 36px;
        }
        .auto-style5 {
            width: 311px;
            height: 36px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <table style="background-color: #f1df99; border:1px" class="auto-style3" >
            <tr>
                <td class="auto-style4">视频编号</td>
                <td class="auto-style5">
                    <asp:TextBox ID="id" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">视频名称</td>
                <td class="auto-style5">
                    <asp:TextBox ID="name" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">视频资源</td>
                <td class="auto-style5">
                    <asp:FileUpload ID="path" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">所属课程类别</td>
                <td class="auto-style5">
                    <asp:DropDownList ID="type" runat="server">
                        <asp:ListItem Value="计算机">计算机</asp:ListItem>
                        <asp:ListItem Value="艺术设计">艺术设计</asp:ListItem>
                        <asp:ListItem Value="外语">外语</asp:ListItem>
                        <asp:ListItem Value="电视艺术">电视艺术</asp:ListItem>
                        <asp:ListItem Value="管理学">管理学</asp:ListItem>
                        <asp:ListItem Value="文学文化">文学文化</asp:ListItem>
                        <asp:ListItem Value="其他方向">其他方向</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">所属课程名</td>
                <td class="auto-style5">
                    <asp:DropDownList ID="course" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="tip" runat="server"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:Button ID="save" runat="server" Text="Save Video" BackColor="#FFCC66" OnClick="Button1_Click" />
                    <br />
                </td>
            </tr>
        </table>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/VideoList.aspx">View All Uploaded Videos</asp:HyperLink>
    </form>
</body>
</html>
