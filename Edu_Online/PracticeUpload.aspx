<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PracticeUpload.aspx.cs" Inherits="Edu_Online.PracticeUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 63%;
            height: 563px;
        }

        .auto-style3 {
            width: 227px;
            height: 26px;
        }

        .auto-style4 {
            height: 26px;
            width: 344px;
        }

        .auto-style9 {
            width: 227px;
            height: 26px;
        }

        .auto-style10 {
            height: 26px;
            width: 344px;
        }
        .auto-style11 {
            width: 227px;
            height: 128px;
        }
        .auto-style12 {
            width: 344px;
            height: 128px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div>
            <table class="auto-style1" style="border: 1px; background-color: #fce8bd">
                <tr>
                    <td class="auto-style9">Practice Id</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="id" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Question Count</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="count" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Practice Of CourseTitle</td>
                    <td class="auto-style10">
                        <asp:DropDownList ID="courseTitle" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Practice Difficulty</td>
                    <td class="auto-style10">
                        <asp:DropDownList ID="difficulty" runat="server">
                            <asp:ListItem Value="*">*</asp:ListItem>
                            <asp:ListItem Value="**">**</asp:ListItem>
                            <asp:ListItem Value="***">***</asp:ListItem>
                            <asp:ListItem Value="****">****</asp:ListItem>
                            <asp:ListItem Value="*****">*****</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Published Date</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="beginDate" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">DeadLine</td>
                    <td class="auto-style12">
                        <asp:TextBox ID="deadLine" runat="server"></asp:TextBox>
                        <asp:ImageButton ID="calendarImg" runat="server" OnClick="calendarImg_Click" ImageUrl="~/images/calendar.gif" />
                        <asp:Calendar ID="Calendar" runat="server" Visible="False" BackColor="White" OnSelectionChanged="Calendar_SelectionChanged"
                            BorderColor="#999999" DayNameFormat="Shortest"
                            Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" CellPadding="4">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                        </asp:Calendar>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Practice Content</td>
                    <td class="auto-style4">
                        <asp:FileUpload ID="content" runat="server" />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="tip" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:Button ID="btnUpload" runat="server" Text="发布" OnClick="btnUpload_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
