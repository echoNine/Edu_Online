<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewPracticeInfo.aspx.cs" Inherits="Edu_Online.NewPracticeInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>新增练习信息</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
                <li class="item"><a>个人中心</a></li>
            </ul>
        </div>

        <div class="header">
            <div class="tip">
                <asp:Label ID="wel" runat="server" Text="欢迎登录" CssClass="wel"></asp:Label>
                <asp:Image ID="img" runat="server" CssClass="img" /><br />
                <asp:Button ID="quit" runat="server" Text="退出" CssClass="quit" OnClick="quit_Click" />
            </div>
        </div>

        <div class="addques" id="addques">
            <input id="submit" type="button" value="提交" onclick="Submit()" />
            <asp:TextBox ID="PracticeName" runat="server"></asp:TextBox><br />
            <asp:RadioButtonList ID="HardLevel" runat="server">
                <asp:ListItem Text="易" />
                <asp:ListItem Text="偏易" />
                <asp:ListItem Text="适中" />
                <asp:ListItem Text="偏难" />
                <asp:ListItem Text="难" />
            </asp:RadioButtonList>
            <asp:DropDownList ID="CourseName" runat="server" OnSelectedIndexChanged="CourseName_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
            <asp:DropDownList ID="VideoName" runat="server"></asp:DropDownList>
            <table id="tbody">
                <thead>
                    <tr>
                        <th>题目名称</th>
                        <th>题目类型</th>
                        <th>题目信息</th>
                        <th>题目答案</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
                <tr id="list">
                </tr>
            </table>
            </div>
            <div>
                <!-- 按钮触发模态框 -->
                <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                    新增测试题
                </button>
                <!-- 模态框（Modal） -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel">新增题目</h4>
                            </div>
                            <div class="modal-body">
                                <div>
                                    题目<input id="testContent" type="text" /><br />
                                    题型<select id="testType" onchange="changetype()">
                                        <option value="single">单选题</option>
                                        <option value="judge">判断题</option>
                                    </select><br />
                                    <div id="SingleAnswer">
                                        <input id="A" type="text" placeholder="选项1" /><input id="RadioBtnA" type="radio" name="Right" value="A" />正确项<br />
                                        <input id="B" type="text" placeholder="选项2" /><input id="RadioBtnB" type="radio" name="Right" value="B" />正确项<br />
                                        <input id="C" type="text" placeholder="选项3" /><input id="RadioBtnC" type="radio" name="Right" value="C" />正确项<br />
                                        <input id="D" type="text" placeholder="选项4" /><input id="RadioBtnD" type="radio" name="Right" value="D" />正确项<br />
                                    </div>
                                    <select id="JudgeAnswer" style="display: none">
                                        <option>正确</option>
                                        <option>错误</option>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">
                                    关闭
                                </button>
                                <button type="button" class="btn btn-primary" onclick="add()">
                                    保存
                                </button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal -->
                </div>
            </div>
    </form>
</body>
<script>
    var list = [];

    function changetype() {
        var selectValue = $("#testType").val();
        if (selectValue == "single") {
            document.getElementById("SingleAnswer").style.display = "block";
            document.getElementById("JudgeAnswer").style.display = "none";
        } else {
            document.getElementById("SingleAnswer").style.display = "none";
            document.getElementById("JudgeAnswer").style.display = "block";
        }
    }

    function add() {
        var name = $("#testContent").val();
        var type = $("#testType").val();
        var info = "";
        var options = "";
        var correct = "";
        if (type == "single") {
            options = $("#A").val() + ";" + $("#B").val() + ";" + $("#C").val() + ";" + $("#D").val();
            info = info + "A: " + $("#A").val() + ";";
            info = info + "B: " + $("#B").val() + ";";
            info = info + "C: " + $("#C").val() + ";";
            info = info + "D: " + $("#D").val();
            correct = $('input[name="Right"]:checked').val();
            if (correct) correct = correct.replace("RadioBtn", "");
        } else {
            correct = $("#JudgeAnswer").val();
        }
        if (name && type && correct && (type != "single" || info)) {
            $("#tbody").append("<td>" + name + "</td><td>" + (type == "single" ? "单选题" : "判断题") + "</td><td>" + info + "</td><td>" + correct + "</td><td><span>编辑</span><span>删除</span></td>");
            list.push({ "name": name, "type": type, "options": options, "correct": correct });

        }
        $("#testContent").val("");
        $("#testType  option[value='0'] ").attr("selected", true);
        $("#A").val("");
        $("#B").val("");
        $("#C").val("");
        $("#D").val("");
        var x = document.getElementsByName("Right");
        for (var i = 0; i < x.length; i++) {
            if (x[i].checked == true) {
                x[i].checked = false;
            }
        }
        $("#JudgeAnswer  option[value='0'] ").attr("selected", true);
        $("#myModal").modal('hide');

    }

    function Submit() {
        if (list.length > 0) {
            var opt = {
                list: list,
                PracticeName: $("#PracticeName").val(),
                hard: $('#HardLevel').find("input[type='radio']:checked").val(),
                course: $("#CourseName").val(),
                video: $("#VideoName").val(),
            };

            console.log(opt)
            $.ajax({
                type: "post",
                url: "NewPracticeInfo.aspx/CreatePracticeInfo",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(opt),
                success: function (result) {
                    alert("作业发布成功")
                },
                error: function (result) {
                    alert("作业发布失败")
                }
            });
        }
    }
</script>
</html>
