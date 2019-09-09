function registerChange() {
    var registerText = $("#linkRegister");
    var registerTip = $("#registerTip");
    var register = $("#register");
    var old = registerText.val();
    if (old === "注册学生账号>") {
        registerText.val("注册教师账号>");
        registerTip.text("我是教师: ");
        register.val("创建学生账户");
    } else {
        registerText.val("注册学生账号>");
        registerTip.text("我是学生: ");
        register.val("创建教师账户");
    }
}

function show_login() {
    $("#loginInfo").show();
    $("#registerInfo").hide();
    document.getElementById("ShowLogin").style.borderBottom = '2px solid #3f9ae8';
    document.getElementById("ShowRegister").style.borderBottom = '2px solid #cdd2d6';
}

function show_register() {
    $("#loginInfo").hide();
    $("#registerInfo").show();
    document.getElementById("ShowLogin").style.borderBottom = '2px solid #cdd2d6';
    document.getElementById("ShowRegister").style.borderBottom = '2px solid #3f9ae8';
}

function getUserType() {
    var register = $("#register").val();
    var UserType = "";
    if (register === "创建教师账户") {
        UserType = "teacher"
    } else {
        UserType = "student";
    }
    return UserType;
}

function sendEmail() {
    var opt = {
        email: $("#inputuserId").val(),
        userType: getUserType(),
    };
    if (!opt.email) {
        alert("请输入邮箱! ");
        return;
    }
    $.ajax({
        type: "post",
        url: "Index.aspx/SendEmail",
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(opt),
        success: function (result) {
            if (result.d === "success") {
                alert("发送成功");
            } else {
                alert("用户已存在")
            }
        },
        error: function (result) {
            alert("系统繁忙")
        }
    });
}

function toRegister() {
    var register = $("#register").val();
    var UserType = "";
    if (register === "创建教师账户") {
        UserType = "teacher"
    } else {
        UserType = "student";
    }

    var opt = {
        userId: $("#inputuserId").val(),
        Pwd: $("#inputuserPwd").val(),
        entryType: UserType,
        mailCode: $("#inputmail").val()
    };
    $.ajax({
        type: "post",
        url: "Index.aspx/ToRegister",
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(opt),
        success: function (result) {
            if (result.d === "success") {
                alert("成功注册新用户，请完善个人信息");
                if (opt.entryType === "teacher")
                    window.location.href = "PerfectTeachInfo.aspx";
                else
                    window.location.href = "PerfectStuInfo.aspx"
            } else if (result.d === "fail") {
                alert("注册失败，请重新注册")
            } else {
                alert("验证码有误，请重新确认")
            }
        },
        error: function (result) {
            alert("系统繁忙")
        }
    });
}

function login() {
    var opt = {
        userId: $("#txtUserId").val(),
        Pwd: $("#txtPwd").val(),
        entryType: $("input[name='usertype']:checked").next("label").text()
    };
    console.log(opt)
    $.ajax({
        type: "post",
        url: "Index.aspx/Login",
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(opt),
        success: function (result) {
            if (result.d === "success") {
                alert("登录成功");
                if (opt.entryType === "教师") {
                    window.location.href = "AllCourses.aspx"
                } else {
                    window.location.href = "StuHeader.aspx"
                }
            } else {
                alert("用戶名或密码错误")
            }
        },
        error: function (result) {
            alert("系统繁忙")
        }
    });
}

$(document).ready(function () {
    $("#loginInfo").show();
    $("#registerInfo").hide();
    document.getElementById("ShowLogin").style.borderBottom = '2px solid #3f9ae8';
});