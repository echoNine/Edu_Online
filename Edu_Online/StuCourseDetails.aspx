<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StuCourseDetails.aspx.cs" Inherits="Edu_Online.StuCourseDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>学习页面</title>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            background-color: #ececec;
        }

        .header {
            width: 100%;
            background-color: #5a5a5a;
            line-height: 60px;
            vertical-align: middle;
        }

        .return {
            width: 16px;
            margin-left: 2%;
        }

        .courseTitle {
            color: white;
            font-size: 20px;
        }

        .btn_title {
            width: 30%;
            float: right;
        }

        .partTitle {
            font-size: 14px;
            margin-right: 5%;
            padding: 5px 15px;
            border-radius: 14px;
            border: none;
            background-color: GhostWhite;
            margin-left: 10%;
            cursor: pointer;
        }

        .video {
            float: left;
            width: 70%;
        }

        .showlist {
            background-color: #5a5a5a;
            height: 521px;
            width: 29.9%;
            float: right;
            border-top: 1px solid white;
            padding-top: 10px;
        }

        .link {
            text-decoration: none;
        }

        .title {
            color: #ffffff;
            padding-left: 10px;
            font-size: 16px;
            vertical-align: middle;
            line-height: 35px;
        }

        .play {
            float: left;
            height: 24px;
            padding-top: 5px;
            margin-left: 16px;
        }

        .takenotes {
            background-color: #5a5a5a;
            height: 491px;
            width: 25.5%;
            float: right;
            border-top: 1px solid white;
            padding: 20px 30px;
        }

        .notecontent {
            background-color: white;
            padding: 15px 10px;
            font-size: 14px;
            border-radius: 4px;
            width: 93%;
            height: 60%;
            resize: none;
            margin-top: 0 !important;
            font-family: 'Microsoft Yahei';
        }

        .btn_save, .btn_push {
            width: 65px;
            height: 30px;
            line-height: 30px;
            border-radius: 14px;
            font-size: 14px;
            cursor: pointer;
            margin-top: 25px;
            background-color: #466de2;
            color: #fff;
            border: 1px solid #466de2;
            float: right;
        }

        .askques {
            background-color: #5a5a5a;
            height: 471px;
            width: 24%;
            float: right;
            border-top: 1px solid white;
            padding: 30px 40px;
        }

        .quespanel {
            width: 82%;
            height: 60%;
            background-color: white;
            padding: 20px 30px;
            border-radius: 10px;
        }

        .asktop {
            font-size: 15px;
            color: gray;
            font-weight: bold;
        }

        .quescontent {
            background: #ffffff;
            padding: 10px;
            font-size: 14px;
            border-radius: 4px;
            resize: none;
            margin-top: 15px;
            font-family: 'Microsoft Yahei';
            border-color: #ececec;
            width: 91%;
            height: 68%;
        }

        .datainfo {
            background-color: #fff;
            width: 90%;
            float: left;
            position: relative;
            margin: 2% 5%;
            overflow: auto;
        }

        .bar {
            width: 94%;
            margin-left: 3%;
            border-bottom: 2px solid #cac5c5;
            background-color: white;
        }

        .dataTitle {
            background-color: white;
            border: none;
            margin-right: 4%;
            padding: 2% 4px;
            font-size: 14px;
            cursor: pointer;
        }

            .dataTitle:hover {
                color: #47abdd;
            }

        .notedata {
            padding: 0 36px 40px 37px;
            width: 94%;
        }

        .noteItem {
            border-bottom: 1px solid #eee;
            height: 120px;
            padding-left: 18px;
            margin-top: 25px;
        }

        .notelist {
            height: 120px;
        }

        .noteContent {
            color: #333;
            font-size: 16px;
            line-height: 30px;
        }

        .clock {
            height: 10px;
            padding: 0 3px;
        }

        .time {
            color: gray;
            font-size: 12px;
            line-height: 30px;
        }

        .Name {
            float: left;
            max-width: 450px;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
            font-size: 13px;
            color: gray;
            line-height: 40px;
        }

        .edit, .delete {
            border: none;
            background-color: white;
            color: #999;
            cursor: pointer;
        }

        .editbox {
            display: none;
        }

        .inputnote {
            resize: none;
            border: 1px solid #eee;
            background: #fafafa;
            width: 860px;
            padding: 15px;
            outline: 0;
            height: 100px;
            font-size: 14px;
            line-height: 1.15;
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        }

        .cancel {
            border: none;
            padding: 7px 15px;
            border-radius: 12px;
            font-size: 12px;
            background-color: #ddd;
            color: #999;
            float: right;
            margin-right: 27px;
            margin-top: 15px;
            cursor: pointer;
        }

        .save {
            border: none;
            padding: 7px 15px;
            border-radius: 12px;
            font-size: 12px;
            background-color: #3f61c7;
            color: white;
            float: right;
            margin-right: 37px;
            margin-top: 15px;
            cursor: pointer;
        }

        .quesdata {
            width: 92%;
            margin: 2% 4%;
        }

        .QAdata {
            background-color: #fdfdfd;
            border-radius: 5px;
            padding: 15px 25px 25px;
            border: 10px;
            margin-bottom: 10px;
        }

        .Qdata {
            padding: 15px 25px;
        }

        .person {
            width: 40px;
            float: left;
            margin-right: 20px;
        }

        .Qname {
            font-size: 15px;
            color: #464545;
        }

        .clock {
            height: 12px;
            padding: 0 3px;
        }

        .Qtime {
            color: #8e8e8e;
            font-size: 15px;
        }

        .Qcontent {
            line-height: 40px;
            margin-left: 60px;
            color: #464545;
        }

        .Adata {
            margin-left: 85px;
            border-left: 3px solid #ccc;
        }

        .Aitem {
            margin: 8px 15px;
            border-bottom: 1px dashed #ccc;
            padding-bottom: 8px;
            width: 230%;
        }

        .Aname {
            font-size: 15px;
            color: #333;
        }

        .Acontent {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 14px;
            line-height: 1.42857143;
            color: #464545;
            margin-left: 15px;
        }

        .Atime {
            font-size: 13px;
            color: #8e8e8e;
            margin-left: 65px;
            line-height: 30px;
        }

        .resdata {
            margin: 3% 5%;
        }

        .lbtnDown {
            text-decoration: none;
            color: black;
        }

            .lbtnDown:hover {
                color: #47abdd;
            }
    </style>
