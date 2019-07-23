<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseDetails.aspx.cs" Inherits="Edu_Online.CommentList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>课程详情</title>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            background-color: #60baf1;
        }

        .headerInfo {
            margin: 3%;
            width: 87%;
            height: 340px;
            padding: 2% 4%;
            background-color: #f7f7f7;
            border-radius: 5px;
        }

        #video {
            float: left;
            width: 51%;
        }

        .topRight {
            width: 40%;
            float: left;
            padding: 20px 0px 16px 36px;
            margin-left: 5%;
            background-color: white;
            box-shadow: 0 8px 16px 0 rgba(7,17,27,.1);
            border-radius: 12px;
        }

        .top, .bottom {
            padding: 5px 20px 10px 0px;
            margin-bottom: 20px;
            height: 115px;
        }

            .top::-webkit-scrollbar, .bottom::-webkit-scrollbar {
                display: none;
            }

        .tip {
            border-left: 5px solid #60baf1;
            font-size: 18px;
            line-height: 36px;
            padding-left: 20px;
        }

        .maininfo {
            line-height: 32px;
            font-size: 14px;
            height: 100px;
            overflow-y: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="headerInfo" runat="server" class="headerInfo">
            <video id="video" controls="controls" runat="server">
                <source type="audio/mp4" /></video>
            <div class="topRight">
                <div class="top">
                    <asp:Label ID="tip_top" runat="server" Text="课程概况" CssClass="tip"></asp:Label><br />
                    <div class="maininfo">
                        <asp:Label ID="maininfo_top" runat="server"></asp:Label></div>
                </div>
                <div class="bottom">
                    <asp:Label ID="tip_bottom" runat="server" Text="课程目标" CssClass="tip"></asp:Label><br />
                    <div class="maininfo">
                        <asp:Label ID="maininfo_bottom" runat="server"></asp:Label><</div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
