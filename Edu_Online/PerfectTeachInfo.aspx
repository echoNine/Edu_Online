<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerfectTeachInfo.aspx.cs" Inherits="Edu_Online.PerfectInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>完善个人信息--教师</title>
    <script src="js/perfectTeachinfo.js"></script>
    <link rel="stylesheet" type="text/css" href="css/perfectTeachinfo.css">
</head>
<body>
    <form id="form1" runat="server">
        <img id="return" src="/img/return1.png" alt="" class="return" onclick="Return()"/>
        <div id="top" class="top">
            <span id="TeachTip">当前用户Id：</span>
            <span id="TeachId"></span>
        </div>
        
        <div class="main">
            <div class="LeftInfo">
                <asp:Label ID="BaseInfo" runat="server" Text="基本信息" CssClass="lefttitle"></asp:Label><br />
                <div class="info">
                    <asp:Label ID="name" runat="server" Text="姓名" CssClass="infoitem"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="info">
                    <asp:Label ID="sex" runat="server" Text="性别" CssClass="infoitem"></asp:Label>
                    <asp:RadioButton ID="Male" runat="server" GroupName="RadioSex" Text="男" Checked="true" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="Female" runat="server" GroupName="RadioSex" Text="女" />
                </div>
                <div class="info">
                    <asp:Label ID="birth" runat="server" Text="出生日期" CssClass="infoitem" Style="margin-right: 40px"></asp:Label>
                    <asp:DropDownList ID="year" runat="server" Style="width: 60px; padding-left: 5px;" CssClass="input"></asp:DropDownList>&nbsp;年&nbsp;
                        <asp:DropDownList ID="month" runat="server" Style="width: 60px; padding-left: 5px;" CssClass="input"></asp:DropDownList>&nbsp;月&nbsp;
                        <asp:DropDownList ID="day" runat="server" Style="width: 60px; padding-left: 5px;" CssClass="input"></asp:DropDownList>&nbsp;日&nbsp;
                </div>
                <div class="info">
                    <asp:Label ID="city" runat="server" Text="现居城市" CssClass="infoitem" Style="margin-right: 40px"></asp:Label>
                    <asp:TextBox ID="txtCity" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="info">
                    <asp:Label ID="phone" runat="server" Text="联系电话" CssClass="infoitem" Style="margin-right: 40px"></asp:Label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="input"></asp:TextBox>
                </div>
            </div>

            <div class="RightInfo">
                <asp:Label ID="OtherInfo" runat="server" Text="其他信息" CssClass="righttitle"></asp:Label>
                <div class="info">
                    <asp:Label ID="type" runat="server" Text="教师从属类型" CssClass="infoitem" Style="margin-right: 40px"></asp:Label>
                    <asp:DropDownList ID="TeachType" runat="server" CssClass="input" Width="210px">
                        <asp:ListItem Value="1">教师</asp:ListItem>
                        <asp:ListItem Value="2">在职</asp:ListItem>
                        <asp:ListItem Value="3">研究员</asp:ListItem>
                        <asp:ListItem Value="4">其他</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="info">
                    <asp:Label ID="Major" runat="server" Text="教学方向" CssClass="infoitem"></asp:Label>
                    <asp:DropDownList ID="TeachMajor" runat="server" CssClass="input" Width="210px">
                        <asp:ListItem Value="JavaScript">JavaScript</asp:ListItem>
                        <asp:ListItem Value="C">C</asp:ListItem>
                        <asp:ListItem Value="数据库">数据库</asp:ListItem>
                        <asp:ListItem Value="Android">Android</asp:ListItem>
                        <asp:ListItem Value=".Net">.Net</asp:ListItem>
                        <asp:ListItem Value="Php">Php</asp:ListItem>
                        <asp:ListItem Value="其他方向">其他方向</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="info">
                    <asp:Label ID="unit" runat="server" Text="任职单位" CssClass="infoitem"></asp:Label>
                    <asp:TextBox ID="txtUnit" runat="server" CssClass="input" Width="200px"></asp:TextBox>
                </div>
                <div class="info">
                    <asp:Label ID="intro" runat="server" Text="个人简介" CssClass="infoitem"></asp:Label>
                    <asp:TextBox ID="txtIntro" runat="server" CssClass="input" Width="200px"></asp:TextBox>
                </div>
                <div class="info">
                    <asp:Label ID="pic" runat="server" Text="更换头像" CssClass="infoitem"></asp:Label>
                    <asp:FileUpload ID="UploadPic" runat="server" Width="200px" />
                </div>
                <asp:Button ID="save" runat="server" Text="保存" OnClick="save_Click" CssClass="save" />
            </div>
        </div>
    </form>
</body>
</html>
