<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseDetails.aspx.cs" Inherits="Edu_Online.CommentList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>课程详情</title>
    <style type="text/css">
        body {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            margin: 0px;
            padding: 0px;
            background-color: #60baf1;
        }

        .headerInfo {
            margin: 2% 3% 0 3%;
            width: 87%;
            height: 44%;
            padding: 2% 4%;
            background-color: #f7f7f7;
            border-radius: 5px;
        }

        .video {
            float: left;
            width: 50%;
        }

        .partInfo {
            border-radius: 12px;
            background-color: white;
            padding: 2% 3%;
            float: left;
            margin-top: 1%;
            margin-left: 5%;
            height: 75%;
            overflow: auto;
            border: 2px solid #cacaca;
            width: 37%;
        }

        .title {
            color: #524949;
            padding-left: 14px;
            font-size: 15px;
            vertical-align: middle;
            line-height: 35px;
        }

            .title:hover {
                color: #60baf1;
            }

        .play {
            float: left;
            height: 20px;
            padding-top: 5px;
        }

        .listInfo {
            margin: 0% 3%;
            width: 95%;
            background-color: #f7f7f7;
            border-radius: 0px 0px 5px 5px;
            height: 60%;
            overflow: auto;
        }

        .bar {
            width: 83%;
            margin-top: 2%;
            background-color: white;
            box-shadow: 0 4px 8px 0 rgba(28,31,33,.1);
            padding: 1.5% 6%;
            border-radius: 5px 5px 0 0;
            margin-left: 3%;
        }

        .partTitle {
            margin-right: 100px;
            font-size: 16px;
            color: dimgray;
            font-weight: 700;
            cursor: pointer;
            border: none;
            background-color: white;
        }

        .someIntro {
            margin-top: 1.5%;
            width: 90%;
            padding: 20px 0px 16px 36px;
            background-color: white;
            box-shadow: 0 8px 16px 0 rgba(7,17,27,.1);
            border-radius: 12px;
            margin-left: 4%;
        }

        .intro, .target {
            padding: 10px 20px 10px 0px;
            margin-bottom: 20px;
            height: 115px;
        }

        .tip {
            border-left: 5px solid #60baf1;
            font-size: 20px;
            line-height: 50px;
            padding-left: 20px;
        }

        .maininfo {
            line-height: 32px;
            font-size: 15px;
        }

        .QuestionList {
            width: 93%;
            margin-left: 4%;
        }

        .QAstyle {
            margin-top: 1.5%;
            padding: 27px 40px;
            background: #fff;
            box-shadow: 0 4px 8px 0 rgba(7,17,27,.1);
            border-radius: 12px;
            margin-bottom: 2%;
        }

        .Qstyle {
            width: 100%;
        }

        .img {
            width: 40px;
            float: left;
            margin-right: 20px;
        }

        .Qtime {
            font: 14px/1.5 "PingFang SC","微软雅黑","Microsoft YaHei",Helvetica,"Helvetica Neue",Tahoma,Arial,sans-serif;
            color: #8e8e8e;
            font-size: 14px;
            line-height: 30px;
        }

        .Qcontent {
            font-size: 14px;
            line-height: 1.5;
            color: #333;
            margin-left: 60px;
        }

        .Toanswer {
            background-color: white;
            border: none;
            color: #4d555d;
            margin-left: 94%;
            cursor: pointer;
        }

            .Toanswer:hover, .submit:hover {
                color: #60baf1
            }

        .Addanswer {
            width: 98%;
            overflow: auto;
            word-break: break-all;
            height: 100px;
            color: #000;
            font-size: 16px;
            resize: none;
            margin: 1%;
        }

        .submit {
            background-color: white;
            border: none;
            color: #4d555d;
            margin-left: 2%;
            margin-bottom: 2%;
            cursor: pointer;
        }

        .Aname {
            font-size: 14px;
            padding-right: 10px;
            color: #5a5a5a;
        }

        .Acontent {
            font-size: 13px;
            color: #5b5f5f;
        }

        .Atime {
            font-size: 14px;
            padding-left: 56px;
            line-height: 30px;
            color: #8e8e8e;
        }

        .Astyle {
            border-left: 5px solid #ccc;
            height: 164px;
            overflow: auto;
            width: 96%;
            padding-left: 2%;
            margin-left: 1%;
        }

        .Aitem {
            padding-top: 9px;
            padding-bottom: 5px;
            border-bottom: 1px dashed #ccc;
            margin-bottom: 1.5%;
            width: 1025px;
        }

        .CommentList {
            background-color: #f7f7f7;
            width: 81%;
            padding: 1% 6%;
            border-radius: 12px;
        }

        .Cstyle {
            height: 97px;
            width: 1040px;
            margin-bottom: 8px;
            padding: 25px 40px;
            background: #fff;
            box-shadow: 0 4px 8px 0 rgba(7,17,27,.1);
            border-radius: 12px;
        }

        .CommentBy {
            font: 14px/1.5 "PingFang SC","微软雅黑","Microsoft YaHei",Helvetica,"Helvetica Neue",Tahoma,Arial,sans-serif;
            color: #1c1f21;
        }

        .CommentContent {
            font: 14px/1.5 "PingFang SC","微软雅黑","Microsoft YaHei",Helvetica,"Helvetica Neue",ahoma,Arial,sans-serif;
            color: gray;
        }

        .goodInfo {
            float: left;
            width: 4%;
            background-color: #f1f1f1;
            padding: 7px 16px;
            font-size: 14px;
            line-height: 1.5;
            border-radius: 18px;
            color: #93999f;
            text-align: center;
            vertical-align: middle;
            margin-left: 60px;
            margin-top: 15px;
            cursor: pointer;
            text-decoration: none;
        }

            .goodInfo:hover {
                background-color: #e0e0e0;
            }

        .CommentTime {
            float: right;
            margin-top: 25px;
            color: #93999f;
            font-size: 12px;
        }

        .link {
            text-decoration: none;
        }

        .back {
            position: absolute;
            right: 3%;
            top: 6%;
            border: none;
            padding: 3px 6px;
            background-color: #f7f7f7;
            color: #4F5459;
            font-size: 14px;
            cursor: pointer;
        }

            .back:hover {
                color: white;
                background-color: #4F5459;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="height: 780px; width: 100%">
        <div id="headerInfo" runat="server" class="headerInfo">
            <asp:Button ID="back" runat="server" Text="返回" OnClick="back_Click" CssClass="back" />
            <video id="video" controls="controls" runat="server" class="video">
                <source type="audio/mp4" />
            </video>
            <div id="partInfo" runat="server" class="partInfo">
                <asp:DataList ID="DataList1" runat="server">
                    <ItemTemplate>
                        <asp:LinkButton ID="link" runat="server" CssClass="link" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "VideoName") %>' OnClick="link_Click">
                            <asp:Image ID="play" runat="server" ImageUrl="~/img/play.png" CssClass="play" />
                            <asp:Label ID="title" runat="server" Text='<%# Eval("VideoName") %>' CssClass="title"></asp:Label>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
        <div id="bar" runat="server" class="bar">
            <asp:Button ID="introPart" runat="server" Text="简介" CssClass="partTitle" OnClick="introPart_Click" />
            <asp:Button ID="QAPart" runat="server" Text="问答" CssClass="partTitle" OnClick="QAPart_Click" />
            <asp:Button ID="Comment" runat="server" Text="评价" CssClass="partTitle" OnClick="Comment_Click" />
        </div>
        <div id="listInfo" runat="server" class="listInfo">


            <div class="someIntro" id="someIntro" runat="server">
                <div class="intro">
                    <asp:Label ID="tip_top" runat="server" Text="课程概况" CssClass="tip"></asp:Label><br />
                    <div class="maininfo">
                        <asp:Label ID="maininfo_top" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="target">
                    <asp:Label ID="tip_bottom" runat="server" Text="课程目标" CssClass="tip"></asp:Label><br />
                    <div class="maininfo">
                        <asp:Label ID="maininfo_bottom" runat="server"></asp:Label>
                    </div>
                </div>
            </div>

            <div id="questionList" runat="server" class="QuestionList">
                <asp:DataList ID="outerDataList" runat="server" OnItemDataBound="outerDataList_OnItemDataBound" OnItemCommand="outerDataList_ItemCommand" Width="100%">
                    <ItemTemplate>
                        <div class="QAstyle">
                            <div class="Qstyle">
                                <asp:Image ID="Person" runat="server" ImageUrl="~/img/person.png" CssClass="img" />
                                <asp:Label ID="Qname" runat="server" Text='<%# Eval("QuestionBy") %>' CssClass="Qname"></asp:Label><br />
                                <asp:Image ID="Clock" runat="server" Height="14px" ImageUrl="~/img/clock.png" />
                                <asp:Label ID="Qtime" runat="server" Text='<%# Eval("QuestionTime") %>' CssClass="Qtime"></asp:Label><br />
                                <asp:Label ID="Qcontent" runat="server" Text='<%# Eval("QuestionContent") %>' CssClass="Qcontent"></asp:Label><br />
                                <asp:Button ID="ToAnswer" runat="server" Text="回复" CommandName="answer" CssClass="Toanswer" /><br />
                                <asp:TextBox ID="AddAnswer" runat="server" Visible="false" CssClass="Addanswer" TextMode="MultiLine"></asp:TextBox><br />
                                <asp:Button ID="Submit" runat="server" Text="确认回复" Visible="false" CommandArgument='<%#Eval("QuestionId") %>' CommandName="submit" CssClass="submit" />
                            </div>
                            <div class="Astyle">
                                <asp:DataList ID="innerDataList" runat="server">
                                    <ItemTemplate>
                                        <div class="Aitem">
                                            <asp:Label ID="Aname" runat="server" Text='<%# Eval("AnswerBy") %>' CssClass="Aname"></asp:Label>
                                            <asp:Label ID="Acontent" runat="server" Text='<%# Eval("AnswerContent") %>' CssClass="Acontent"></asp:Label><br />
                                            <asp:Label ID="Atime" runat="server" Text='<%# Eval("AnswerTime") %>' CssClass="Atime"></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>

            <div id="commentList" runat="server" class="CommentList">
                <asp:DataList ID="DataList2" runat="server" OnItemCommand="DataList2_ItemCommand">
                    <ItemTemplate>
                        <div class="Cstyle">
                            <asp:Image ID="img" runat="server" ImageUrl="~/img/person.png" CssClass="img" />
                            <asp:Label Text='<%# Eval("CommentBy") %>' runat="server" ID="CommentBy" CssClass="CommentBy" /><br />
                            <asp:Label Text='<%# Eval("CommentContent") %>' runat="server" ID="CommentContent" CssClass="CommentContent" /><br />
                            <asp:LinkButton ID="goodInfo" runat="server" CommandName="good" CommandArgument='<%#Eval("commentId") %>' CssClass="goodInfo">
                                <asp:Image ID="Good" runat="server" ImageUrl="~/img/good.png" Width="16px" />
                                <asp:Label Text='<%# Eval("GoodCount") %>' runat="server" ID="GoodCount" CssClass="GoodCount" />
                            </asp:LinkButton>
                            <asp:Label Text='<%# Eval("CommentTime") %>' runat="server" ID="CommentTime" CssClass="CommentTime" />
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </form>
</body>
</html>