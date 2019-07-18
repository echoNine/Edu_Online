<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Header.aspx.cs" Inherits="Edu_Online.Header" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="allcourse-Type" content="text/html; charset=utf-8" />
    <title>主页面</title>
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

        .who {
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

            .item:hover {
                background-color: #6699FF;
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
            display: none;
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

        .openedcourse {
            background-color: #f7f7f7;
            position: absolute;
            top: 26%;
            left: 23%;
            padding: 30px 50px;
            height: 380px;
            width: 930px;
            display:none;
        }

        .auto-style3 {
            background-color: #60baf1;
            width: 80%;
            border-radius: 10px;
            padding: 30px;
        }

        .auto-style4 {
            width: 40%;
            padding: 11px 20px;
        }


        .auto-style5 {
            width: 400px;
        }

        .upvideo, .upfile {
            background-color: #f7f7f7;
            position: absolute;
            top: 26%;
            left: 23%;
            padding: 3% 0 3% 3%;
            height: 57%;
            width: 72%;
            display: none;
            color: white;
            font-size: 18px;
            display:none;
        }

        .save {
            background-color: white;
            height: 26px;
            width: 60px;
            border: none;
        }

        .view {
            position: absolute;
            bottom: 10%;
            right: 6%;
            color: #707477;
            text-decoration: none;
        }

            .view:hover {
                color: #60baf1;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="menu">
            <asp:Image ID="person" runat="server" ImageUrl="~/images/person.png" CssClass="person" />
            <asp:Label ID="who" runat="server" CssClass="who"></asp:Label><br />
            <ul class="nav">
                <li class="item" id="item1" onclick="li_click(event)">首页</li>
                <li class="item" id="item2" onclick="li_click(event)">已开课程</li>
                <li class="item" id="item3">学生信息</li>
                <li class="item" id="item4">课程管理<ul>
                    <li style="top: 390px" id="item41" onclick="li_click(event)">视频管理</li>
                    <li style="top: 434px" id="item42" onclick="li_click(event)">资料管理</li>
                </ul>
                </li>
                <li class="item" id="item5">作业管理</li>
                <li class="item" id="item6">课程评价</li>
                <li class="item" id="item7">个人中心</li>
            </ul>
        </div>

        <div class="header">
            <div class="tip">
                <asp:Label ID="name" runat="server" CssClass="name"></asp:Label>
                <asp:Label ID="wel" runat="server" Text=",欢迎登录" CssClass="wel"></asp:Label>
                <asp:Image ID="img" runat="server" ImageUrl="~/images/person.png" CssClass="img" /><br />
                <asp:Button ID="quit" runat="server" Text="退出" CssClass="quit" OnClick="quit_Click" />
            </div>
        </div>

        <div class="allcourse" runat="server" id="allcourse">
            <asp:DataList ID="info" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="3" AutoPostBack="true" DataKeyField="courseName">
                <ItemTemplate>
                    <a class="link" href="CourseIndex.aspx?name='<%# DataBinder.Eval(Container.DataItem,"CourseName") %>'" style="text-decoration: none;">
                        <asp:Image ID="cover" runat="server" ImageUrl='<%# Eval("cover") %>' CssClass="cover" />
                        <br />
                        <asp:Label ID="name" runat="server" Text='<%# Eval("CourseName") %>' CssClass="name" />
                    </a>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EduString %>" SelectCommand="SELECT * FROM [CourseInfo]"></asp:SqlDataSource>
        </div>

        <div class="openedcourse" runat="server" id="openedcourse">
            <asp:GridView ID="gvopened" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="930px" Height="380px">
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
                </Columns>
                <FooterStyle BackColor="#60baf1" ForeColor="Black" />
                <HeaderStyle Font-Bold="True" ForeColor="White" HorizontalAlign="Center" BackColor="#60baf1" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#60baf1" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EduString %>" SelectCommand="SELECT [courseId], [courseName], [courseType], [count], [part] FROM [CourseInfo]"></asp:SqlDataSource>
        </div>

        <div class="upvideo" runat="server" id="upvideo">
            <table class="auto-style3">
                <tr>
                    <td class="auto-style4">视频编号</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="videoid" runat="server" Height="24px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">视频名称</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="videoname" runat="server" Height="24px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">视频资源</td>
                    <td class="auto-style5">
                        <asp:FileUpload ID="videopath" runat="server" Height="24px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">所属课程类别</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="videotype" runat="server" Height="26px">
                            <asp:ListItem Value="计算机">计算机</asp:ListItem>
                            <asp:ListItem Value="艺术设计">艺术设计</asp:ListItem>
                            <asp:ListItem Value="外语">外语</asp:ListItem>
                            <asp:ListItem Value="电视艺术">电视艺术</asp:ListItem>
                            <asp:ListItem Value="管理学">管理学</asp:ListItem>
                            <asp:ListItem Value="文学文化">文学文化</asp:ListItem>
                            <asp:ListItem Value="其他方向">其他方向</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">所属课程名</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="videocourse" runat="server" Height="26px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="videotip" runat="server" Height="26px"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:Button ID="save" runat="server" Text="上传" OnClick="videosave_Click" OnClientClick="return videosave_client_click();" CssClass="save" />
                        <br />
                    </td>
                </tr>
            </table>
            <br />
            <asp:HyperLink ID="viewVideo" runat="server" NavigateUrl="~/VideoList.aspx" CssClass="view">查看视频资源</asp:HyperLink>
        </div>

        <div class="upfile" runat="server" id="upfile">
            <table class="auto-style3">
                <tr>
                    <td class="auto-style4">文件编号</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="fileid" runat="server" Height="24px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">文件名称</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="filename" runat="server" Height="24px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">文件资源</td>
                    <td class="auto-style5">
                        <asp:FileUpload ID="filepath" runat="server" Height="24px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">所属课程类别</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="filetype" runat="server" Height="26px">
                            <asp:ListItem Value="计算机">计算机</asp:ListItem>
                            <asp:ListItem Value="艺术设计">艺术设计</asp:ListItem>
                            <asp:ListItem Value="外语">外语</asp:ListItem>
                            <asp:ListItem Value="电视艺术">电视艺术</asp:ListItem>
                            <asp:ListItem Value="管理学">管理学</asp:ListItem>
                            <asp:ListItem Value="文学文化">文学文化</asp:ListItem>
                            <asp:ListItem Value="其他方向">其他方向</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">所属课程名</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="filecourse" runat="server" Height="26px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="filetip" runat="server" Height="26px"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:Button ID="filesave" runat="server" Text="上传" OnClick="filesave_Click" OnClientClick="filesave_Click" CssClass="save" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:HyperLink ID="viewFile" runat="server" NavigateUrl="~/FileList.aspx" CssClass="view">查看文件资源</asp:HyperLink>
        </div>
    </form>
</body>
    <script type="text/javascript">
        function li_click(event) {
            changeTab(event.target.id)
        }
        function changeTab(id) {
            //根据id 设置显示隐藏
            let map = {
                "item1": "allcourse",
                "item2": "openedcourse",
                "item41": "upvideo",
                "item42": "upfile",
            }
            document.getElementById(map[id]).style.display = "block";
            localStorage.setItem("current_tab_id", id);
            for (var i in map) {
                if (i != id) {
                    document.getElementById(map[i]).style.display = "none";
                }
            }
        }

        let back_tab_id = localStorage.getItem("back_tab_id");
        if (back_tab_id) {
            changeTab(back_tab_id);
            clear_current_tab_cache();
        } else {
            changeTab("item1");
        }
        function clear_current_tab_cache() {
            localStorage.removeItem("current_tab_id");
            localStorage.removeItem("back_tab_id");
        }

        //设置需要回退到的tab_id
        function videosave_client_click() {
            localStorage.setItem("back_tab_id", localStorage.getItem("current_tab_id"));
        }
    </script>
</html>
