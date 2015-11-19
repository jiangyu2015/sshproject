<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>register</title>
<link type="text/css" rel="stylesheet" href="css.css" />
</head>
<body>
<div class="my-form" id="loginForm">
	<s:actionerror/>
	<s:form action="reg" validate="true">
		<table id="advSearch" width="380" height="66">
		<div class="my-form-head">
				<h1>register</h1>
			</div>
			<tr>
				<td><s:textfield label="用户名" name="users.loginName" /></td>
			</tr>
			<tr>
				<td><s:password label="密码" name="users.loginPwd" /></td>
			</tr>
			<tr>
				<td><s:password label="确认密码" name="reloginPwd" /></td>
			</tr>		
			<tr>
				<td><s:submit align="left" value="确认" /></td>
				
			</tr>
		</table>

	</s:form>
	</div>
</body>
</html>