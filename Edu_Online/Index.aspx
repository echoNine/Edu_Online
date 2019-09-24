<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Edu_Online.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录注册</title>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="js/index.js"></script>
    <link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>
<form id="form1">
    <img src="/img/title.png" class="title"/>
    <div class="main">
        <label for="ShowLogin">
            <input id="ShowLogin" type="button" onclick="show_login()" value="登录" class="btnLogin">
        </label>
        <label for="ShowRegister">
            <input id="ShowRegister" type="button" onclick="show_register()" value="注册" class="btnRegister">
        </label>

        <div id="loginInfo">
            <label for="txtUserId">
                <input id="txtUserId" type="text" class="inputLogin UseIdImg">
            </label>
            <br/>
            <label for="txtPwd">
                <input id="txtPwd" type="password" class="inputLogin PassImg">
            </label>
            <br/>
            <a id="forgetPwd" href="ForgetPwd.aspx" class="forgetpwd">忘记密码?</a>
            <br/>
            <label for="teacherRadio" class="teacherRadio">
                <input id="teachradio" type="radio" name="usertype" checked="checked">
                <label for="teacher">教师</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <input id="sturadio" type="radio" name="usertype"><label for="student">学生</label>
            </label><br/>
            <label for="tologin">
                <input id="tologin" type="button" onclick="login()" value="登&nbsp;&nbsp;录" class="login" style="width:362px">
            </label>
        </div>

        <div id="registerInfo">
            账&nbsp;&nbsp;&nbsp;号：
            <label for="inputuserId">
                <input id="inputuserId" type="text" class="inputRegister" style="width:240px">
            </label><br/>
            验证码：
            <label for="inputmail">
                <input id="inputmail" type="text" class="inputRegister" style="width:130px">
            </label>
            <label for="sendMail">
                <input id="sendMail" type="button" onclick="sendEmail()" value="获取验证码" class="send" style="width:104px">
            </label>
            <br/>
            密&nbsp;&nbsp;&nbsp;码：
            <label for="inputuserPwd">
                <input id="inputuserPwd" type="password" class="inputRegister" style="width:240px">
            </label>
            <br/>
            <label for="register">
                <input id="register" type="button" onclick="toRegister()" value="创建教师账户" class="register" style="width:325px">
            </label>
            <div class="right">
                <label for="tipTeach">
                    <span class="tip" id="registerTip">我是学生: </span>
                    <input id="linkRegister" type="button" class="link" value="注册学生账号>" onclick="registerChange()">
                </label>
            </div>
        </div>
    </div>
    <img src="/img/foot.png" alt="" class="foot">
</form>
</body>
</html>