</head>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<body>
    <form id="form1" runat="server">
        <div id="header" runat="server" class="header">
            <asp:Image ID="return" runat="server" ImageUrl="~/img/return.png" CssClass="return" />
            <asp:Label ID="courseTitle" runat="server" CssClass="courseTitle"></asp:Label>
            <div id="btn_title" runat="server" class="btn_title">
                <asp:Button ID="list" runat="server" Text="章节" CssClass="partTitle" OnClick="list_Click" />
                <asp:Button ID="note" runat="server" Text="笔记" CssClass="partTitle" OnClick="note_Click" />
                <asp:Button ID="ques" runat="server" Text="提问" CssClass="partTitle" OnClick="ques_Click" />
            </div>
        </div>
        <video id="video" controls="controls" runat="server" class="video">
            <source type="audio/mp4" />
        </video>
        <div id="showlist" runat="server" class="showlist" visible="false">
            <asp:DataList ID="DataList1" runat="server">
                <ItemTemplate>
                    <asp:LinkButton ID="link" runat="server" CssClass="link" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "VideoName") %>' OnClick="link_Click">
                        <asp:Image ID="play" runat="server" ImageUrl="~/img/play1.png" CssClass="play" />
                        <asp:Label ID="title" runat="server" Text='<%# Eval("VideoName") %>' CssClass="title"></asp:Label>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div id="takenotes" runat="server" class="takenotes" visible="false">
            <textarea id="notecontent" runat="server" cols="20" rows="2" class="notecontent" placeholder="好记性不如烂笔头"></textarea>
            <asp:Button ID="btn_save" runat="server" Text="保存" CssClass="btn_save" OnClick="btn_save_Click" />
        </div>
        <div id="askques" runat="server" class="askques" visible="false">
            <asp:Panel ID="quespanel" runat="server" CssClass="quespanel">
                <asp:Label ID="asktop" runat="server" Text="提出问题" CssClass="asktop"></asp:Label><br />
                <textarea id="quescontent" runat="server" cols="20" rows="2" class="quescontent"></textarea>
            </asp:Panel>
            <asp:Button ID="btn_push" runat="server" Text="发布" CssClass="btn_push" OnClick="btn_push_Click" />
        </div>

        <div id="datainfo" runat="server" class="datainfo">
            <div id="bar" runat="server" class="bar">
                <asp:Button ID="notetitle" runat="server" Text="笔记" CssClass="dataTitle" OnClick="notetitle_Click" />
                <asp:Button ID="questitle" runat="server" Text="问答" CssClass="dataTitle" OnClick="questitle_Click" />
                <asp:Button ID="restitle" runat="server" Text="课程资料" CssClass="dataTitle" OnClick="restitle_Click" />
            </div>

            <div id="main" runat="server" class="main">
                <div id="notedata" runat="server" class="notedata">
                    <asp:DataList ID="NoteDataList" runat="server" DataKeyField="noteId" OnItemCommand="NoteDataList_ItemCommand">
                        <ItemTemplate>
                            <asp:Panel class="noteItem" ID="noteItem" runat="server">
                                <asp:Panel class="notelist" ID="notelist" runat="server">
                                    <asp:Label ID="noteContent" runat="server" Text='<%# Eval("noteContent") %>' CssClass="noteContent" /><br />
                                    <asp:Image ID="Clock" runat="server" ImageUrl="~/img/clock.png" CssClass="clock" /><asp:Label ID="noteTime" runat="server" Text='<%# Eval("noteTime") %>' CssClass="time" /><br />
                                    <asp:Label ID="Name" runat="server" Text='<%# Eval("courseName")+">"+ Eval("VideoName")%>' CssClass="Name" />
                                    <asp:Image ID="editimg" runat="server" ImageUrl="~/img/edit.png" Style="margin-left: 394px;" /><asp:Button ID="edit" runat="server" Text="编辑" CssClass="edit" CommandName="edit" />
                                    <asp:Image ID="delimg" runat="server" ImageUrl="~/img/delete.png" Style="margin-left: 40px;" /><asp:Button ID="delete" runat="server" Text="删除" CssClass="delete" CommandName="delete" CommandArgument='<%#Eval("noteId") %>' />
                                </asp:Panel>
                                <asp:Panel class="editbox" ID="editbox" runat="server">
                                    <asp:TextBox ID="inputnote" runat="server" TextMode="MultiLine" CssClass="inputnote"></asp:TextBox><br />
                                    <asp:Button ID="save" runat="server" Text="保存" CssClass="save" CommandName="save" CommandArgument='<%#Eval("noteId") %>' />
                                    <asp:Button ID="cancel" runat="server" Text="取消" CssClass="cancel" CommandName="cancel" />

                                </asp:Panel>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:DataList>
                </div>

                <div id="quesdata" runat="server" class="quesdata">
                    <asp:DataList ID="outer" runat="server" DataKeyField="questionId" OnItemDataBound="outer_ItemDataBound" Width="100%">
                        <ItemTemplate>
                            <div class="QAdata">
                                <div class="Qdata">
                                    <asp:Image ID="Person" runat="server" ImageUrl="~/img/person.png" CssClass="person" />
                                    <asp:Label ID="Qname" runat="server" Text='<%# Eval("questionBy") %>' CssClass="Qname"></asp:Label><br />
                                    <asp:Image ID="Clock" runat="server" ImageUrl="~/img/clock.png" CssClass="clock" />
                                    <asp:Label ID="Qtime" runat="server" Text='<%# Eval("questionTime") %>' CssClass="Qtime"></asp:Label><br />
                                    <asp:Label ID="Qcontent" runat="server" Text='<%# Eval("questionContent") %>' CssClass="Qcontent"></asp:Label><br />
                                </div>
                                <div class="Adata">
                                    <asp:DataList ID="inner" runat="server">
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

                <div id="resdata" runat="server" class="resdata">
                    <asp:GridView ID="gvResource" runat="server" Width="900px" AutoGenerateColumns="False" DataKeyNames="fileId" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                        <Columns>
                            <asp:BoundField DataField="fileId" HeaderText="文件编号" ReadOnly="True" InsertVisible="False" SortExpression="fileId"></asp:BoundField>
                            <asp:BoundField DataField="fileName" HeaderText="文件名称" SortExpression="fileName"></asp:BoundField>
                            <asp:BoundField DataField="remark" HeaderText="备注" SortExpression="remark"></asp:BoundField>
                            <asp:BoundField DataField="upTime" HeaderText="上传时间" SortExpression="upTime"></asp:BoundField>
                            <asp:TemplateField HeaderText="资源下载">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDown" runat="server" OnCommand="lbtnDown_Click" CommandArgument='<%#Eval("filePath").ToString() %>' CssClass="lbtnDown">下载</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#60baf1" ForeColor="Black" />
                        <HeaderStyle Font-Bold="True" ForeColor="White" HorizontalAlign="Center" BackColor="#60baf1" Height="50px" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Center" Height="45px" />
                        <SelectedRowStyle BackColor="#60baf1" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
