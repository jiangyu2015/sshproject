<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加商品</title>
</head>
<body>
  <s:form action="addGoods" validate="true">
		<table id="advSearch" width="500" height="66">
		
				<h1>添加商品</h1>
			</div>
			<tr>
				<td><s:textfield label="商品名称" name="goods.goodsName" /></td>
			</tr>
			<tr>
				<td><s:textfield label="商品后台名称" name="goods.goodsBackName" /></td>
			</tr>
			<tr>
				<td><s:textfield label="参考价值" name="goods.value" /></td>
			</tr>
			<tr>
				<td><s:textfield label="单价" name="goods.price" /></td>
			</tr>
			<tr>
				<td><s:textfield label="长" name="goods.length" /></td>
			</tr>
			<tr>
				<td><s:textfield label="宽" name="goods.wide" /></td>
			</tr>
			<tr>
				<td><s:textfield label="高" name="goods.tall" /></td>
			</tr>
			<tr>
				<td><s:textfield label="毛重" name="goods.mweight" /></td>
			</tr>
			<tr>
				<td><s:textfield label="体积" name="goods.volume" /></td>
			</tr>
			<tr>
				<td><s:textfield label="体积重量" name="goods.vweight" /></td>
			</tr>
			<tr>
				<td><s:textfield label="装箱规格" name="goods.standard" /></td>
			</tr>
			<tr>
				<td><s:textfield label="单位" name="goods.unit" /></td>
			</tr>
			<tr>
				<td><s:textfield label="实物服务" name="goods.service" /></td>
			</tr>

			<tr>
				<td><s:textfield label="生产日期" name="goods.creationDate" /></td>
			</tr>
			<tr>
				<td><s:textfield label="保质期" name="goods.baozhiqi" /></td>
			</tr>
			<tr>
				<td><s:textfield label="保质期截止日期" name="goods.expirationDate" /></td>
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