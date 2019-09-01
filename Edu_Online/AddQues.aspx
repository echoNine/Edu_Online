<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddQues.aspx.cs" Inherits="Edu_Online.AddQues" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>新增练习信息</title>
    <link rel="stylesheet" href="modal.css" />
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .tdstyle {
            padding: 10px;
            font-size: 15px;
            color: #464646;
            text-align: center;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
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
            <div class="firststep" id="firststep">
                <span class="spanMain">填充练习信息</span><br />
                <span class="spantitle">练习名称</span>
                <asp:TextBox ID="PracticeName" runat="server" CssClass="txtName"></asp:TextBox><br />
                <span class="spantitle">练习难度</span>
                <asp:RadioButtonList ID="HardLevel" runat="server" RepeatDirection="Horizontal" CssClass="radioHard" CellPadding="6">
                    <asp:ListItem Text="易" />
                    <asp:ListItem Text="偏易" />
                    <asp:ListItem Text="适中" />
                    <asp:ListItem Text="偏难" />
                    <asp:ListItem Text="难" />
                </asp:RadioButtonList><br />
                <span class="spantitle">所属课程</span>
                <asp:DropDownList ID="CourseName" runat="server" OnSelectedIndexChanged="CourseName_SelectedIndexChanged" CssClass="dropCourse" AutoPostBack="true"></asp:DropDownList><br />
                <span class="spantitle">对应章节</span>
                <asp:DropDownList ID="VideoName" runat="server" CssClass="dropVideo"></asp:DropDownList>
                <input id="next" type="button" value="下一步" onclick="Next()" class="next" />
            </div>
            <div class="laststep" id="laststep">
                <span class="spanMain">试题清单 ></span>
                <table style="width: 916px; table-layout: fixed;">
                    <thead>
                        <tr style="background-color: #60baf1; color: white">
                            <th>题目名称</th>
                            <th>题目类型</th>
                            <th>题目信息</th>
                            <th>题目答案</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody id="tbody">
                    </tbody>
                </table>
                <button type="button" class="pushQues" onclick="pushQues()">提交</button>
            </div>
        </div>
    </form>
    <div>
        <button class="btn btn-lg" data-toggle="modal" data-target="#myModal" id="new">新增题目</button>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            x
                        </button>
                        <h4 class="modal-title" id="myModalLabel">新增题目</h4>
                    </div>
                    <div class="modal-body">
                        <div class="modal-list">
                            <span>题目</span><input id="testContent" type="text" class="testContent" /><br />
                            <span>题型</span><select id="testType" onchange="changetype()" class="testType">
                                <option value="single">单选题</option>
                                <option value="judge">判断题</option>
                            </select><br />
                            <div id="SingleAnswer" class="SingleAnswer">
                                <input id="A" type="text" placeholder="选项1" class="choice" /><input id="RadioBtnA" type="radio" name="Right" value="A" /><span>正确项</span><br />
                                <input id="B" type="text" placeholder="选项2" class="choice" /><input id="RadioBtnB" type="radio" name="Right" value="B" /><span>正确项</span><br />
                                <input id="C" type="text" placeholder="选项3" class="choice" /><input id="RadioBtnC" type="radio" name="Right" value="C" /><span>正确项</span><br />
                                <input id="D" type="text" placeholder="选项4" class="choice" /><input id="RadioBtnD" type="radio" name="Right" value="D" /><span>正确项</span><br />
                            </div>
                            <select id="JudgeAnswer" style="display: none" class="JudgeAnswer">
                                <option>正确</option>
                                <option>错误</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" onclick="cleanModal()" data-dismiss="modal">
                            关闭
                        </button>
                        <button type="button" class="btn btn-primary" onclick="add()">
                            保存
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    Init();
    function Init() {
        document.getElementById("firststep").style["display"] = "block";
        document.getElementById("laststep").style["display"] = "none";
        document.getElementById("new").style["display"] = "none";
    }
    function Next() {
        document.getElementById("firststep").style["display"] = "none";
        document.getElementById("laststep").style["display"] = "block";
        document.getElementById("new").style["display"] = "block";
    }

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
            $("#tbody").append("<tr><td class='tdstyle'>" + name + "</td><td class='tdstyle'>" + (type == "single" ? "单选题" : "判断题") + "</td><td class='tdstyle'>" + info + "</td><td class='tdstyle'>" + correct + "</td><td class='tdstyle'><span>编辑</span>&nbsp;&nbsp;&nbsp;<span>删除</span></td></tr>");
            let targetInfo = { "name": name, "type": type, "options": options, "correct": correct };
            list.push(targetInfo);
            let currentTr = $("#tbody").children()[$("#tbody").children().length - 1];
            let opreator = $(currentTr).children()[4];
            let currentIndex = list.length - 1;
            $(opreator).children()[1].onclick = function () {
                currentTr.remove();
                list.splice(currentIndex, 1);
            }

            $(opreator).children()[0].onclick = function () {
                $("#myModal").modal('show');
                $("#testContent").val(targetInfo.name);
                if (type == "single") {
                    $("#testType").val(type);
                    $("#SingleAnswer").show();
                    $("#JudgeAnswer").hide();
                    let optionItems = targetInfo.options.split(';');
                    $("#A").val(optionItems[0]);
                    $("#B").val(optionItems[1]);
                    $("#C").val(optionItems[2]);
                    $("#D").val(optionItems[3]);
                    $("#RadioBtn" + targetInfo.correct)[0].checked = "checked";

                } else {
                    $("#testType").val(type);
                    $("#JudgeAnswer").show();
                    $("#SingleAnswer").hide();
                    $("#JudgeAnswer").val(targetInfo.correct)
                }
            }
        }
        cleanModal();
    }

    function cleanModal () {
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

    function pushQues() {
        if (list.length > 0) {
            var opt = {
                list: list,
                PracticeName: $("#PracticeName").val(),
                hard: $('#HardLevel').find("input[type='radio']:checked").val(),
                course: $("#CourseName").val(),
                video: $("#VideoName").val(),
            };
            $.ajax({
                type: "post",
                url: "NewPracticeInfo.aspx/CreatePracticeInfo",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(opt),
                success: function (result) {
                    alert("作业发布成功");
                    window.location.href = "PushPractice.aspx";
                },
                error: function (result) {
                    alert("作业发布失败")
                }
            });
        }
    }

    function del(event) {
        console.log(event);
        event.path[2].remove();
    }

    function edit(event) {
        console.log(event);
    }
</script>
</html>