<script>
    function parseURL(url) { 
    var a = document.createElement('a'); 
    a.href = url; 
    return { 
        source: url, 
        protocol: a.protocol.replace(':',''), 
        host: a.hostname, 
        port: a.port, 
        query: a.search, 
        params: (function(){ 
            var ret = {}, 
            seg = a.search.replace(/^\?/,'').split('&'), 
            len = seg.length, i = 0, s; 
            for (;i<len;i++) { 
                if (!seg[i]) { continue; } 
                s = seg[i].split('='); 
                ret[s[0]] = s[1]; 
            } 
            return ret; 
        })(), 
        file: (a.pathname.match(/\/([^\/?#]+)$/i) || [,''])[1], 
        hash: a.hash.replace('#',''), 
        path: a.pathname.replace(/^([^\/])/,'/$1'), 
        relative: (a.href.match(/tps?:\/\/[^\/]+(.+)/) || [,''])[1], 
        segments: a.pathname.replace(/^\//,'').split('/') 
    }; 
}
    $(document).ready(function () {
        $("#video").on('timeupdate', function () {
            path = decodeURI(parseURL(this.src).path);
            path = path.substring(1, path.length);
            var opt = {
                currentTime: this.currentTime,
                videoPath: path
            };
            $.ajax({
                type: "post",
                url: "StuCourseDetails.aspx/CurrentTime",
                dataType: "json",
                contentType : "application/json",
                data: JSON.stringify(opt),
                success: function (result) {
                    console.log(result);
                }
            });
        });
    });
</script>
</html>
