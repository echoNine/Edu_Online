<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PushPractice.aspx.cs" Inherits="Edu_Online.PushPractice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加作业</title>
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
            color: #fff;
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

        .newpractice {
            background-color: #f7f7f7;
            position: absolute;
            top: 23%;
            left: 21.4%;
            padding: 2% 0 3% 3%;
            height: 68%;
            width: 75.2%;
            font-size: 18px;
        }

        .worktable {
            margin-left: 3%;
            margin-top: 3%;
        }

        .newbtn {
            padding: 12px 22px;
            font-size: 16px;
            color: white;
            background-color: #60baf1;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            box-shadow: 2px 3px 2px #e0e0e0;
            margin-left: 3%;
        }

            .newbtn:hover {
                background-color: #286090;
                border-color: #204d74;
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
                <li class="itemInit"><a href="PushPractice.aspx">作业管理</a></li>
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

        <div class="newpractice" runat="server" id="newpractice">
            <asp:Button ID="add" runat="server" Text="新增练习" OnClick="add_Click" CssClass="newbtn" />
            <asp:GridView ID="WorkList" runat="server" AutoGenerateColumns="False" DataKeyNames="practiceId" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="930px" CssClass="worktable">
                <Columns>
                    <asp:BoundField DataField="practiceName" HeaderText="作业名称" HeaderStyle-Width="20%"></asp:BoundField>
                    <asp:BoundField DataField="hardLevel" HeaderText="难度等级" HeaderStyle-Width="15%"></asp:BoundField>
                    <asp:BoundField DataField="courseName" HeaderText="课程名称" HeaderStyle-Width="25%"></asp:BoundField>
                    <asp:BoundField DataField="VideoName" HeaderText="章节名称" HeaderStyle-Width="25%"></asp:BoundField>
                    <asp:TemplateField HeaderText="详情" HeaderStyle-Width="15%">
                        <ItemTemplate>
                            <a href="PracticePage.aspx?practiceId='<%#Eval("practiceId") %>'" style="color: #666666; text-decoration: none;">查看</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#60baf1" ForeColor="#666666" />
                <HeaderStyle Font-Bold="True" ForeColor="White" HorizontalAlign="Center" BackColor="#60baf1" Height="65px" Font-Size="16px" />
                <PagerStyle BackColor="White" ForeColor="#666666" HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Center" Height="55px" ForeColor="#666666" Font-Size="16px" />
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
