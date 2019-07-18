<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VideoList.aspx.cs" Inherits="Edu_Online.VideoList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 122px;
        }

        .auto-style2 {
            height: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" BorderWidth="1px" GridLines="Both" Height="327px" RepeatColumns="2" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False" Width="524px">
                <ItemTemplate>
                    <table align="center" class="auto-style1">
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("VideoName") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("VideoTitle") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("VideoOfCourseType") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <video width="300" controls="controls" runat="server">
                                    <source src='<%# Eval("VideoPath") %>'></video>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EduString %>" SelectCommand="SELECT * FROM [VideoInfo]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
