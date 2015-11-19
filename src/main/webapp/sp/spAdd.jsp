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
  <s:form action="addGoods" validate="true">
		<table id="advSearch" width="380" height="66">
		
				<h1>添加商品</h1>
			</div>
			<tr>
				<td><s:textfield label="商品名称" name="goods.goodsName" /></td>
			</tr>
			<tr>
				<td><s:password label="商品后台名称" name="goods。goodsBackName" /></td>
			</tr>
			<tr>
				<td><s:password label="参考价值" name="goods.value" /></td>
			</tr>		
			<tr>
				<td><s:submit align="left" value="submit" /></td>
				
			</tr>
			<tr>
				<td></td>
				<td>${requestScope.yesWords}</td>
			</tr>
			<tr>
				<td></td>
				<td>${requestScope.noWords}</td>
			</tr>
		</table>

	</s:form>
</body>
</html>