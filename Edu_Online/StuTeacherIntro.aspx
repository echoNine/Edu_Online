<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StuTeacherIntro.aspx.cs" Inherits="Edu_Online.StuTeacherIntro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>师资简介</title>
    <style type="text/css">
        body {
            padding: 0;
            margin: 0;
            overflow-x: hidden;
        }

        .header {
            width: 100%;
            background-color: white;
            padding-right: 10px;
            z-index: 900;
            box-shadow: 0 4px 8px 0 rgba(7, 17, 27, 0.1);
            border-bottom: 4px solid #e8e7e7;
            line-height: 70px;
        }

        .PageLink {
            width: 26%;
            margin-left: 10%;
        }

        .LinkTitle {
            margin: 20px;
            font-size: 17px;
            border: none;
            padding: 5px 14px;
            background-color: white;
            color: #4D555D;
            cursor: pointer;
            text-decoration: none;
        }

            .LinkTitle:hover {
                color: #60baf1;
            }

        .userImg {
            position: absolute;
            top: 2.5%;
            right: 3%;
            width: 43px;
            cursor: pointer;
        }

        .UserSetting {
            position: absolute;
            right: 2%;
            top: 9%;
            width: 20%;
            padding: 0 1.5%;
            background-color: white;
            border-radius: 0 0 5px 5px;
            z-index: 999;
            display: none;
        }

        .user {
            font-size: 18px;
            position: absolute;
            top: 5%;
            left: 13%;
        }

        .userItem {
            border: none;
            padding: 10px 26px;
            background-color: #ececec;
            border-radius: 4px;
            margin-left: 5%;
            cursor: pointer;
        }

            .userItem:hover {
                background-color: #e1e1e1;
            }

        .exit {
            color: #807c7c;
            cursor: pointer;
            font-size: 14px;
            margin-left: 41%;
            text-decoration: none;
        }

            .exit:hover {
                color: #60baf1;
            }

        .main {
            width: 90%;
            padding: 2% 5%;
        }

        .TeacherItem {
            width: 470px;
            background-color: aliceblue;
            box-shadow: 4px 6px #ece6e6;
            border-radius: 8px;
            border: 2px solid #ece6e6;
            padding: 20px 50px;
            margin-right: 72px;
            height: 300px;
                margin-bottom: 6%;
        }

        .nameItem {
            font-size: 22px;
            font-weight: bold;
            color: #4a4a4a;
            line-height: 50px;
            margin-right: 20px;
        }

        .sexItem, .typeItem {
            color: #6d6d6d;
            font-weight: bold;
            margin-right: 12px;
            line-height: 50px;
            font-size: 15px;
        }

        .picItem {
            float: right;
            margin-top: -7%;
        }

        .unitTitle, .majorTitle {
            line-height: 35px;
            color: #4a4a4a;
            font-size: 16px;
        }

        .unitItem, .majorItem {
            font-size: 15px;
            line-height: 30px;
            color: #4a4a4a;
        }

        .introTitle {
            line-height: 60px;
            color: #4a4a4a;
            font-weight: bold
        }

        .introItem {
            display: inline-block;
            width: 50%;
            text-indent: 2em;
            line-height: 30px;
            font-size: 15px;
            color: #4a4a4a;
            padding: 0 4px;
            height: 120px;
            overflow-y: auto;
        }
        .introItem::-webkit-scrollbar {
    display: none;
}
        .linkItem {
            text-decoration: none;
            color: #7b7b7b;
            font-size: 16px;
            font-weight: bold;
            float: right;
            margin-right: 13%;
            margin-top: -10%;
        }

            .linkItem:hover {
                color: #2386d0;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header" runat="server" class="header">
            <asp:Panel ID="PageLink" runat="server" CssClass="PageLink">
                <asp:HyperLink ID="indexPage" runat="server" Text="首页" CssClass="LinkTitle" NavigateUrl="~/StuHeader.aspx" />
                <asp:HyperLink ID="coursePage" runat="server" Text="课程" CssClass="LinkTitle" NavigateUrl="~/StuCourseSearch.aspx" />
                <asp:HyperLink ID="teacherPage" runat="server" Text="师资" CssClass="LinkTitle" ForeColor="#60baf1" NavigateUrl="~/StuTeacherIntro.aspx" />
            </asp:Panel>
            <asp:ImageButton ID="userImg" runat="server" CssClass="userImg" onmouseover="Show()" onmouseout="Hide()" />
            <asp:Panel ID="UserSetting" runat="server" CssClass="UserSetting" onmouseover="Show()" onmouseout="Hide()">
                <asp:Label ID="user" runat="server" CssClass="user"></asp:Label><br />
                <asp:Button ID="myCourse" runat="server" Text="我的课程" CssClass="userItem" OnClick="myCourse_Click" />
                <asp:Button ID="myNote" runat="server" Text="我的笔记" CssClass="userItem" OnClick="myNote_Click" />
                <asp:Button ID="myWork" runat="server" Text="作业情况" CssClass="userItem" OnClick="myWork_Click" />
                <asp:Button ID="myInfo" runat="server" Text="个人信息" CssClass="userItem" OnClick="myInfo_Click" />
                <hr />
                <asp:HyperLink ID="exit" runat="server" CssClass="exit" NavigateUrl="~/Index.aspx">退出登录</asp:HyperLink>
            </asp:Panel>
        </div>

        <div id="main" runat="server" class="main">
            <asp:DataList ID="TeacherData" runat="server" RepeatColumns="2">
                <ItemTemplate>
                    <asp:Panel ID="TeacherItem" runat="server" CssClass="TeacherItem">
                        <asp:Label Text='<%# Eval("TeachName") %>' runat="server" ID="TeachName" CssClass="nameItem" />
                        <asp:Label Text='<%# Eval("TeachSex") %>' runat="server" ID="TeachSex" CssClass="sexItem" />
                        <asp:Label Text='<%# Eval("TypeName") %>' runat="server" ID="TypeName" CssClass="typeItem" /><br />
                        <asp:Image ImageUrl='<%# Eval("TeachPic") %>' runat="server" ID="TeachPic" CssClass="picItem" />
                        <asp:Label Text="所在单位：" runat="server" ID="unitItem" CssClass="unitTitle" />
                        <asp:Label Text='<%# Eval("TeachUnit") %>' runat="server" ID="TeachUnit" CssClass="unitItem" /><br />
                        <asp:Label Text="主修专业：" runat="server" ID="majorItem" CssClass="majorTitle" />
                        <asp:Label Text='<%# Eval("TeachMajor") %>' runat="server" ID="TeachMajor" CssClass="majorItem" /><br />
                        <asp:Label Text="个人简介" runat="server" ID="introTitle" CssClass="introTitle" /><br />
                        <asp:Label Text='<%# Eval("intro") %>' runat="server" ID="intro" CssClass="introItem" /><br />
                        <asp:HyperLink ID="link" runat="server" Text="详细信息" NavigateUrl='<%#"~/StuTeachCourseInfo.aspx?id="+Eval("TeachId") %>' CssClass="linkItem" /><br />
                    </asp:Panel>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </form>
</body>
<script>
    var Userdiv = document.getElementById("UserSetting");
    function Show() {
        Userdiv.style.display = 'block'
    }
    function Hide() {
        Userdiv.style.display = 'none'
    }
</script>
</html>
