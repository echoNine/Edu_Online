<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgetPwd.aspx.cs" Inherits="Edu_Online.ForgetPwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>找回密码</title>
    <style type="text/css">
        body {
            background-image: url(img/indexback.png);
            background-repeat: no-repeat;
            overflow: hidden;
        }

        .main {
            background-color: white;
            width: 40%;
            height: 400px;
            left: 27%;
            top: 16%;
            padding: 45px;
            position: absolute;
        }

        .header {
            font-size: 22px;
            margin: 0 auto;
            text-align: center;
        }

        .img {
            margin: 50px 77px;
        }

        .mail {
            margin: 0 0 0 73px;
        }

        .inputMail {
            height: 40px;
            border-radius: 5px;
            border: 1px solid #aeaeae;
            margin-bottom: 26px;
            padding-left: 10px;
        }

        .inputCode {
            height: 40px;
            border-radius: 5px;
            border: 1px solid #aeaeae;
            margin-bottom: 10px;
            padding-left: 10px;
            margin: 20px 0px 20px 25px;
        }

        .find, .send, .check,.change {
            border: none;
            border-radius: 5px;
            background: #008BE1;
            color: #fff;
            margin-top: 15px;
            font-size: 14px;
            font-weight: bold;
            font-family: "pingfang SC", "Microsoft YaHei", "微软雅黑", helvetica, arial, verdana, tahoma, sans-serif;
        }

        .tip {
            font-size: 12px;
            color: #008BE1;
            margin: 14%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
            <p class="header">找回密码</p>
            <asp:Image ID="firstImg" runat="server" ImageUrl="~/img/email_one.png" CssClass="img" />
            <asp:Image ID="secondImg" runat="server" ImageUrl="~/img/email_two.png" CssClass="img" />
            <asp:Image ID="thirdImg" runat="server" ImageUrl="~/img/email_three.png" CssClass="img" />
            <asp:Panel ID="first" runat="server">
                <asp:Label ID="mail" runat="server" Text="输入注册邮箱：" CssClass="mail"></asp:Label><asp:TextBox ID="txtMail" runat="server" CssClass="inputMail" Style="width: 280px;"></asp:TextBox>
                <asp:Button ID="find" runat="server" Text="找回密码" CssClass="find" OnClick="find_Click" Style="margin: 20px 77px; width: 401px; height: 50px;" />
            </asp:Panel>
            <asp:Panel ID="second" runat="server">
                <asp:TextBox ID="txtCode" runat="server" CssClass="inputCode" Style="width: 270px; margin-left: 76px"></asp:TextBox>
                <asp:Button ID="getcode" runat="server" Text="获取验证码" CssClass="send" OnClick="getcode_Click" Width="120px" Height="40px" />
                <asp:Button ID="check" runat="server" Text="验证" CssClass="check" Style="margin: 20px 77px; width: 401px; height: 50px;" OnClick="check_Click" />
            </asp:Panel>
            <asp:Panel ID="third" runat="server">
                <asp:Label ID="tip" runat="server" Text="邮箱地址：" CssClass="tip"></asp:Label><br />
                <span style="margin-left: 14%">新密码：</span><asp:TextBox ID="newone" runat="server" CssClass="inputCode" Style="width: 270px; margin-top: 10px"></asp:TextBox><br />
                <span style="margin-left: 14%">再次确认：</span><asp:TextBox ID="newtwo" runat="server" CssClass="inputCode" Style="width: 270px; margin-left: 10px; margin-top: 10px"></asp:TextBox>
                <asp:Button ID="change" runat="server" Text="重置" CssClass="change" Style="margin: 10px 77px; width: 401px; height: 50px;" OnClick="change_Click" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
