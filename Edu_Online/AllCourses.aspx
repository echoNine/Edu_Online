<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllCourses.aspx.cs" Inherits="Edu_Online.AllCourses" %>

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

        .nav {
            font-size: 16px;
            padding: 0px 10% 7%;
        }

        .menu {
            background-color: #f7f7f7;
            width: 21%;
        }

        .person {
            width: 130px;
            padding: 4% 27.3% 2%;
        }

        .user {
            font-size: 24px;
            font-weight: bold;
            color: black;
            line-height: 60px;
            padding: 0 37.4%;
        }

        .item {
            line-height: 38px;
            color: #808080;
            padding: 3px 20px;
            border-radius: 5px;
            width: 80px;
            list-style-type: none;
            margin: 10px;
            height: 38px;
            cursor: pointer;
        }

            .item li {
                width: 70px;
                display: none;
                background-color: #f7f7f7;
                line-height: 38px;
                color: #808080;
                padding: 3px 12px;
                border-radius: 5px;
                position: absolute;
                left: 160px;
                font-size: 14px;
                
            }
            #itemInit{
                background-color: #60baf1;
            }
            #itemInit a{
                color: white;
                text-decoration:none;
            }
           
            .item a{
                color: #808080;
                text-decoration:none;
            }

            .item:hover,#itemInit:hover{
                background-color: #6699FF;
            }
            .item:hover a,#itemInit:hover a {      
                color: white;
            }

                .item:hover ul li {
                    display: block;
                }

                    .item:hover ul li:hover {
                        background-color: #6699FF;
                        color: white;
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
            top: 25%;
            left: 22.3%;
            width: 69%;
            height: 70%;
            padding: 16px 65px;
            overflow-y: auto;
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
            <asp:Image ID="person" runat="server" ImageUrl="~/img/person.png" CssClass="person" />
            <asp:Label ID="user" runat="server" CssClass="user"></asp:Label><br />
            <ul class="nav">
                <li class="item" id="itemInit"><a href="AllCourses.aspx">全部课程</a></li>
                <li class="item" id="item2"><a href="OpenedCourses.aspx">已开课程</a></li>
                <li class="item" id="item3">学生信息</li>
                <li class="item" id="item4">课程管理<ul>
                    <li style="top: 390px" id="item41">基本信息</li>
                    <li style="top: 434px" id="item42">视频管理</li>
                    <li style="top: 478px" id="item43">资料管理</li>
                </ul>
                </li>
                <li class="item" id="item5">作业管理</li>
                <li class="item" id="item6">课程评价</li>
                <li class="item" id="item7">个人中心</li>
            </ul>
        </div>

        <div class="header">
            <div class="tip">
                <asp:Label ID="wel" runat="server" Text="欢迎登录" CssClass="wel"></asp:Label>
                <asp:Image ID="img" runat="server" ImageUrl="~/img/person.png" CssClass="img" /><br />
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
</html>
