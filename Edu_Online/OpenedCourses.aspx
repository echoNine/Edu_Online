<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OpenedCourses.aspx.cs" Inherits="Edu_Online.OpenedCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>已开课程</title>
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

        #itemInit {
            background-color: #60baf1;
        }

            #itemInit a {
                color: white;
                text-decoration: none;
            }

        .item a {
            color: #808080;
            text-decoration: none;
        }

        .item:hover, #itemInit:hover {
            background-color: #6699FF;
        }

            .item:hover a, #itemInit:hover a {
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

        .openedcourse {
            background-color: #f7f7f7;
            position: absolute;
            top: 26%;
            left: 23%;
            padding: 30px 50px;
            height: 61%;
            width: 69.3%;
        }

        .selectcourse {
            color: gray;
            padding-left: 8px;
            height: 10%;
            width: 15%;
            font-size: 14px;
        }

        .select {
            height: 40px;
            width: 80px;
            border: none;
            border-radius: 5px;
            background: #60baf1;
            color: #fff;
            right: 10px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
        }

        .del {
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
                <li class="item" id="item1"><a href="AllCourses.aspx">全部课程</a></li>
                <li class="item" id="itemInit"><a href="OpenedCourses.aspx">已开课程</a></li>
                <li class="item" id="item3">学生信息</li>
                <li class="item" id="item4">课程管理<ul>
                    <li style="top: 390px" id="item41" onclick="li_click(event)">基本信息</li>
                    <li style="top: 434px" id="item42" onclick="li_click(event)">视频管理</li>
                    <li style="top: 478px" id="item43" onclick="li_click(event)">资料管理</li>
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

        <div class="openedcourse" runat="server" id="openedcourse">
            <asp:DropDownList ID="selectcourse" runat="server" CssClass="selectcourse">
                <asp:ListItem Value="全部课程" Text="全部课程"></asp:ListItem>
                <asp:ListItem Value="课程代码" Text="课程代码"></asp:ListItem>
                <asp:ListItem Value="课程名称" Text="课程名称"></asp:ListItem>
                <asp:ListItem Value="课程类别" Text="课程类别"></asp:ListItem>
            </asp:DropDownList>
            <input id="selectkey" type="text" placeholder="请输入内容" class="selectcourse" style="height: 9%" runat="server" value="" />
            <asp:Button ID="select" runat="server" Text="查询" CssClass="select" OnClick="select_Click" OnClientClick="return select_client_click()" />
            <div style="overflow: auto; height: 88%; margin-top: 1%;">
                <asp:GridView ID="gvopened" runat="server" AutoGenerateColumns="False" DataKeyNames="courseId" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="930px" OnRowDeleting="gvopened_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="courseId" HeaderText="课程代码" SortExpression="courseId" />
                        <asp:BoundField DataField="courseName" HeaderText="课程名称" SortExpression="courseName" />
                        <asp:BoundField DataField="courseType" HeaderText="课程类别" SortExpression="courseType" />
                        <asp:BoundField DataField="count" HeaderText="可选人数" SortExpression="count" />
                        <asp:BoundField DataField="part" HeaderText="课程节数" SortExpression="part" />
                        <asp:TemplateField HeaderText="详情">
                            <ItemTemplate>
                                <a href="CourseDetails.aspx?courseId='<%#Eval("courseId") %>'" style="color: black; text-decoration: none;">查看</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" HeaderText="删除" ControlStyle-CssClass="del" />
                    </Columns>
                    <FooterStyle BackColor="#60baf1" ForeColor="Black" />
                    <HeaderStyle Font-Bold="True" ForeColor="White" HorizontalAlign="Center" BackColor="#60baf1" Height="80px"/>
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" Height="60px"/>
                    <SelectedRowStyle BackColor="#60baf1" Font-Bold="True" ForeColor="White"  />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EduString %>" SelectCommand="SELECT [courseId], [courseName], [courseType], [count], [part] FROM [CourseInfo]"></asp:SqlDataSource>
            </div>
        </div>
    </form>
</body>
</html>
