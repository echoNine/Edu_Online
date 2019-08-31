<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SrcManage.aspx.cs" Inherits="Edu_Online.SrcManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>资料管理</title>
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

        .item {
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

            .item a, .itemInit a {
                text-decoration: none;
                color: #808080;
            }

            .itemInit li {
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

            .item:hover, .itemInit:hover, .item:hover a {
                background-color: #6699FF;
                color: white;
            }

                .itemInit:hover ul li:hover {
                    background-color: #6699FF;
                }

                    .itemInit:hover ul li:hover a {
                        color: white;
                    }

                .itemInit:hover ul li {
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

        .upfile {
            background-color: #f7f7f7;
            position: absolute;
            top: 23%;
            left: 21.4%;
            padding: 4% 6%;
            height: 65%;
            width: 66.1%;
            font-size: 18px;
        }

        .titlelabel {
            font-size: 16px;
            font-weight: bold;
            color: #4a4a4a;
            margin-right: 15px;
        }

        .fileName, .Remark {
            color: #525252;
            height: 22px;
            width: 24%;
            padding-left: 10px;
            font-size: 14px;
        }

        .filePath, .fileCourse, .fileVideo {
            height: 30px;
            color: #525252;
            width: 26%;
            padding-left: 10px;
            font-size: 14px;
        }

        .save {
            padding: 9px 20px;
            font-size: 15px;
            color: white;
            background-color: #60baf1;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            box-shadow: 2px 3px 2px #e0e0e0;
            float: right;
            margin-right: 7%;
        }

            .save:hover {
                background-color: #286090;
                border-color: #204d74;
            }

        .main {
            background-color: white;
            padding: 7% 9%;
            box-shadow: 2px 3px #c3c3c3;
            border: 2px solid #9c9c9c;
            border-radius: 12px;
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
                <li class="itemInit">课程管理<ul>
                    <li style="bottom: 31%"><a href="InfoManage.aspx">新设课程</a></li>
                    <li style="bottom: 24.5%"><a href="VideoManage.aspx">视频管理</a></li>
                    <li style="bottom: 18%"><a href="SrcManage.aspx">资料管理</a></li>
                </ul>
                </li>
                <li class="item"><a href="PushPractice.aspx">作业管理</a></li>
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

        <div class="upfile" runat="server" id="upfile">
            <div class="main">
                <asp:Label ID="nametitle" runat="server" Text="文件名称" CssClass="titlelabel" />
                <asp:TextBox ID="filename" runat="server" CssClass="fileName" Style="margin-right: 17%" />
                <asp:Label ID="pathtitle" runat="server" Text="文件资源" CssClass="titlelabel" />
                <asp:FileUpload ID="filepath" runat="server" CssClass="filePath" /><br />
                <br />
                <asp:Label ID="coursetitle" runat="server" Text="所属课程" CssClass="titlelabel" />
                <asp:DropDownList ID="filecourse" runat="server" CssClass="fileCourse" AutoPostBack="True" OnSelectedIndexChanged="filecourse_SelectedIndexChanged" Style="margin-right: 17%">
                </asp:DropDownList>
                <asp:Label ID="videotitle" runat="server" Text="对应章节" CssClass="titlelabel" />
                <asp:DropDownList ID="filevideo" runat="server" CssClass="fileVideo">
                </asp:DropDownList><br />
                <br />
                <asp:Label ID="remarktitle" runat="server" Text="备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注" CssClass="titlelabel" />
                <asp:TextBox ID="remark" runat="server" CssClass="Remark" Style="margin-right: 17%" /><br />
                <br />
                <asp:Button ID="filesave" runat="server" Text="上传" OnClick="filesave_Click" CssClass="save" />
            </div>
        </div>
    </form>
</body>
</html>