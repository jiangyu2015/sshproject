<%@ page language="java" contentType="text/html; charset=UTF-8"
         import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>登陆系统</title>
    <link type="text/css" rel="stylesheet" href="css.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>
    <style type="text/css">
        span {
            color: red
        }
    </style>
    <script type="text/javascript">
        function check(form) {
            var loginName = $('#loginName').val();
            var loginPwd = $('#loginPwd').val();
            if (loginName == "") {
                document.getElementById("div_loginName").innerHTML = "请输入用户名!";
                return false;
            }
            if (loginPwd == "") {
                document.getElementById("div_loginPwd").innerHTML = "请输入密码!";
                return false;
            }
        }
    </script>
</head>
<body scroll="no">
<div class="my-form" id="loginForm">
    <form method="post" action="doLogin" target="_parent" onsubmit="return check(this)">
        <div class="my-form-head">
            <h1>Sign in</h1>
        </div>
        <div class="my-form-body">
            <label for="loginName">Username or Email</label>
            <input name="loginName" class="input-block" id="loginName" type="text"/>&nbsp;<span
                id="div_loginName"></span>
            <br> <label for="loginPwd">Password</label>
            <input id="loginPwd" name="loginPwd" class="input-block" type="password"/>&nbsp;<span
                id="div_loginPwd"></span>
            </br>
            <input class="button" type="submit" value="登陆"/>
        </div>
    </form>
</div>
</body>
</html>