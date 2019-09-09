﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllCourses.aspx.cs" Inherits="Edu_Online.AllCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>全部开设课程</title>
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

        .allcourse {
            background-color: #f7f7f7;
            position: absolute;
            top: 23%;
            left: 21.4%;
            width: 68%;
            height: 71%;
            padding: 10px 70px 35px;
            overflow: auto;
        }

        .cover {
            width: 275px;
            height: 170px;
            padding-right: 50px;
            margin-top: 26px;
            overflow: auto;
        }

        .name {
            line-height: 40px;
            color: #4b99ca;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="menu">
            <asp:Image ID="person" runat="server" CssClass="person" />
            <asp:Label ID="user" runat="server" CssClass="user"></asp:Label><br />
            <ul class="nav">
                <li class="itemInit"><a href="AllCourses.aspx">全部课程</a></li>
                <li class="item"><a href="OpenedCourses.aspx">已开课程</a></li>
                <li class="item4">课程管理<ul>
                    <li style="bottom: 31%"><a href="InfoManage.aspx">新设课程</a></li>
                    <li style="bottom: 24.5%"><a href="VideoManage.aspx">视频管理</a></li>
                    <li style="bottom: 18%"><a href="SrcManage.aspx">资料管理</a></li>
                </ul>
                </li>
                <li class="item"><a href="PushPractice.aspx">作业管理</a></li>
                <li class="item"><a href="AddUserInfo.aspx">个人中心</a></li>
            </ul>
        </div>

        <div class="header">
            <div class="tip">
                <asp:Label ID="wel" runat="server" Text="欢迎登录" CssClass="wel"></asp:Label>
                <asp:Image ID="img" runat="server" CssClass="img" /><br />
                <asp:Button ID="quit" runat="server" Text="退出" CssClass="quit" OnClick="quit_Click" />
            </div>
        </div>

        <div class="allcourse" runat="server" id="allcourse">
            <asp:DataList ID="info" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="3" AutoPostBack="true" DataKeyField="courseName">
                <ItemTemplate>
                    <a class="link" href="CourseIntro.aspx?name='<%# DataBinder.Eval(Container.DataItem,"CourseName") %>'" style="text-decoration: none;">
                        <asp:Image ID="cover" runat="server" ImageUrl='<%# Eval("cover") %>' CssClass="cover" />
                        <br />
                        <asp:Label ID="name" runat="server" Text='<%# Eval("CourseName") %>' CssClass="name" />
                    </a>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EduString %>" SelectCommand="SELECT * FROM [CourseInfo]"></asp:SqlDataSource>
        </div>
    </form>
</body>
<script >
    $(document).ready(function() {
        $.ajax({
                    type: "post",
                    url: "AllCourses.aspx/GetAllCourses",
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify(opt),
                    success: function (result) {
                        var list = result.d;
                        
                       console.log(result.d);
                       
                    },
                    error: function (result) {
                        alert("系统繁忙")
                    }
                  });
    })
</script>
</html>
