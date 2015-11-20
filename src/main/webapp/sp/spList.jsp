<%@ page language="java" contentType="text/html; charset=utf-8"
	import="java.sql.*,com.hibtest1.entity.*,java.util.*"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<s:iterator value="%{#session.goodslist}" var="goods">
	<div class="div1">
		<div class="divcss5">
			<s:property value="#goods.goodsName" />

			<s:property value="#goods.value" />
		</div>
	</div>
</s:iterator>

</body>
</html>