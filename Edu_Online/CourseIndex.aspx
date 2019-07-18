<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseIndex.aspx.cs" Inherits="Edu_Online.CourseIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>课程详情</title>
    <style type="text/css">
        body {
            padding: 0;
            margin: 0;
            background-color: #f7f7f7;
            font-family: "pingfang SC", "Microsoft YaHei", "微软雅黑", helvetica, arial, verdana, tahoma, sans-serif;
        }

        .header {
            background-color: white;
            width: 1040px;
            height: 268px;
            margin-top: 40px;
            margin-left: 133px;
            padding: 32px;
            background: #fff;
            box-shadow: 0 8px 16px 0 rgba(7,17,27,.1);
            border-radius: 12px;
        }

        .img {
            width: 476px;
            float: left;
            border-radius: 5px;
        }

        .rightTop {
            margin: 35px 80px;
            width: 396px;
            float: left;
        }

        .name {
            font-weight: bold;
            color: #4F5459;
            font-size: 22px;
            margin-left: 20px;
        }

        .someInfo {
            width: 396px;
            height: 70px;
            margin-top: 30px;
        }

        .restInfo, .partInfo, .teacherInfo {
            height: 70px;
            font-size: 17px;
            width: 110px;
            float: left;
            padding-left: 20px;
        }

        .rest, .part, .teacher {
            font-size: 16px;
            color: #AFB4B8;
            line-height: 40px;
        }

        .restCount, .partCount, .teacherName {
            color: #4F5459;
            font-size: 18px;
            margin-top: 20px;
        }

        .open {
            margin-left: 255px;
            margin-top: 30px;
            width: 140px;
            height: 40px;
            border-radius: 5px;
            color: #fff;
            background: #008BE1;
            border: none;
            cursor: pointer;
        }

        .footer_top, .footer_bottom {
            margin-bottom: 8px;
            padding: 14px 32px 26px;
            background: #fff;
            box-shadow: 0 8px 16px 0 rgba(7,17,27,.1);
            border-radius: 12px;
            width: 1040px;
            margin-top: 30px;
            margin-left: 133px;
        }

        .tip {
            font-size: 14px;
            width: 130px;
            height: 30px;
            background: #008BE1;
            box-shadow: 3px 5px 8px rgba(0,139,255,.2);
            color: #fff;
            text-align: center;
            line-height: 60px;
            position: relative;
            margin-left: -43px;
            padding: 5px 30px;
        }

            .tip:before {
                content: '';
                position: absolute;
                left: 0;
                bottom: -10px;
                width: 0;
                height: 0;
                border-top: 10px solid #00568A;
                border-left: 10px solid transparent;
            }

        .maininfo {
            font-size: 14px;
            line-height: 28px;
            text-align: justify;
        }

        .play {
            width: 26px;
            vertical-align: middle;
        }

        .title {
            font-size: 16px;
            padding: 10px;
            padding-right: 180px;
            line-height: 40px;
            border-radius: 5px;
        }

            .title:hover {
                color: #60baf1;
                background-color: #f7f7f7;
            }

        #listInfo {
            background-color: white;
            box-shadow: 3px 5px 8px rgba(7,17,27,.1);
            z-index: 999;
            position: absolute;
            width: 30%;
            height: 45%;
            border-radius: 12px;
            top: 20%;
            left: 30%;
            padding: 35px 60px;
            cursor: pointer;
        }

        .close {
            position: absolute;
            width: 40px;
            top: 4px;
            right: 4px;
        }
    </style>
    <script type="text/javascript">
        function warm() {
            alert("无权限查看");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <asp:Image ID="img" runat="server" CssClass="img" />
            <asp:Panel ID="rightTop" runat="server" CssClass="rightTop">
                <asp:Label ID="name" runat="server" CssClass="name"></asp:Label>
                <asp:Panel ID="someInfo" runat="server" CssClass="someInfo">
                    <asp:Panel ID="restInfo" runat="server" CssClass="restInfo" Style="border-right: 2px solid #F2F2F2">
                        <asp:Label ID="rest" runat="server" Text="可选数" CssClass="rest"></asp:Label><br />
                        <asp:Label ID="restCount" runat="server" CssClass="restCount"></asp:Label>
                    </asp:Panel>
                    <asp:Panel ID="partInfo" runat="server" CssClass="partInfo" Style="border-right: 2px solid #F2F2F2; float: left">
                        <asp:Label ID="part" runat="server" Text="课程结构" CssClass="part"></asp:Label><br />
                        <asp:Label ID="partCount" runat="server" CssClass="partCount"></asp:Label>
                    </asp:Panel>
                    <asp:Panel ID="teacherInfo" runat="server" CssClass="teacherInfo" Style="float: left">
                        <asp:Label ID="teacher" runat="server" Text="教师" CssClass="teacher"></asp:Label><br />
                        <asp:Label ID="teacherName" runat="server" CssClass="teacherName"></asp:Label>
                    </asp:Panel>
                </asp:Panel>
                <asp:Button ID="open" runat="server" Text="课程安排" CssClass="open" OnClick="open_Click" />
            </asp:Panel>
        </div>

        <div class="footer">
            <div class="footer_top">
                <asp:Label ID="tip_left" runat="server" Text="课程概况" CssClass="tip"></asp:Label><br />
                <asp:Label ID="maininfo_left" runat="server" CssClass="maininfo"></asp:Label>
            </div>
            <div class="footer_bottom">
                <asp:Label ID="tip_right" runat="server" Text="课程目标" CssClass="tip"></asp:Label><br />
                <asp:Label ID="maininfo_right" runat="server" CssClass="maininfo"></asp:Label>
            </div>
        </div>

        <div id="listInfo" runat="server" visible="false">
            <div class="content" onclick="warm()">
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" CssClass="content">
                    <ItemTemplate>
                        <asp:Image ID="play" runat="server" ImageUrl="~/images/play.png" CssClass="play" />
                        <asp:Label ID="title" runat="server" Text='<%# Eval("VideoTitle") %>' CssClass="title"></asp:Label>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EduString %>" SelectCommand="SELECT [VideoTitle] FROM [VideoInfo]"></asp:SqlDataSource>
            </div>
            <asp:ImageButton ID="close" runat="server" ImageUrl="~/images/close.png" CssClass="close" OnClick="close_Click" />
        </div>
    </form>
</body>
</html>
