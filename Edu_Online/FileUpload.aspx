<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileUpload.aspx.cs" Inherits="Edu_Online.PptUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 54%;
        }
        .auto-style5 {
            width: 213px;
            height: 36px;
        }
        .auto-style6 {
            height: 36px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <table style="background-color: #f1df99; border:1px" class="auto-style1">
            <tr>
                <td class="auto-style5">File Id</td>
                <td class="auto-style6">
                    <asp:TextBox ID="id" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">File Name</td>
                <td class="auto-style6">
                    <asp:TextBox ID="name" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">File Title</td>
                <td class="auto-style6">
                    <asp:FileUpload ID="path" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style5">File Of Course Type</td>
                <td class="auto-style6">
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
                <td class="auto-style5">
                    <asp:Label ID="tip" runat="server"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Button ID="save" runat="server" Text="Save File" BackColor="#FFCC66" OnClick="btnSave_Click"/>
                </td>
            </tr>
        </table>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/FileList.aspx">View All Uploaded Files</asp:HyperLink>

    </form>
</body>
</html>
