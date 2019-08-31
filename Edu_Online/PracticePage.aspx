<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PracticePage.aspx.cs" Inherits="Edu_Online.PracticePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>练习详情</title>
    <style>
        .content {
            width: 44%;
            background-color: #fdfdfd;
            border: 2px solid #cccccc;
            border-radius: 8px;
            box-shadow: 2px 2px #cccccc;
            height: 590px;
            overflow: auto;
            float: left;
            margin-top: 1.5%;
            margin-left: 5%;
        }

        .Name {
            margin: 44%;
            line-height: 100px;
            font-size: 24px;
            font-weight: bold;
            color: #4c4c4c;
        }

        .SingleTitle, .JudgeTitle {
            margin-left: 6%;
            font-size: 16px;
            color: #464646;
            font-weight: bold;
            line-height: 40px;
        }

        .SingleItem, .JudgeItem {
            margin-left: 74px;
            margin-bottom: 10px;
        }

        .quesContent {
            line-height: 50px;
            border-left: 5px solid #3bb7ef;
            padding-bottom: 4px;
            padding-left: 10px;
        }

        .itemT {
            line-height: 30px;
        }

        .itemF {
            margin-left: 40px;
            line-height: 30px;
        }

        .submitBtn {
            padding: 8px 16px;
            font-size: 15px;
            color: white;
            border-radius: 5px;
            font-weight: bold;
            background-color: gray;
            position: absolute;
            right: 27%;
            bottom: 10%;
        }

        .result {
            float: left;
            margin-left: 5%;
        }

        .title {
            font-size: 22px;
            color: #525252;
            font-weight: bold;
            line-height: 100px;
            border-left: 5px solid #60BAF1;
            padding-left: 10px;
            vertical-align: middle;
            padding-bottom: 3px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="content" class="content">
            <asp:Label ID="Name" runat="server" CssClass="Name" />
            <asp:Label ID="SingleTitle" runat="server" CssClass="SingleTitle" Text="一、单选题" /><br />
            <asp:DataList ID="singleList" runat="server">
                <ItemTemplate>
                    <asp:Panel ID="SingleItem" runat="server" CssClass="SingleItem">
                        <asp:Label Text='<%# Eval("quesContent") %>' data-id='<%# Eval("quesId") %>' runat="server" ID="quesContent" CssClass="quesContent" /><br />
                        <input id="singleItemA" type="radio" runat="server" name="single" value='A' class="itemT" /><%# Eval("A") %>
                        <input id="singleItemB" type="radio" runat="server" name="single" value='B' class="itemF" /><%# Eval("B") %>
                        <input id="singleItemC" type="radio" runat="server" name="single" value='C' class="itemF" /><%# Eval("C") %>
                        <input id="singleItemD" type="radio" runat="server" name="single" value='D' class="itemF" /><%# Eval("D") %>
                    </asp:Panel>
                </ItemTemplate>
            </asp:DataList><br />
            <asp:Label ID="JudgeTitle" runat="server" CssClass="JudgeTitle" Text="二、判断题" /><br />
            <asp:DataList ID="judgeList" runat="server">
                <ItemTemplate>
                    <asp:Panel ID="JudgeItem" runat="server" CssClass="JudgeItem">
                        <asp:Label Text='<%# Eval("quesContent") %>' data-id='<%# Eval("quesId") %>' runat="server" ID="quesContent" CssClass="quesContent" /><br />
                        <input id="judgeItemT" type="radio" runat="server" name="judge" value="正确" class="itemT" />&nbsp;正确
                        <input id="judgeItemF" type="radio" runat="server" name="judge" value="错误" class="itemF" />&nbsp;错误
                    </asp:Panel>
                </ItemTemplate>
            </asp:DataList>
        </div>

        <div id="result" class="result">
            <asp:Label ID="title" runat="server" Text="学生完成情况" CssClass="title"></asp:Label>
            <asp:GridView ID="gvResult" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="550px">
                <Columns>
                    <asp:BoundField DataField="StuName" HeaderText="姓名"></asp:BoundField>
                    <asp:BoundField DataField="score" HeaderText="得分"></asp:BoundField>
                    <asp:BoundField DataField="doneTime" HeaderText="完成日期"></asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#60baf1" ForeColor="#666666" />
                <HeaderStyle Font-Bold="True" ForeColor="White" HorizontalAlign="Center" BackColor="#60baf1" Height="60px" Font-Size="16px" />
                <PagerStyle BackColor="White" ForeColor="#666666" HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Center" Height="50px" ForeColor="#666666" Font-Size="16px" />
                <SelectedRowStyle BackColor="#60baf1" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
