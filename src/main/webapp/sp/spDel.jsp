<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<s:form action="spDel" validate="true">
	<table id="advSearch" width="380" height="66">
		<div class="my-form-head">
			<h1>请输入需删除的商品名称</h1>
		</div>
		<tr>
			<td><s:textfield label="商品名称" name="goodsName" /></td>
		</tr>
		<tr>
			<td><s:submit align="left" value="删除" /></td>

		</tr>
	</table>

</s:form>


</body>
</html>