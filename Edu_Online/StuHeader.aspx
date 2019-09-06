<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StuHeader.aspx.cs" Inherits="Edu_Online.StuHeader" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>欢迎页面</title>
    <style type="text/css">
        body {
            background-color: #60baf1;
            margin: 0px;
            padding: 0px;
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

        hr {
            width: 97%;
            background-color: #868686;
        }

        .menu {
            width: 12%;
            height: 62.5%;
            background-color: #616161;
            position: absolute;
            top: 16.1%;
            left: 11%;
            border-radius: 5px 0 0 5px;
            padding: 1.5% 3%;
        }

        #Menu1 a {
            text-decoration: none;
            color: white;
            padding: 12%;
        }

            #Menu1 a:hover {
                color: #60baf1;
            }

        .commandCourse {
            background-color: #f7f7f7;
            width: 100%;
            height: 530px;
            margin: auto;
        }

        .inner {
            width: 835px;
            position: relative;
            overflow: hidden;
            margin-left: 29%;
            height: 100%;
        }

            .inner img {
                width: 835px;
                height: 450px;
                border-radius: 0 5px 5px 0;
            }

        ul {
            width: 1000%;
            position: absolute;
            list-style: none;
            top: 6%;
        }

        .inner li {
            float: left;
        }

        ol {
            position: absolute;
            height: 20px;
            right: 20px;
            bottom: 50px;
            text-align: center;
            padding: 5px;
        }

            ol li {
                display: inline-block;
                width: 20px;
                height: 20px;
                line-height: 20px;
                background-color: #fff;
                margin: 5px;
                cursor: pointer;
            }

            ol .current {
                background-color: #60baf1;
                color: white;
            }

        #arr {
            display: none;
        }

            #arr span {
                width: 40px;
                height: 40px;
                position: absolute;
                left: 5px;
                top: 50%;
                margin-top: -20px;
                background: #fff;
                cursor: pointer;
                line-height: 40px;
                text-align: center;
                font-weight: bold;
                font-family: '黑体';
                font-size: 30px;
                color: #000;
                opacity: 0.5;
                border: 1px solid #fff;
            }

            #arr #right {
                right: 5px;
                left: auto;
            }

        .newestCourse {
            background-color: white;
            width: 100%;
            border-top: 4px solid #e8e7e7;
        }

        .NewCourseTitle, .NiceTeacherTitle {
            font-size: 22px;
            width: 7%;
            margin: 0% auto 2%;
            font-weight: bold;
            padding-top: 28px;
            color: #545050;
        }

        .NewCourseItems {
            margin: 0 4.5%;
        }

        .linkcourse {
            cursor: pointer;
            margin-bottom: 10%;
            margin-left: 18px;
            margin-right: 18px;
            background-color: #fdfcfc;
            padding-bottom: 2%;
            border-radius: 0 0 5px 5px;
        }

        .cover {
            width: 270px;
            height: 160px;
            border-radius: 5px 5px 0 0;
        }

        .courseName {
            font-size: 16px;
            color: #646469;
            line-height: 40px;
            font-weight: bold;
            margin-left: 3%;
        }

        .openDate {
            font-size: 14px;
            color: #8c8585;
            margin-left: 3%;
        }

        .courseLevel {
            font-size: 13px;
            color: #75b5d4;
            margin-left: 56%;
        }

        .niceTeacher {
            background-color: #f7f7f7;
            width: 100%;
            border-top: 4px solid #e8e7e7;
        }

        .linkteacher {
            width: 255px;
            height: 360px;
            background-color: white;
            border-radius: 12px;
            padding: 10%;
            margin-bottom: 12%;
            margin-right: 160px;
            box-shadow: 1px 4px 8px 0 rgba(7,17,27,.1);
        }

        .NiceTeacherItems {
            margin: 0 6%;
        }

        .pic {
            padding: 0% 11% 5%;
            width: 200px;
            height: 200px;
        }

        .teachName {
            font-size: 20px;
            line-height: 30px;
            color: #6c6c88;
            font-weight: bold;
        }

        .major {
            line-height: 40px;
            color: #545454;
        }

        .intro {
            font-size: 14px;
            color: #484848;
            text-align: justify;
            height: 80px;
            display: inline-block;
            overflow-y: auto;
        }

            .intro::-webkit-scrollbar {
                display: none;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header" runat="server" class="header">
            <asp:Panel ID="PageLink" runat="server" CssClass="PageLink">
                <asp:HyperLink ID="indexPage" runat="server" Text="首页" CssClass="LinkTitle" ForeColor="#60baf1" NavigateUrl="~/StuHeader.aspx" />
                <asp:HyperLink ID="coursePage" runat="server" Text="课程" CssClass="LinkTitle" NavigateUrl="~/StuCourseSearch.aspx" />
                <asp:HyperLink ID="teacherPage" runat="server" Text="师资" CssClass="LinkTitle" NavigateUrl="~/StuTeacherIntro.aspx" />
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

        <div id="menu" runat="server" class="menu">
            <asp:Menu ID="Menu1" runat="server">
                <Items>
                    <asp:MenuItem Text="JavaScript" Value="JavaScript" NavigateUrl="~/StuCourseSearch.aspx?classifyItem=JavaScript"></asp:MenuItem>
                    <asp:MenuItem Text="C语言" Value="C语言" NavigateUrl="~/StuCourseSearch.aspx?classifyItem=C"></asp:MenuItem>
                    <asp:MenuItem Text="数据库" Value="数据库" NavigateUrl="~/StuCourseSearch.aspx?classifyItem=数据库"></asp:MenuItem>
                    <asp:MenuItem Text=".Net" Value=".Net" NavigateUrl="~/StuCourseSearch.aspx?classifyItem=.Net"></asp:MenuItem>
                    <asp:MenuItem Text="安卓" Value="安卓" NavigateUrl="~/StuCourseSearch.aspx?classifyItem=Android"></asp:MenuItem>
                    <asp:MenuItem Text="HTML5" Value="HTML5" NavigateUrl="~/StuCourseSearch.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="JSP" Value="JSP" NavigateUrl="~/StuCourseSearch.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Linux" Value="Linux" NavigateUrl="~/StuCourseSearch.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Python" Value="Python" NavigateUrl="~/StuCourseSearch.aspx"></asp:MenuItem>
                </Items>
            </asp:Menu>
        </div>
        <div id="commandCourse" runat="server" class="commandCourse">
            <div class="inner">
                <ul style="margin: 0; padding: 0; left: 0px;">
                    <li><a href="StuCourseIntro.aspx?id=1001">
                        <img src="upload/image/Java_1.png" alt="" /></a></li>
                    <li><a href="StuCourseIntro.aspx?id=1002">
                        <img src="upload/image/C_1.png" alt="" /></a></li>
                    <li><a href="StuCourseIntro.aspx?id=1003">
                        <img src="upload/image/DB_1.png" alt="" /></a></li>
                    <li><a href="StuCourseIntro.aspx?id=1004">
                        <img src="upload/image/Android_1.png" alt="" /></a></li>
                    <li><a href="StuCourseIntro.aspx?id=1005">
                        <img src="upload/image/Net_1.png" alt="" /></a></li>
                </ul>

                <ol class="bar">
                </ol>
                <div id="arr">
                    <span id="left"><
                    </span>
                    <span id="right">>
                    </span>
                </div>
            </div>
        </div>

        <div id="newestCourse" runat="server" class="newestCourse">
            <div id="NewCourseTitle" runat="server" class="NewCourseTitle">最新课程</div>
            <div id="NewCourseItems" runat="server" class="NewCourseItems">
                <asp:DataList ID="NewCourseData" runat="server" DataKeyFiled="courseId" DataSourceID="NewCourseSource" RepeatColumns="4" AutoPostBack="true">
                    <ItemTemplate>
                        <a href="StuCourseIntro.aspx?id=<%# DataBinder.Eval(Container.DataItem,"courseId") %>" style="text-decoration: none;">
                            <div id="linkcourse" runat="server" class="linkcourse">
                                <asp:Image ID="cover" runat="server" ImageUrl='<%# Eval("cover") %>' CssClass="cover" /><br />
                                <asp:Label ID="courseName" Text='<%# Eval("courseName") %>' runat="server" CssClass="courseName" /><br />
                                <asp:Label ID="openDate" runat="server" Text='<%# Eval("openDate") %>' CssClass="openDate"></asp:Label>
                                <asp:Label ID="courseLevel" runat="server" Text='<%# Eval("courseLevel") %>' CssClass="courseLevel"></asp:Label>
                            </div>
                        </a>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <asp:SqlDataSource ID="NewCourseSource" runat="server" ConnectionString='<%$ ConnectionStrings:EduString %>' SelectCommand="SELECT * FROM [CourseInfo] ORDER BY [openDate] DESC"></asp:SqlDataSource>
        </div>

        <div id="niceTeacher" runat="server" class="niceTeacher">
            <div id="NiceTeacherTitle" runat="server" class="NiceTeacherTitle">优秀教师</div>
            <div id="NiceTeacherItems" runat="server" class="NiceTeacherItems">
                <asp:DataList ID="NiceTeacherData" runat="server" DataKeyFiled="TeachId" DataSourceID="NiceTeacherSource" RepeatColumns="3" AutoPostBack="true">
                    <ItemTemplate>
                        <div id="linkteacher" runat="server" class="linkteacher">
                            <asp:Image ID="pic" runat="server" ImageUrl='<%# Eval("TeachPic") %>' CssClass="pic" /><br />
                            <asp:Label ID="teachName" Text='<%# Eval("TeachName") %>' runat="server" CssClass="teachName" /><br />
                            <asp:Label ID="major" runat="server" Text='<%# "教学方向：" + Eval("TeachMajor") %>' CssClass="major"></asp:Label><br />
                            <asp:Label ID="intro" runat="server" Text='<%# Eval("intro") %>' CssClass="intro"></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <asp:SqlDataSource ID="NiceTeacherSource" runat="server" ConnectionString='<%$ ConnectionStrings:EduString %>' SelectCommand="SELECT top 6 * FROM [TeacherInfo]"></asp:SqlDataSource>
        </div>
    </form>
</body>
<script>
    function my$(id) {
        return document.getElementById(id);
    }

    var commandCourse = my$("commandCourse");
    var inner = commandCourse.children[0];
    var ulObj = inner.children[0];
    var list = ulObj.children;
    var olObj = inner.children[1];
    var arr = my$("arr");
    var imgWidth = inner.offsetWidth;
    var right = my$("right");
    var pic = 0;
    for (var i = 0; i < list.length; i++) {
        var liObj = document.createElement("li");

        olObj.appendChild(liObj);
        liObj.innerText = (i + 1);
        liObj.setAttribute("index", i);

        liObj.onmouseover = function () {
            for (var j = 0; j < olObj.children.length; j++) {
                olObj.children[j].removeAttribute("class");
            }
            this.className = "current";
            pic = this.getAttribute("index");
            animate(ulObj, -pic * imgWidth);
        }

    }
    olObj.children[0].className = "current";
    ulObj.appendChild(ulObj.children[0].cloneNode(true));

    var timeId = setInterval(onmouseclickHandle, 1800);
    commandCourse.onmouseover = function () {
        arr.style.display = "block";
        clearInterval(timeId);
    };
    commandCourse.onmouseout = function () {
        arr.style.display = "none";
        timeId = setInterval(onmouseclickHandle, 1800);
    };

    right.onclick = onmouseclickHandle;
    function onmouseclickHandle() {
        if (pic == list.length - 1) {
            pic = 0;
            ulObj.style.left = 0 + "px";
        }
        pic++;
        animate(ulObj, -pic * imgWidth);
        if (pic == list.length - 1) {
            olObj.children[olObj.children.length - 1].className = "";
            olObj.children[0].className = "current";
        } else {
            for (var i = 0; i < olObj.children.length; i++) {
                olObj.children[i].removeAttribute("class");
            }
            olObj.children[pic].className = "current";
        }
    }
    left.onclick = function () {
        if (pic == 0) {
            pic = list.length - 1;
            ulObj.style.left = -pic * imgWidth + "px";
        }
        pic--;
        animate(ulObj, -pic * imgWidth);
        for (var i = 0; i < olObj.children.length; i++) {
            olObj.children[i].removeAttribute("class");
        }
        olObj.children[pic].className = "current";
    };

    function animate(element, target) {
        clearInterval(element.timeId);
        element.timeId = setInterval(function () {
            var current = element.offsetLeft;
            var step = 10;
            step = current < target ? step : -step;
            current += step;
            if (Math.abs(current - target) > Math.abs(step)) {
                element.style.left = current + "px";
            } else {
                clearInterval(element.timeId);
                element.style.left = target + "px";
            }
        }, 10);
    }

    var Userdiv = document.getElementById("UserSetting");
    function Show() {
        Userdiv.style.display = 'block'
    }
    function Hide() {
        Userdiv.style.display = 'none'
    }
</script>
</html>
