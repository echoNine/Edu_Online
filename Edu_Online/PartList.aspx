<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PartList.aspx.cs" Inherits="Edu_Online.PartList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>课程目录</title>
    <style type="text/css">
        .title {
            font-size: 18px;
            font-weight: bold;
            color: #5d5d5d;
            padding: 5%;
            line-height: 45px;
        }

        .main {
            margin-left:5%;
            font-size: 15px;
            color: #5d5d5d;
        }

        .name {
            line-height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="title" runat="server" Text="课程目录" CssClass="title"></asp:Label>
        <div class="main">
            <asp:DataList ID="DataList1" runat="server" DataKeyField="VideoId">
                <ItemTemplate>
                    <asp:Label ID="VideoName" runat="server" Text='<%# Eval("VideoName") %>' CssClass="name" />
                </ItemTemplate>
            </asp:DataList>
        </div>
    </form>
</body>
</html>
