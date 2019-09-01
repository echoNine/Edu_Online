<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Edu_Online.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录注册</title>
    <style type="text/css">
        body {
            background-image: url(img/indexback.png);
            background-repeat: no-repeat;
            overflow: hidden;
            background-size: 100%;
        }

        .main {
            position: absolute;
            width: 550px;
            height: 320px;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            background: #fff;
            padding: 45px 25px 90px 60px;
        }

        .btnLogin1, .btnRegister1 {
            background: #fff;
            width: 160px;
            height: 40px;
            font-size: 14px;
            margin-bottom: 13px;
            outline: none;
            border-top: none;
            border-left: none;
            border-right: none;
            cursor: pointer;
        }
        
        .btnLogin1:active, .btnRegister1:active {
            border-bottom: 0.5px solid #008BE1;
        }

        .loginInfo .inputLogin {
            background: url(/img/user.png) no-repeat;
            background-size: 28px 28px;
            background-position: 10px 50%;
            padding-left: 40px;
        }

        .loginInfo .inputRegister {
            background: url(/img/pwd.png) no-repeat;
            background-size: 28px 28px;
            background-position: 10px 50%;
            padding-left: 40px;
        }

        .inputLogin, .inputRegister,.inputEmail {
            width: 320px;
            height: 50px;
            border-radius: 5px;
            border: 1px solid #e4e4e4;
            margin-bottom: 26px;
            padding-left: 10px;
        }

        .forgetpwd {
            color: #AFAFAF;
            font-size: 14px;
            position: absolute;
            left: 56%;
            cursor:pointer;
            text-decoration:none;
        }
        .forgetpwd:hover{
            color: #3f9ae8;
        }
        .login, .register,.send {
            height: 50px;
            width: 362px;
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
            position: absolute;
            bottom: 38%;
            left: 25%;
        }

        .link {
            position: absolute;
            font-size: 14px;
            color: #3f9ae8;
            bottom: 30%;
            left: 22%;
            border:none;
            background-color:white;
        }

        .right {
            position: absolute;
            right: 9%;
            top: 10%;
            width: 150px;
            height: 80%;
            border-left: 1px solid #e4e4e4;
            float: right;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
            <asp:Button ID="show_login" runat="server" Text="登录" OnClick="show_login_Click" CssClass="btnLogin1" />
            <asp:Button ID="show_register" runat="server" Text="注册" OnClick="show_register_Click" CssClass="btnRegister1" />
            <asp:Panel ID="loginInfo" runat="server" CssClass="loginInfo">
                <asp:TextBox ID="txtUserId" runat="server" CssClass="inputLogin"></asp:TextBox>
                <br />
                <asp:TextBox ID="txtPwd" runat="server" CssClass="inputRegister" TextMode="Password"></asp:TextBox><br />
                <asp:HyperLink ID="forgetPwd" runat="server" CssClass="forgetpwd" NavigateUrl="~/ForgetPwd.aspx">忘记密码？</asp:HyperLink>
                <br />
                <asp:RadioButtonList ID="RadioUserType" runat="server" RepeatDirection="Horizontal" CellSpacing="24">
                    <asp:ListItem Selected="True">教师</asp:ListItem>
                    <asp:ListItem>学生</asp:ListItem>
                </asp:RadioButtonList>
                <asp:Button ID="login" runat="server" Text="登&nbsp;&nbsp;录" OnClick="btn_login_Click" CssClass="login" />
            </asp:Panel>

            <asp:Panel ID="registerInfoTeach" runat="server">
                账&nbsp;&nbsp;&nbsp;号：<asp:TextBox ID="userIdTeach" runat="server" CssClass="inputLogin" Width="220px"></asp:TextBox>
                <br />
                验证码：<asp:TextBox ID="mailTeach" runat="server" CssClass="inputEmail" Width="120px"></asp:TextBox>
                <asp:Button ID="sendTeach" runat="server" Text="获取验证码" OnClick="Send_Click1" CssClass="send" Width="95px" />
                <br />
                密&nbsp;&nbsp;&nbsp;码：<asp:TextBox ID="userPwdTeach" runat="server" TextMode="Password" CssClass="inputRegister" Width="220px"></asp:TextBox>
                <br />
                <asp:Button ID="registerTeach" runat="server" Text="创建教师账户" OnClick="btn_register_Click1" CssClass="register" Width="322px" />
                <div class="right">
                    <asp:Label ID="tipTeach" runat="server" Text="我是学生：" CssClass="tip"></asp:Label><br />
                    <asp:Button ID="linkTeach" runat="server" CssClass="link" Text="注册学生账号>" OnClick="linkTeach_Click" />
                </div>
            </asp:Panel>

            <asp:Panel ID="registerInfoStu" runat="server">
                账&nbsp;&nbsp;&nbsp;号：<asp:TextBox ID="userIdStu" runat="server" CssClass="inputLogin" Width="220px"></asp:TextBox>
                <br />
                验证码：<asp:TextBox ID="mailStu" runat="server" CssClass="inputEmail" Width="120px"></asp:TextBox>
                <asp:Button ID="sendStu" runat="server" Text="获取验证码" OnClick="Send_Click2" CssClass="send" Width="95px" />
                <br />
                密&nbsp;&nbsp;&nbsp;码：<asp:TextBox ID="userPwdStu" runat="server" TextMode="Password" CssClass="inputRegister" Width="220px"></asp:TextBox>
                <br />
                <asp:Button ID="registerStu" runat="server" Text="创建学生账户" OnClick="btn_register_Click2" CssClass="register" Width="322px" />
                <div class="right">
                    <asp:Label ID="tipStu" runat="server" Text="我是教师：" CssClass="tip"></asp:Label><br />
                    <asp:Button ID="linkStu" runat="server" CssClass="link" Text="注册教师账号>" OnClick="linkStu_Click" />
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>