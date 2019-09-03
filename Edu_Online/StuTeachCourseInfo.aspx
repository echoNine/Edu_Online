<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StuTeachCourseInfo.aspx.cs" Inherits="Edu_Online.StuTeachCourseInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>教师—课程</title>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            background-color: #f3f3f3;
        }

        .header {
            background: url(../img/temp.png) no-repeat center top #000;
            background-size: cover;
            height: 148px;
            margin-bottom: 2%;
        }

        .Pic {
            width: 140px;
            height: 140px;
            border-radius: 50%;
            border: 5px solid #f5f5f5;
            margin-left: 12%;
            margin-top: 2%;
            float: left;
        }

        .Name {
            font-weight: 600;
            font-size: 24px;
            color: #fff;
            line-height: 28px;
            float: left;
            margin-left: 3%;
            margin-top: 5%;
        }

        .City {
            display: inline-block;
            margin-right: 10px;
            font-size: 14px;
            color: #fff;
            line-height: 20px;
            float: left;
            margin-top: 8%;
            margin-left: -5%;
        }

        .Type {
            display: inline-block;
            margin-right: 10px;
            font-size: 14px;
            color: #fff;
            line-height: 20px;
            float: left;
            margin-top: 8%;
            margin-left: -1%;
        }

        .content {
            width: 100%;
            margin-bottom: 3%;
        }

        .DataItem {
            width: 90%;
            background-color: white;
            box-shadow: 3px 5px #e5e5e5;
            border-radius: 8px;
            padding: 20px 30px 35px 25px;
            margin-top: 3%;
            margin-left: -10%;
            border: 3px solid #e5e5e5;
        }

        .picItem {
            width: 45px;
            float: left;
            margin: 0 15px;
        }

        .teacherItem {
            font-weight: 700;
            font-size: 15px;
            color: #353535;
            padding-top: 12px;
            float: left;
        }

        .coverItem {
            width: 26%;
            margin-right: 3%;
            margin-top: 1%;
            float: left;
        }

        .courseNameItem {
            float: left;
            font-size: 15px;
            color: #1c1f21;
            line-height: 10px;
            margin-bottom: 4px;
            font-weight: 700;
            text-decoration: none;
        }

            .courseNameItem:hover {
                color: #1e72c2;
            }

        .openDateItem {
            float: left;
            font-size: 13px;
            color: #797979;
            line-height: 10px;
            margin-bottom: 4px;
            margin-left: 3%;
        }

        .introItem {
            max-height: 40px;
            font-size: 14px;
            color: #545c63;
            line-height: 25px;
        }

        .return {
            width: 30px;
            position: absolute;
            top: 25%;
            right: 12%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header" runat="server" class="header">
            <asp:Image ID="Pic" runat="server" CssClass="Pic" />
            <asp:Label ID="Name" runat="server" CssClass="Name" />
            <asp:Label ID="City" runat="server" CssClass="City" />
            <asp:Label ID="Type" runat="server" CssClass="Type" />
        </div>
        <asp:ImageButton ID="return" runat="server" ImageUrl="~/img/return1.png" CssClass="return" OnClick="return_Click" />

        <div id="content" runat="server" class="content">
            <asp:DataList ID="CourseData" runat="server">
                <ItemTemplate>
                    <asp:Panel ID="DataItem" runat="server" CssClass="DataItem">
                        <asp:Image ImageUrl='<%# Eval("TeachPic") %>' runat="server" ID="picItem" CssClass="picItem" />
                        <asp:Label Text='<%# Eval("teacher") %>' runat="server" ID="teacherItem" CssClass="teacherItem" /><br />
                        <br />
                        <asp:Image ImageUrl='<%# Eval("cover") %>' runat="server" ID="coverItem" CssClass="coverItem" /><br />
                        <asp:HyperLink Text='<%# Eval("courseName") %>' runat="server" ID="courseNameItem" CssClass="courseNameItem" NavigateUrl='<%#"~/StuCourseIntro.aspx?id="+Eval("courseId") %>' />
                        <asp:Label Text='<%# Eval("openDate") %>' runat="server" ID="openDateItem" CssClass="openDateItem" /><br />
                        <asp:Label Text='<%# Eval("intro") %>' runat="server" ID="introItem" CssClass="introItem" /><br />
                    </asp:Panel>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </form>
</body>
</html>
