<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyCenter.aspx.cs" Inherits="Edu_Online.MyCenter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人中心</title>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
        }

        .Left {
            float: left;
            height: 100%;
            width: 30%;
        }

        .header {
            width: 100%;
            background-color: #d2d2d2;
            box-shadow: 0 8px 16px 0 rgba(7,17,27,.1);
            border-bottom: 4px solid white;
        }

        .StuPic {
            border: 7px solid white;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin: 20% 0 13% 25%;
        }

        .StuName {
            position: absolute;
            left: 17%;
            top: 11%;
            font-weight: 600;
            font-size: 24px;
            color: #fff;
            line-height: 28px;
        }

        .SomeInfo {
            position: absolute;
            top: 19%;
            left: 17%;
            font-size: 15px;
            color: #fff;
            font-weight: bold;
        }

        .StuSex, .StuSchool, .TypeName {
            margin-right: 10px;
        }

        .menu {
            width: 70%;
            height: 345px;
            background-color: #d2d2d2;
            padding: 10% 10% 10% 20%;
        }

        .linkBtn {
            text-decoration: none;
            line-height: 80px;
            padding: 6% 8%;
            background-color: white;
            border-radius: 8px 15px;
            border: 2px solid gray;
        }

        .linkImg {
            width: 22px;
            display: inline-block;
            box-sizing: border-box;
            vertical-align: middle;
        }

        .linkTitle {
            font-size: 16px;
            padding-left: 12px;
            display: inline-block;
            box-sizing: border-box;
            vertical-align: middle;
            font-weight: bold;
            color: #676767;
        }

        .Right {
            background-color: #fbfbfb;
            float: right;
            width: 69.5%;
            height: 657px;
            box-shadow: 0 0 0 7px rgba(7, 17, 27, 0.06);
            overflow: auto;
        }

        .courseItem {
            background-color: white;
            width: 80%;
            margin-left: 7%;
            margin-top: 3%;
            border-radius: 12px;
            box-shadow: 2px 3px 3px 2px #e8e8e8;
            padding: 30px 75px 35px 60px;
            height: 164px;
        }

        .cover {
            width: 300px;
            height: 160px;
            border-radius: 5px;
            box-shadow: 2px 2px 2px 2px #cecece;
            float: left;
            margin-right: 15%;
        }

        .courseName {
            float: left;
            font-size: 20px;
            font-weight: bold;
            color: #848484;
            margin-top: 3%;
        }

        .divItem {
            height: 50px;
            line-height: 50px;
            text-align: center;
            float: left;
            margin-left: 56%;
            margin-top: -9%;
            width: 40%;
        }

        .continue {
            color: white;
            padding: 10px 15px;
            background-color: #299bff;
            text-decoration: none;
            border-radius: 20px;
            cursor: pointer;
            font-size: 15px;
        }

        .drop {
            color: #6f6f6f;
            padding: 10px 15px;
            background-color: #dedede;
            text-decoration: none;
            border-radius: 20px;
            cursor: pointer;
            font-size: 15px;
            border: none;
            margin-left: 12%;
        }

        .UserInfo {
            background: #fff;
            height: 657px;
            width: 100%;
        }

        .leftTitle, .rightTitle {
            font-family: "pingfang SC", "Microsoft YaHei", "微软雅黑", helvetica, arial, verdana, tahoma, sans-serif;
            border-left: 5px solid #008BE1;
            font-size: 18px;
            padding-left: 25px;
        }

        .LeftInfo, .RightInfo {
            float: left;
            padding: 10% 4.8%;
            height: 70%;
            width: 40%;
            border: 1px solid #c4c4c4;
        }

        .infoItem {
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
            margin-top: 45px;
            font-family: "pingfang SC", "Microsoft YaHei", "微软雅黑", helvetica, arial, verdana, tahoma, sans-serif;
            font-size: 15px;
            color: #5e5e5e;
        }

        .save {
            height: 40px;
            width: 90px;
            margin-top: 120px;
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

        .PracticeInfo {
            width: 86%;
            margin: 6% 8%;
        }

        .workStatus {
            font-size: 19px;
            color: #676767;
            font-weight: bold;
            margin-right: 20px;
        }

        .statusItem {
            height: 30px;
            padding-left: 8px;
            width: 15%;
            font-size: 15px;
            color: gray;
            margin-bottom: 3%;
        }

        .noteItem {
            background-color: white;
            width: 700px;
            margin-left: 7%;
            margin-top: 6%;
            border-radius: 12px;
            box-shadow: 2px 3px 3px 2px #e8e8e8;
            padding: 5px 40px 20px;
        }

        .CourseVideo {
            font-size: 17px;
            font-weight: 700;
            color: #464646;
            line-height: 60px;
        }

        .noteContent {
            font-size: 15px;
            color: #505050;
            line-height: 45px;
            text-indent: 2em;
            display: inline-block;
            width: 76%;
            border: 1px solid #e6e6e6;
            border-radius: 5px;
        }

        .noteTime {
            font-size: 14px;
            color: #585858;
            float: right;
        }

        .return {
            width: 30px;
            position: absolute;
            top: 2%;
            left: 32%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="Left" runat="server" class="Left">
            <div id="header" runat="server" class="header">
                <asp:DataList ID="headerDataList" runat="server">
                    <ItemTemplate>
                        <asp:Image ImageUrl='<%# Eval("StuPic") %>' runat="server" ID="StuPic" CssClass="StuPic" />
                        <asp:Label Text='<%# Eval("StuName") %>' runat="server" ID="StuName" CssClass="StuName" /><br />
                        <div id="SomeInfo" runat="server" class="SomeInfo">
                            <asp:Label Text='<%# Eval("StuSex") %>' runat="server" ID="StuSex" CssClass="StuSex" />
                            <asp:Label Text='<%# Eval("StuSchool") %>' runat="server" ID="StuSchool" CssClass="StuSchool" />
                            <asp:Label Text='<%# Eval("TypeName") %>' runat="server" ID="TypeName" CssClass="TypeName" />
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>

            <div id="menu" runat="server" class="menu">
                <asp:LinkButton ID="myCourse" runat="server" CssClass="linkBtn" OnClick="myCourse_Click">
                    <asp:Image ID="courseImg" runat="server" ImageUrl="~/img/course.png" CssClass="linkImg" />
                    <asp:Label ID="courseTitle" runat="server" Text="我的课程" CssClass="linkTitle" />
                </asp:LinkButton><br />
                <asp:LinkButton ID="myNote" runat="server" CssClass="linkBtn" OnClick="myNote_Click">
                    <asp:Image ID="noteImg" runat="server" ImageUrl="~/img/note.png" CssClass="linkImg" />
                    <asp:Label ID="noteTitle" runat="server" Text="我的笔记" CssClass="linkTitle" />
                </asp:LinkButton><br />
                <asp:LinkButton ID="myWork" runat="server" CssClass="linkBtn" OnClick="myWork_Click">
                    <asp:Image ID="workImg" runat="server" ImageUrl="~/img/work.png" CssClass="linkImg" />
                    <asp:Label ID="workTitle" runat="server" Text="作业情况" CssClass="linkTitle" />
                </asp:LinkButton><br />
                <asp:LinkButton ID="mySetting" runat="server" CssClass="linkBtn" OnClick="mySetting_Click">
                    <asp:Image ID="settingImg" runat="server" ImageUrl="~/img/setting.png" CssClass="linkImg" />
                    <asp:Label ID="settingTitle" runat="server" Text="个人信息" CssClass="linkTitle" />
                </asp:LinkButton>
            </div>
        </div>

        <asp:ImageButton ID="return" runat="server" ImageUrl="~/img/return1.png" CssClass="return" OnClick="return_Click"/>

        <div id="Right" runat="server" class="Right">
            <asp:DataList ID="CourseInfo" runat="server" DataKeyField="courseId">
                <ItemTemplate>
                    <div id="courseItem" runat="server" class="courseItem">
                        <asp:Image ImageUrl='<%# Eval("cover") %>' runat="server" ID="cover" CssClass="cover" />
                        <asp:Label Text='<%# Eval("courseName") %>' runat="server" ID="courseName" CssClass="courseName" />
                        <div id="divItem" class="divItem">
                            <asp:HyperLink ID="continue" runat="server" Text="继续学习" NavigateUrl='<%#"~/StuCourseDetails.aspx?tip=again&courseId="+Eval("courseId") %>' CssClass="continue" />
                            <asp:LinkButton ID="drop" runat="server" Text="退出课程" CssClass="drop" OnClick="drop_Click" CommandArgument='<%# Eval("courseId") %>' />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>

            <div id="UserInfo" runat="server" class="UserInfo" visible="false">
                <div class="LeftInfo">
                    <asp:Label ID="BaseInfo" runat="server" Text="基本信息" CssClass="leftTitle"></asp:Label><br />
                    <div class="info">
                        <asp:Label ID="name" runat="server" Text="姓名" CssClass="infoItem"></asp:Label><asp:TextBox ID="txtName" runat="server" CssClass="input"></asp:TextBox>
                    </div>
                    <div class="info">
                        <asp:Label ID="sex" runat="server" Text="性别" CssClass="infoItem"></asp:Label>
                        <asp:RadioButton ID="Male" runat="server" GroupName="RadioSex" Text="男" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="Female" runat="server" GroupName="RadioSex" Text="女" />
                    </div>
                    <div class="info">
                        <asp:Label ID="birth" runat="server" Text="出生日期" CssClass="infoItem" Style="margin-right: 40px"></asp:Label>
                        <asp:DropDownList ID="year" runat="server" Style="width: 60px; padding-left: 5px;" CssClass="input"></asp:DropDownList>&nbsp;年&nbsp;
                        <asp:DropDownList ID="month" runat="server" Style="width: 60px; padding-left: 5px;" CssClass="input"></asp:DropDownList>&nbsp;月&nbsp;
                        <asp:DropDownList ID="day" runat="server" Style="width: 60px; padding-left: 5px;" CssClass="input"></asp:DropDownList>&nbsp;日&nbsp;
                    </div>
                    <div class="info">
                        <asp:Label ID="city" runat="server" Text="现居城市" CssClass="infoItem" Style="margin-right: 40px"></asp:Label><asp:TextBox ID="txtCity" runat="server" CssClass="input"></asp:TextBox>
                    </div>
                    <div class="info">
                        <asp:Label ID="phone" runat="server" Text="联系电话" CssClass="infoItem" Style="margin-right: 40px"></asp:Label><asp:TextBox ID="txtPhone" runat="server" CssClass="input"></asp:TextBox>
                    </div>
                </div>

                <div class="RightInfo">
                    <asp:Label ID="OtherInfo" runat="server" Text="其他信息" CssClass="rightTitle"></asp:Label>
                    <div class="info">
                        <asp:Label ID="type" runat="server" Text="用户类型" CssClass="infoItem"></asp:Label>
                        <asp:DropDownList ID="UserType" runat="server" CssClass="input" Width="210px">
                            <asp:ListItem Value="1">学生</asp:ListItem>
                            <asp:ListItem Value="2">教师</asp:ListItem>
                            <asp:ListItem Value="3">在职</asp:ListItem>
                            <asp:ListItem Value="4">其他</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="info">
                        <asp:Label ID="major" runat="server" Text="主修专业" CssClass="infoItem"></asp:Label>
                        <asp:DropDownList ID="MajorCourse" runat="server" CssClass="input" Width="210px">
                        <asp:ListItem Value="JavaScript">JavaScript</asp:ListItem>
                        <asp:ListItem Value="C">C</asp:ListItem>
                        <asp:ListItem Value="数据库">数据库</asp:ListItem>
                        <asp:ListItem Value="Android">Android</asp:ListItem>
                        <asp:ListItem Value=".Net">.Net</asp:ListItem>
                        <asp:ListItem Value="Php">Php</asp:ListItem>
                        <asp:ListItem Value="其他方向">其他方向</asp:ListItem>
                    </asp:DropDownList>
                    </div>
                    <div class="info">
                        <asp:Label ID="unit" runat="server" Text="学校单位" CssClass="infoItem"></asp:Label>
                        <asp:TextBox ID="txtUnit" runat="server" CssClass="input" Width="200px"></asp:TextBox>
                    </div>
                    <div class="info">
                        <asp:Label ID="pic" runat="server" Text="更换头像" CssClass="infoItem"></asp:Label>
                        <asp:FileUpload ID="UploadPic" runat="server" Width="200px" />
                    </div>
                    <asp:Button ID="save" runat="server" Text="保存" OnClick="save_Click" CssClass="save" Enabled="false" />
                    <asp:Button ID="update" runat="server" Text="修改" OnClick="update_Click" CssClass="update" />
                </div>
            </div>

            <asp:DataList ID="NoteInfo" runat="server" Visible="false">
                <ItemTemplate>
                    <asp:Panel ID="noteItem" runat="server" CssClass="noteItem">
                        <asp:Label Text='<%# Eval("courseName")+" > "+Eval("VideoName") %>' runat="server" ID="CourseVideo" CssClass="CourseVideo" /><br />
                        <asp:Label Text='<%# Eval("noteContent") %>' runat="server" ID="noteContent" CssClass="noteContent" /><br />
                        <asp:Label Text='<%# Eval("noteTime") %>' runat="server" ID="noteTime" CssClass="noteTime" /><br />
                    </asp:Panel>
                </ItemTemplate>
            </asp:DataList>

            <div id="PracticeInfo" runat="server" class="PracticeInfo" visible="false">
                <asp:Label ID="workStatus" runat="server" Text="作业状态" CssClass="workStatus" />
                <asp:DropDownList ID="PracticeStatus" runat="server" OnSelectedIndexChanged="PracticeStatus_SelectedIndexChanged" AutoPostBack="true" CssClass="statusItem">
                    <asp:ListItem Value="done">已完成</asp:ListItem>
                    <asp:ListItem Value="todo">未完成</asp:ListItem>
                </asp:DropDownList><br />
                <asp:GridView ID="DoneList" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="20" ForeColor="Black" GridLines="Horizontal">
                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="practiceName" HeaderText="练习名称"></asp:BoundField>
                        <asp:BoundField DataField="hardLevel" HeaderText="练习难度"></asp:BoundField>
                        <asp:BoundField DataField="courseName" HeaderText="所属课程"></asp:BoundField>
                        <asp:BoundField DataField="videoName" HeaderText="对应章节"></asp:BoundField>
                        <asp:BoundField DataField="score" HeaderText="练习得分"></asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle Font-Bold="True" ForeColor="White" HorizontalAlign="Center" BackColor="#9c9c9c" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" BackColor="#fffeed" ForeColor="#5d5d5d" />
                    <SelectedRowStyle BackColor="#60baf1" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2"></SortedAscendingCellStyle>
                    <SortedAscendingHeaderStyle BackColor="#848384"></SortedAscendingHeaderStyle>
                    <SortedDescendingCellStyle BackColor="#EAEAD3"></SortedDescendingCellStyle>
                    <SortedDescendingHeaderStyle BackColor="#575357"></SortedDescendingHeaderStyle>
                </asp:GridView>
                <asp:GridView ID="TodoList" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="20" ForeColor="Black" GridLines="Horizontal">
                    <Columns>
                        <asp:BoundField DataField="practiceName" HeaderText="练习名称"></asp:BoundField>
                        <asp:BoundField DataField="hardLevel" HeaderText="练习难度"></asp:BoundField>
                        <asp:BoundField DataField="courseName" HeaderText="所属课程"></asp:BoundField>
                        <asp:BoundField DataField="videoName" HeaderText="对应章节"></asp:BoundField>
                        <asp:TemplateField HeaderText="详情">
                            <ItemTemplate>
                                <a href="DoingPage.aspx?practiceId='<%#Eval("practiceId") %>'" style="color: #5D5D5D; text-decoration: none;">开始练习</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle Font-Bold="True" ForeColor="White" HorizontalAlign="Center" BackColor="#9c9c9c" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" BackColor="#fffeed" ForeColor="#5d5d5d" />
                    <SelectedRowStyle BackColor="#60baf1" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2"></SortedAscendingCellStyle>
                    <SortedAscendingHeaderStyle BackColor="#848384"></SortedAscendingHeaderStyle>
                    <SortedDescendingCellStyle BackColor="#EAEAD3"></SortedDescendingCellStyle>
                    <SortedDescendingHeaderStyle BackColor="#575357"></SortedDescendingHeaderStyle>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
