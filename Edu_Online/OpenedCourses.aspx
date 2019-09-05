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

        .openedcourse {
            background-color: #f7f7f7;
            position: absolute;
            top: 23%;
            left: 21.4%;
            width: 68%;
            height: 69%;
            padding: 35px 70px;
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
            <asp:Image ID="person" runat="server" CssClass="person" />
            <asp:Label ID="user" runat="server" CssClass="user"></asp:Label><br />
            <ul class="nav">
                <li class="item"><a href="AllCourses.aspx">全部课程</a></li>
                <li class="itemInit"><a href="OpenedCourses.aspx">已开课程</a></li>
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

        <div class="openedcourse" runat="server" id="openedcourse">
            <asp:DropDownList ID="selectcourse" runat="server" CssClass="selectcourse">
                <asp:ListItem Value="全部课程" Text="全部课程"></asp:ListItem>
                <asp:ListItem Value="课程代码" Text="课程代码"></asp:ListItem>
                <asp:ListItem Value="课程名称" Text="课程名称"></asp:ListItem>
                <asp:ListItem Value="课程类别" Text="课程类别"></asp:ListItem>
            </asp:DropDownList>
            <input id="selectkey" type="text" placeholder="请输入内容" class="selectcourse" style="height: 9%" runat="server" value="" />
            <asp:Button ID="select" runat="server" Text="查询" CssClass="select" OnClick="select_Click" OnClientClick="return select_client_click()" />
            <div style="overflow: auto; height: 88%; margin-top: 3%;">
                <asp:GridView ID="gvopened" runat="server" AutoGenerateColumns="False" DataKeyNames="courseId" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="930px" OnRowDeleting="gvopened_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="courseId" HeaderText="课程代码" SortExpression="courseId" />
                        <asp:BoundField DataField="courseName" HeaderText="课程名称" SortExpression="courseName" />
                        <asp:BoundField DataField="courseTypeName" HeaderText="课程类别" SortExpression="courseTypeName" />
                        <asp:BoundField DataField="orderNum" HeaderText="已选人数" SortExpression="orderNum" />
                        <asp:BoundField DataField="part" HeaderText="课程节数" SortExpression="part" />
                        <asp:TemplateField HeaderText="详情">
                            <ItemTemplate>
                                <a href="CourseDetails.aspx?courseId='<%#Eval("courseId") %>'" style="color: black; text-decoration: none;">查看</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" HeaderText="删除" ControlStyle-CssClass="del" />
                    </Columns>
                    <FooterStyle BackColor="#60baf1" ForeColor="Black" />
                    <HeaderStyle Font-Bold="True" ForeColor="White" HorizontalAlign="Center" BackColor="#60baf1" Height="65px" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" Height="55px" />
                    <SelectedRowStyle BackColor="#60baf1" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
