<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUserInfo.aspx.cs" Inherits="Edu_Online.AddTeacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>完善信息</title>
    <style type="text/css">
        body {
            overflow: hidden;
            color: #808080;
            padding: 0px;
            margin: 0px;
            background-color: #60baf1;
            background-repeat: no-repeat;
            font-family: "pingfang SC", "Microsoft YaHei", "微软雅黑", helvetica, arial, verdana, tahoma, sans-serif;
        }



        .menu {
            background-color: #f7f7f7;
            width: 21%;
        }

        .person {
            width: 130px;
            padding: 10% 27.3% 2%;
        }

        .user {
            font-size: 24px;
            font-weight: bold;
            color: black;
            line-height: 80px;
            padding: 0 37.4%;
        }

        .nav {
            padding: 0% 10% 15%;
        }

        .item, .item4 {
            line-height: 40px;
            border-radius: 24px 12px;
            margin: 24px 18px;
            height: 40px;
            cursor: pointer;
            border: 2px solid #cccccc;
            width: 75px;
            font-size: 15px;
            padding: 0px 13px;
            text-align: center;
            list-style: none;
            color: #808080;
        }

        .itemInit {
            line-height: 40px;
            border-radius: 24px 12px;
            margin: 24px 18px;
            height: 40px;
            cursor: pointer;
            border: 2px solid #cccccc;
            width: 75px;
            font-size: 15px;
            padding: 0px 13px;
            text-align: center;
            list-style: none;
            background-color: #60baf1;
        }

            .itemInit a {
                text-decoration: none;
                color: #fff;
            }

        .item a, .item4 a {
            text-decoration: none;
            color: #808080;
        }

        .item4 li {
            width: 55px;
            display: none;
            line-height: 38px;
            padding: 0px 12px;
            position: absolute;
            left: 11%;
            list-style: none;
            font-size: 13px;
            border-radius: 20px 10px;
            border: 2px solid #cccccc;
        }

        .item:hover, .itemInit:hover, .item4:hover, .item:hover a {
            background-color: #6699FF;
            color: white;
        }

            .item4:hover ul li:hover {
                background-color: #6699FF;
            }

                .item4:hover ul li:hover a {
                    color: white;
                }

            .item4:hover ul li {
                display: block;
            }

        .header {
            background-color: #f7f7f7;
            position: absolute;
            top: 0px;
            right: 0px;
            width: 78.6%;
            height: 22%;
        }

        .tip {
            position: absolute;
            right: 20px;
            top: 12px;
        }

        .name, .wel {
            line-height: 40px;
            vertical-align: middle;
        }

        .img {
            line-height: 40px;
            width: 40px;
            vertical-align: middle;
        }

        .quit {
            position: absolute;
            height: 40px;
            width: 80px;
            border: none;
            border-radius: 5px;
            background: #60baf1;
            color: #fff;
            top: 65px;
            right: 10px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
        }

        .main {
            position: absolute;
            width: 967px;
            height: 445px;
            left: 21.4%;
            top: 23%;
            background: #f7f7f7;
            padding: 30px 50px;
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
            margin-left: 148px;
            margin-right: 20px;
            border: none;
            border-radius: 5px;
            background: #008BE1;
            color: #fff;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            font-family: "pingfang SC", "Microsoft YaHei", "微软雅黑", helvetica, arial, verdana, tahoma, sans-serif;
        }

        .update {
            height: 40px;
            width: 90px;
            border: none;
            border-radius: 5px;
            background: #a2a2a2;
            color: #fff;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            font-family: "pingfang SC", "Microsoft YaHei", "微软雅黑", helvetica, arial, verdana, tahoma, sans-serif;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="menu">
            <asp:Image ID="person" runat="server" CssClass="person" />
            <asp:Label ID="user" runat="server" CssClass="user"></asp:Label><br />
            <ul class="nav">
                <li class="item"><a href="AllCourses.aspx">全部课程</a></li>
                <li class="item"><a href="OpenedCourses.aspx">已开课程</a></li>
                <li class="item4">课程管理<ul>
                    <li style="bottom: 31%"><a href="InfoManage.aspx">新设课程</a></li>
                    <li style="bottom: 24.5%"><a href="VideoManage.aspx">视频管理</a></li>
                    <li style="bottom: 18%"><a href="SrcManage.aspx">资料管理</a></li>
                </ul>
                </li>
                <li class="item"><a href="PushPractice.aspx">作业管理</a></li>
                <li class="itemInit"><a href="AddUserInfo.aspx">个人中心</a></li>
            </ul>
        </div>

        <div class="header">
            <div class="tip">
                <asp:Label ID="wel" runat="server" Text="欢迎登录" CssClass="wel"></asp:Label>
                <asp:Image ID="img" runat="server" CssClass="img" /><br />
                <asp:Button ID="quit" runat="server" Text="退出" CssClass="quit" OnClick="quit_Click" />
            </div>
        </div>

        <div class="main">
            <div class="LeftInfo">
                <asp:Label ID="BaseInfo" runat="server" Text="基本信息" CssClass="lefttitle"></asp:Label><br />
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
                    <asp:Label ID="city" runat="server" Text="现居城市" CssClass="infoitem" Style="margin-right: 40px"></asp:Label>
                    <asp:TextBox ID="txtCity" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="info">
                    <asp:Label ID="phone" runat="server" Text="联系电话" CssClass="infoitem" Style="margin-right: 40px"></asp:Label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="input"></asp:TextBox>
                </div>
            </div>

            <div class="RightInfo">
                <asp:Label ID="OtherInfo" runat="server" Text="其他信息" CssClass="righttitle"></asp:Label>
                <div class="info">
                    <asp:Label ID="type" runat="server" Text="教师从属类型" CssClass="infoitem" Style="margin-right: 40px"></asp:Label>
                    <asp:DropDownList ID="TeachType" runat="server" CssClass="input" Width="210px">
                        <asp:ListItem Value="1">教师</asp:ListItem>
                        <asp:ListItem Value="2">在职</asp:ListItem>
                        <asp:ListItem Value="3">研究员</asp:ListItem>
                        <asp:ListItem Value="4">其他</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="info">
                    <asp:Label ID="Major" runat="server" Text="教学方向" CssClass="infoitem"></asp:Label>
                    <asp:DropDownList ID="TeachMajor" runat="server" CssClass="input" Width="210px">
                        <asp:ListItem Value="计算机">计算机</asp:ListItem>
                        <asp:ListItem Value="艺术设计">艺术设计</asp:ListItem>
                        <asp:ListItem Value="外语">外语</asp:ListItem>
                        <asp:ListItem Value="经济金融">经济金融</asp:ListItem>
                        <asp:ListItem Value="管理学">管理学</asp:ListItem>
                        <asp:ListItem Value="会计">会计</asp:ListItem>
                        <asp:ListItem Value="其他方向">其他方向</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="info">
                    <asp:Label ID="unit" runat="server" Text="任职单位" CssClass="infoitem"></asp:Label>
                    <asp:TextBox ID="txtUnit" runat="server" CssClass="input" Width="200px"></asp:TextBox>
                </div>
                <div class="info">

                    <asp:Label ID="intro" runat="server" Text="个人简介" CssClass="infoitem"></asp:Label>
                    <asp:TextBox ID="txtIntro" runat="server" CssClass="input" Width="200px" ></asp:TextBox>
                </div>
                <div class="info">
                    <asp:Label ID="pic" runat="server" Text="更换头像" CssClass="infoitem"></asp:Label>
                    <asp:FileUpload ID="UploadPic" runat="server" Width="200px" />
                </div>
                <asp:Button ID="save" runat="server" Text="保存" OnClick="save_Click" CssClass="save" Enabled="false" />
                <asp:Button ID="update" runat="server" Text="修改" OnClick="update_Click" CssClass="update" />
            </div>
        </div>
    </form>
</body>
</html>
