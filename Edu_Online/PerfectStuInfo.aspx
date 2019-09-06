<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerfectStuInfo.aspx.cs" Inherits="Edu_Online.PerfectStuInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>完善个人信息--学生</title>
    <style type="text/css">
        body {
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        .top {
            width: 20%;
            position: absolute;
            top: 11%;
            color: #008BE1;
            left: 14%;
        }

        .main {
            border: 2px solid #eaeaea;
            width: 967px;
            height: 445px;
            padding: 4% 5%;
            margin: 4% auto;
            border-radius: 5px;
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
            height: 420px;
            padding-left: 60px;
            padding-top: 35px;
        }

        .infoitem {
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
            margin-top: 26px;
            margin-left: 62%;
            border: none;
            border-radius: 5px;
            background: #008BE1;
            color: #fff;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            font-family: "pingfang SC", "Microsoft YaHei", "微软雅黑", helvetica, arial, verdana, tahoma, sans-serif;
        }

        .return {
            width: 30px;
            position: absolute;
            top: 5%;
            right: 3%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ImageButton ID="return" runat="server" ImageUrl="~/img/return1.png" CssClass="return" OnClick="return_Click" />
        <asp:Panel ID="top" runat="server" CssClass="top">
            <asp:Label ID="StuTip" runat="server" Text="当前用户Id：" />
            <asp:Label ID="StuId" runat="server" />
        </asp:Panel>
        <div class="main">
            <div class="LeftInfo">
                <asp:Label ID="BaseInfo" runat="server" Text="基本信息" CssClass="leftTitle"></asp:Label><br />
                <div class="info">
                    <asp:Label ID="name" runat="server" Text="姓名" CssClass="infoitem"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="info">
                    <asp:Label ID="sex" runat="server" Text="性别" CssClass="infoitem"></asp:Label>
                    <asp:RadioButton ID="Male" runat="server" GroupName="RadioSex" Text="男" Checked="true" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="Female" runat="server" GroupName="RadioSex" Text="女" />
                </div>
                <div class="info">
                    <asp:Label ID="birth" runat="server" Text="出生日期" CssClass="infoitem" Style="margin-right: 40px"></asp:Label>
                    <asp:DropDownList ID="year" runat="server" Style="width: 60px; padding-left: 5px;" CssClass="input"></asp:DropDownList>&nbsp;年&nbsp;
                        <asp:DropDownList ID="month" runat="server" Style="width: 60px; padding-left: 5px;" CssClass="input"></asp:DropDownList>&nbsp;月&nbsp;
                        <asp:DropDownList ID="day" runat="server" Style="width: 60px; padding-left: 5px;" CssClass="input"></asp:DropDownList>&nbsp;日&nbsp;
                </div>
                <div class="info">
                    <asp:Label ID="city" runat="server" Text="现居城市" CssClass="infoitem" Style="margin-right: 40px"></asp:Label><asp:TextBox ID="txtCity" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="info">
                    <asp:Label ID="phone" runat="server" Text="联系电话" CssClass="infoitem" Style="margin-right: 40px"></asp:Label><asp:TextBox ID="txtPhone" runat="server" CssClass="input"></asp:TextBox>
                </div>
            </div>

            <div class="RightInfo">
                <asp:Label ID="OtherInfo" runat="server" Text="其他信息" CssClass="rightTitle"></asp:Label>
                <div class="info">
                    <asp:Label ID="type" runat="server" Text="用户类型" CssClass="infoitem"></asp:Label>
                    <asp:DropDownList ID="UserType" runat="server" CssClass="input" Width="210px">
                        <asp:ListItem Value="1">学生</asp:ListItem>
                        <asp:ListItem Value="2">教师</asp:ListItem>
                        <asp:ListItem Value="3">在职</asp:ListItem>
                        <asp:ListItem Value="4">其他</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="info">
                    <asp:Label ID="major" runat="server" Text="主修专业" CssClass="infoitem"></asp:Label>
                    <asp:DropDownList ID="MajorCourse" runat="server" CssClass="input" Width="210px">
                        <asp:ListItem Value="数字媒体技术">数字媒体技术</asp:ListItem>
                        <asp:ListItem Value="网络工程">网络工程</asp:ListItem>
                        <asp:ListItem Value="信息管理">信息管理</asp:ListItem>
                        <asp:ListItem Value="计算机科学与技术">计算机科学与技术</asp:ListItem>
                        <asp:ListItem Value="通信工程">通信工程</asp:ListItem>
                        <asp:ListItem Value="其他方向">其他方向</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="info">
                    <asp:Label ID="unit" runat="server" Text="学校单位" CssClass="infoitem"></asp:Label>
                    <asp:TextBox ID="txtUnit" runat="server" CssClass="input" Width="200px"></asp:TextBox>
                </div>
                <div class="info">
                    <asp:Label ID="pic" runat="server" Text="更换头像" CssClass="infoitem"></asp:Label>
                    <asp:FileUpload ID="UploadPic" runat="server" Width="200px" />
                </div>
                <asp:Button ID="save" runat="server" Text="保存" OnClick="save_Click" CssClass="save" />
            </div>
        </div>
    </form>
</body>
</html>
