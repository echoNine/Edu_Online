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
        }

            .linkBtn:hover .linkTitle {
                color: black;
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
            width: 100%;
            margin-left: 10%;
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

        .continue {
            float: right;
            margin-top: 8%;
            margin-right: 24%;
            color: white;
            padding: 10px 15px;
            background-color: #299bff;
            text-decoration: none;
            border-radius: 20px;
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
                <asp:LinkButton ID="myCourse" runat="server" CssClass="linkBtn">
                    <asp:Image ID="courseImg" runat="server" ImageUrl="~/img/course.png" CssClass="linkImg" />
                    <asp:Label ID="courseTitle" runat="server" Text="我的课程" CssClass="linkTitle" />
                </asp:LinkButton><br />
                <asp:LinkButton ID="myQues" runat="server" CssClass="linkBtn">
                    <asp:Image ID="quesImg" runat="server" ImageUrl="~/img/question.png" CssClass="linkImg" />
                    <asp:Label ID="quesTitle" runat="server" Text="我的提问" CssClass="linkTitle" />
                </asp:LinkButton><br />
                <asp:LinkButton ID="myWork" runat="server" CssClass="linkBtn">
                    <asp:Image ID="workImg" runat="server" ImageUrl="~/img/work.png" CssClass="linkImg" />
                    <asp:Label ID="workTitle" runat="server" Text="作业情况" CssClass="linkTitle" />
                </asp:LinkButton><br />
                <asp:LinkButton ID="mySetting" runat="server" CssClass="linkBtn">
                    <asp:Image ID="settingImg" runat="server" ImageUrl="~/img/setting.png" CssClass="linkImg" />
                    <asp:Label ID="settingTitle" runat="server" Text="个人信息" CssClass="linkTitle" />
                </asp:LinkButton>
            </div>
        </div>

        <div id="Right" runat="server" class="Right">
            <asp:DataList ID="InfoDataList" runat="server" DataKeyField="courseId">
                <ItemTemplate>
                    <div id="courseItem" runat="server" class="courseItem">
                        <asp:Image ImageUrl='<%# Eval("cover") %>' runat="server" ID="cover" CssClass="cover" />
                        <asp:Label Text='<%# Eval("courseName") %>' runat="server" ID="courseName" CssClass="courseName" /><br />
                        <asp:HyperLink ID="continue" runat="server" Text="继续学习" NavigateUrl='<%#"~/StuCourseDetails.aspx?courseId="+Eval("courseId") %>' CssClass="continue" />
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </form>
</body>
</html>
