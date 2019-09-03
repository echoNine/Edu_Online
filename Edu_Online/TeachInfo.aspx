<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeachInfo.aspx.cs" Inherits="Edu_Online.TeachInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>教师简介</title>
    <style type="text/css">
        .pic {
            width: 110px;
            margin: 33% 20% 27%;
        }

        .name {
            margin-left: 44%;
            font-size: 18px;
            color: #1d1f69;
            font-weight: bold;
        }

        .introInfo {
            position: absolute;
            top: 8%;
            left: 37%;
            padding: 10px 25px 20px 25px;
            background-color: #fdfdfd;
            border-radius: 10px;
            margin-right: 20px;
            width: 220px;
        }

        .listInfo {
            position: absolute;
            top: 55%;
            left: 37%;
            padding: 10px 25px 20px 25px;
            background-color: #fdfdfd;
            border-radius: 10px;
            margin-right: 20px;
            width: 220px;
        }

        .introTitle, .listTitle {
            font-weight: bold;
            color: gray;
            line-height: 38px;
        }

        .intro{
            font-size: 14px;
            color: gray;
        }
        .list {
            font-size: 14px;
            color: gray;
            text-decoration:none;
        }

        .list:hover{
            color:#53b9f5;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="TeachId" OnItemDataBound="DataList1_ItemDataBound">
                <ItemTemplate>
                    <asp:Image ID="pic" runat="server" ImageUrl='<%# Eval("TeachPic") %>' CssClass="pic" /><br />
                    <asp:Label ID="name" runat="server" Text='<%# Eval("TeachName") %>' CssClass="name" /><br />
                    <asp:Panel ID="introInfo" runat="server" CssClass="introInfo">
                        <asp:Label ID="introTitle" runat="server" Text="教师简介" CssClass="introTitle" /><br />
                        <asp:Label ID="intro" runat="server" Text='<%# Eval("intro") %>' CssClass="intro" />
                    </asp:Panel>
                    <asp:Panel ID="listInfo" runat="server" CssClass="listInfo">
                        <asp:Label ID="listTitle" runat="server" Text="已开课程" CssClass="listTitle" /><br />
                        <asp:DataList ID="list" runat="server" DataKeyField="courseId" CssClass="list">
                            <ItemTemplate>
                                <asp:HyperLink ID="courseName" runat="server" NavigateUrl='<%#"~/StuCourseIntro.aspx?id="+Eval("courseId") %>' Text='<%# Eval("courseName") %>' CssClass="list"/>
                            </ItemTemplate>
                        </asp:DataList>
                    </asp:Panel>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </form>
</body>
</html>
