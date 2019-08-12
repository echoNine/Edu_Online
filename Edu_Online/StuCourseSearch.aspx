<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StuCourseSearch.aspx.cs" Inherits="Edu_Online.StuCourseSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>查询课程</title>
    <style type="text/css">
        body {
            padding: 0;
            margin: 0;
        }

        .tagsBox {
            width: 100%;
            margin: 2% auto 5px;
            line-height: 1.5;
            color: #333;
            font-family: 'Microsoft Yahei';
            box-shadow: 0 4px 8px 0 rgba(28,31,33,.1);
            border-radius: 5px;
        }

        .classifyBox {
            padding: 10px 20px 0px 70px;
            border-bottom: 2px solid #edf1f2;
        }


        .classifyTitle {
            width: 3%;
            float: left;
            font-size: 16px;
            color: #07111b;
            font-weight: bold;
        }

        .classifyContent, .hardLevel {
            float: left;
            margin-left: 4%;
        }

            .classifyContent a {
                font-size: 16px;
                text-decoration: none;
                padding: 10px 20px;
                border-radius: 10px;
                margin-right: 20px;
            }

        .init {
            color: black;
        }

        a:hover {
            color: #0094ff;
            background-color: #e9f3ff;
        }

        .actived {
            color: #0094ff;
            background-color: #e9f3ff;
        }

        .hardBox {
            padding: 0px 20px 24px 70px;
            border-bottom: 2px solid #edf1f2;
        }

        .hardTitle {
            width: 3%;
            float: left;
            font-size: 16px;
            color: #07111b;
            font-weight: bold;
            padding-top: 24px;
        }

        .courseMain {
            width: 98.5%;
            background-color: #f7f7f7;
            padding-bottom: 40px;
            padding-left: 20px;
        }

        .courseItem {
            padding: 35px 15px 0px 35px;
        }

        .cover {
            width: 270px;
            height: 150px;
        }

        .courseName {
            line-height: 35px;
            font-size: 18px;
            padding-left: 4px;
            color: #3c3636;
        }

        .courseLevel {
            float: right;
            margin-right: 4px;
            font-size: 14px;
            padding-top: 8px;
            color: #5f5858;
        }

        .openDate {
            color: #5f5858;
            font-size: 14px;
            padding-left: 4px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="tagsBox" runat="server" class="tagsBox">
            <div id="classifyBox" runat="server" class="classifyBox" style="height: 110px">
                <div id="classifyTitle" runat="server" class="classifyTitle">分类</div>
                <div id="classifyContent" runat="server" class="classifyContent">
                    <asp:DataList ID="classifyInfo" runat="server" DataKeyField="courseId" RepeatDirection="Horizontal" RepeatColumns="5">
                        <ItemTemplate>
                            <a href="StuCourseSearch.aspx?classifyItem=<%# Eval("courseTypeName") %>" class="init"><%# Eval("courseTypeName") %></a>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>

            <div id="hardBox" runat="server" class="hardBox" style="height: 45px">
                <div id="hardTitle" runat="server" class="hardTitle">难度</div>
                <asp:RadioButtonList ID="hardLevel" runat="server" onchange="radioChange(event)" RepeatDirection="Horizontal" CssClass="hardLevel" CellPadding="24">
                    <asp:ListItem Text="全部" />
                    <asp:ListItem Text="入门" Value="入门" />
                    <asp:ListItem Text="初级" Value="初级" />
                    <asp:ListItem Text="中级" Value="中级" />
                    <asp:ListItem Text="高级" Value="高级" />
                </asp:RadioButtonList>
            </div>
        </div>
        <div id="courseMain" runat="server" class="courseMain">
            <asp:DataList ID="CourseDataList" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <a href="StuCourseIntro.aspx?id=<%# DataBinder.Eval(Container.DataItem,"courseId") %>" style="text-decoration: none;">
                        <div id="courseItem" runat="server" class="courseItem">
                            <asp:Image ImageUrl='<%# Eval("cover") %>' runat="server" ID="cover" CssClass="cover" /><br />
                            <asp:Label Text='<%# Eval("courseName") %>' runat="server" ID="courseName" CssClass="courseName" />
                            <asp:Label Text='<%# Eval("courseLevel") %>' runat="server" ID="courseLevel" CssClass="courseLevel" /><br />
                            <asp:Label Text='<%# Eval("openDate") %>' runat="server" ID="openDate" CssClass="openDate" />
                        </div>
                    </a>
                </ItemTemplate>
            </asp:DataList>
        </div>

    </form>
</body>
<script>
    function selectDefault() {
        let selected = GetUrlParam('hardLevel');
        if (!selected) {
            selected = '全部';
        }
        var selects = document.getElementsByName("hardLevel");
        for (var i = 0; i < selects.length; i++) {
            if (selects[i].value == selected) {
                selects[i].checked = true;
                break;
            }
        }
    }

    function activeDefault() {
        var tbody = document.getElementById('classifyInfo').children[0];
        var td = document.createElement('td');
        td.innerHTML = '<a href="StuCourseSearch.aspx" class="init">全部</a>';
        var tr = tbody.children[0];
        tr.insertBefore(td, tr.firstChild)

        let actived = GetUrlParam('classifyItem');
        console.log(actived);
        if (!actived) {
            actived = '全部';
        }

        for (var i = 0; i < tr.children.length; i++) {
            if (tr.children[i].children[0].innerText == actived) {
                tr.children[i].children[0].className = "";
                tr.children[i].children[0].className = "actived";
                break;
            }
        }
    }
    selectDefault();
    activeDefault();

    function GetUrlParam(paraName) {
        var url = document.location.toString();
        var arrObj = url.split("?");

        if (arrObj.length > 1) {
            var arrPara = arrObj[1].split("&");
            var arr;

            for (var i = 0; i < arrPara.length; i++) {
                arr = arrPara[i].split("=");

                if (arr != null && arr[0] == paraName) {
                    return decodeURI(arr[1]);
                }
            }
            return "";
        }
        else {
            return "";
        }
    }

    function radioChange(event) {
        let base = 'StuCourseSearch.aspx';
        let classifyItem = GetUrlParam('classifyItem');
        if (classifyItem) {
            base = base + '?classifyItem=' + classifyItem;
            base = base + '&hardLevel=' + event.target.defaultValue;
        } else {
            if (event.target.defaultValue && event.target.defaultValue != '全部') {
                base = base + '?hardLevel=' + event.target.defaultValue;
            }
        }

        window.location.href = base;
    }
</script>
</html>
