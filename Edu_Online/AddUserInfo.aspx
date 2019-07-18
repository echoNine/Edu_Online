<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUserInfo.aspx.cs" Inherits="Edu_Online.AddTeacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>完善信息</title>
    <style type="text/css">
        body {
            background-image: url(images/indexback.png);
            background-repeat: no-repeat;
            overflow: hidden;
        }

        .main {
            position: absolute;
            width: 960px;
            height: 410px;
            left: 11%;
            top: 13%;
            background: #fff;
            padding: 50px;
        }

        .lefttitle, .righttitle {
            font-family: "pingfang SC", "Microsoft YaHei", "微软雅黑", helvetica, arial, verdana, tahoma, sans-serif;
            border-left: 5px solid #008BE1;
            font-size: 18px;
            padding-left: 25px;
        }

        .LeftInfo, .RightInfo {
            float: left;
            border: 1px solid #c4c4c4;
            width: 418px;
            height: 375px;
            padding-left: 60px;
            padding-top: 35px;
        }

        .item {
            margin-right: 70px;
            font-family: "pingfang SC", "Microsoft YaHei", "微软雅黑", helvetica, arial, verdana, tahoma, sans-serif;
            font-size: 15px;
            color: #5e5e5e;
            line-height: 30px;
        }

        .input {
            width: 250px;
            height: 36px;
            border-radius: 5px;
            border: 1px solid #b9b9b9;
            padding-left: 10px;
        }

        .info {
            width: 380px;
            height: 36px;
            margin-top: 26px;
            font-family: "pingfang SC", "Microsoft YaHei", "微软雅黑", helvetica, arial, verdana, tahoma, sans-serif;
            font-size: 15px;
            color: #5e5e5e;
        }

        .save {
            height: 40px;
            width: 90px;
            margin-top: 75px;
            margin-left: 255px;
            border: none;
            border-radius: 5px;
            background: #008BE1;
            color: #fff;
            font-size: 14px;
            font-weight: bold;
            font-family: "pingfang SC", "Microsoft YaHei", "微软雅黑", helvetica, arial, verdana, tahoma, sans-serif;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
            <div class="LeftInfo">
                <asp:Label ID="BaseInfo" runat="server" Text="基本信息" CssClass="lefttitle"></asp:Label><br />
                <div class="info">
                    <asp:Label ID="name" runat="server" Text="姓名" CssClass="item"></asp:Label><asp:TextBox ID="txtName" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="info">
                    <asp:Label ID="sex" runat="server" Text="性别" CssClass="item"></asp:Label>
                    <asp:RadioButton ID="Female" runat="server" GroupName="RadioSex" Text="男" Checked="true" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="Male" runat="server" GroupName="RadioSex" Text="女" />
                </div>
                <div class="info">
                    <asp:Label ID="birth" runat="server" Text="出生日期" CssClass="item" Style="margin-right: 40px"></asp:Label>
                    <asp:DropDownList ID="year" runat="server" Style="width: 60px; padding-left: 5px;" CssClass="input"></asp:DropDownList>&nbsp;年&nbsp;
                        <asp:DropDownList ID="month" runat="server" Style="width: 60px; padding-left: 5px;" CssClass="input"></asp:DropDownList>&nbsp;月&nbsp;
                        <asp:DropDownList ID="day" runat="server" Style="width: 60px; padding-left: 5px;" CssClass="input"></asp:DropDownList>&nbsp;日&nbsp;
                </div>
                <div class="info">
                    <asp:Label ID="city" runat="server" Text="现居城市" CssClass="item" Style="margin-right: 40px"></asp:Label><asp:TextBox ID="txtCity" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="info">
                    <asp:Label ID="phone" runat="server" Text="联系电话" CssClass="item" Style="margin-right: 40px"></asp:Label><asp:TextBox ID="txtPhone" runat="server" CssClass="input"></asp:TextBox>
                </div>
            </div>

            <div class="RightInfo">
                <asp:Label ID="OtherInfo" runat="server" Text="其他信息" CssClass="righttitle"></asp:Label>
                <div class="info">
                    <asp:Label ID="type" runat="server" Text="教师从属类型" CssClass="item" Style="margin-right: 40px"></asp:Label>
                    <asp:DropDownList ID="TeacherType" runat="server" CssClass="input" Width="210px">
                        <asp:ListItem Value="1001">学校教师</asp:ListItem>
                        <asp:ListItem Value="1002">企业在职</asp:ListItem>
                        <asp:ListItem Value="1003">企业在职</asp:ListItem>
                        <asp:ListItem Value="1004">其他类型</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="info">
                    <asp:Label ID="direction" runat="server" Text="教学方向" CssClass="item"></asp:Label>
                    <asp:DropDownList ID="TeachCourse" runat="server" CssClass="input" Width="210px">
                        <asp:ListItem Value="2001">计算机</asp:ListItem>
                        <asp:ListItem Value="2002">艺术设计</asp:ListItem>
                        <asp:ListItem Value="2003">外语</asp:ListItem>
                        <asp:ListItem Value="2004">电视艺术</asp:ListItem>
                        <asp:ListItem Value="2005">管理学</asp:ListItem>
                        <asp:ListItem Value="2006">文学文化</asp:ListItem>
                        <asp:ListItem Value="2007">其他方向</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="info">
                    <asp:Label ID="unit" runat="server" Text="任职单位" CssClass="item"></asp:Label>
                    <asp:TextBox ID="txtUnit" runat="server" CssClass="input" Width="200px"></asp:TextBox>
                </div>
                <asp:Button ID="save" runat="server" Text="保存" OnClick="submit_Click" CssClass="save" />
            </div>
        </div>
    </form>
</body>
</html>
