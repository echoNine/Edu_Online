<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllCourses.aspx.cs" Inherits="Edu_Online.AllCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>全部开设课程</title>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/allcourses.css"/>
</head>
<body>
<div class="menu">
    <div>
        <img id="person" class="person" src="img/user.png"/>
        <span id="user" class="user"></span><br/>
    </div>
    <ul class="nav">
        <li class="itemInit">
            <a href="AllCourses.aspx">全部课程</a>
        </li>
        <li class="item">
            <a href="OpenedCourses.aspx">已开课程</a>
        </li>
        <li class="item4">
            课程管理
            <ul class="item4Ul">
                <li style="bottom: 31%">
                    <a href="InfoManage.aspx">新设课程</a>
                </li>
                <li style="bottom: 24.5%">
                    <a href="VideoManage.aspx">视频管理</a>
                </li>
                <li style="bottom: 18%">
                    <a href="SrcManage.aspx">资料管理</a>
                </li>
            </ul>
        </li>
        <li class="item">
            <a href="PushPractice.aspx">作业管理</a>
        </li>
        <li class="item">
            <a href="AddUserInfo.aspx">个人中心</a>
        </li>
    </ul>
</div>
<div class="right">
    <div class="header">
        <div class="tip">
            <span id="wel" class="wel">欢迎登录</span>
            <img id="img" class="img" src="img/user.png"/><br/>
            <input id="quit" type="button" class="quit" onclick="quit()" value="退出"/>
        </div>
    </div>

    <div id="allcourse" class="allcourse">
        <table id="info" style="border-collapse: collapse;">
            <tbody id="tbody">
            </tbody>
        </table>
    </div>
</div>
</body>
<script>
    function arraySplit(data, eachLenght) {
        var result = [];
        for (var i = 0, len = data.length; i < len; i += eachLenght) {
            result.push(data.slice(i, i + eachLenght));
        }
        return result;
    }
    $(document).ready(function () {
        $.ajax({
            type: "post",
            url: "AllCourses.aspx/GetAllCourses",
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify({}),
            success: function (result) {
                var list = result.d;
                var contentHeight = $("#allcourse").width();
                var lineCount = Math.floor(contentHeight / 327);
                var trList = arraySplit(list, lineCount);
                trList.forEach(function (eachTr) {
                    //首构造每一个tr
                    let trHtml = "<tr>";
                    eachTr.forEach(function (eachTd) {
                        //then 造每一个td
                        trHtml += `<td>
                            <a class="link" href="CourseIntro.aspx?name='${eachTd.CourseName}'" style="text-decoration: none;">
                                <img class="cover" src="${eachTd.cover}"><br>
                                <span class="name">${eachTd.CourseName}</span>
                            </a>
                        </td>`;
                    })
                    trHtml += "</tr>";
                    $("#tbody").append(trHtml);
                });
            },
            error: function (result) {
                alert("系统繁忙")
            }
        });

        $.ajax({
            type: "post",
            url: "AllCourses.aspx/GetBaseInfo",
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify({}),
            success: function (result) {
                let info = result.d;
                $("#person")[0].src = info.TeachPic.replace("~", "");
                $("#user").html(info.TeachName)
                },
            error: function (result) {
                alert("系统繁忙")
            }
        });
    })
</script>
</html>