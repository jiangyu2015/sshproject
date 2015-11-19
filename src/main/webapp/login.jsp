<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>登陆系统</title>
<link type="text/css" rel="stylesheet" href="css.css" />

</head>
<body scroll="no">
	<div class="my-form" id="loginForm">
		<form method="post" action="doLogin" target="_parent">
			<div class="my-form-head">
				<h1>Sign in</h1>
			</div>
			<div class="my-form-body">
				<label for="loginName">Username or Email</label> <input
					name="loginName" class="input-block" id="loginName" type="text" />
				<br> <label for="loginPwd">Password</label> <input
					name="loginPwd" class="input-block" type="password" /> <input
					class="button" type="submit" value="登陆" />
			</div>
		</form>
	</div>
</body>
</html>