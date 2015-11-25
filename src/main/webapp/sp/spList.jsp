<%@ page language="java" contentType="text/html; charset=utf-8"
		 import="java.sql.*,com.hibtest1.entity.*,java.util.*"
		 pageEncoding="utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>商品信息</title>
    <link type="text/css" rel="stylesheet" href="../common.css" />
</head>

<body>
	<div class="title">商品信息</div>	
	<table id="advSearch" class="table">
		<thead>
			<tr>
	            <th>商品名称</th>
	            <th>后台商品名称</th>
	            <th>参考价值</th>
	            <th>单价</th>
	            <th>长cm</th>
	            <th>宽cm</th>
	            <th>高cm</th>
	            <th>毛重kg</th>
	            <th>体积m*m*m</th>
	            <th>体积重量kg</th>
	            <th>装箱规格</th>
	            <th>单位</th>
	            <th>实物服务</th>
	            <th>生产日期</th>
	            <th>保质期</th>
	            <th>保质期截止日期</th>
	        </tr>
        </thead>
        <tbody>
	       <s:iterator value="%{#session.goodslist}" var="goods">
		        <tr>
		            <td><s:property value="#goods.goodsName"/></td>
		            <td><s:property value="#goods.goodsBackName"/></td>
		            <td><s:property value="#goods.value"/></td>
		            <td><s:property value="#goods.price"/></td>
		            <td><s:property value="#goods.length"/></td>
		            <td><s:property value="#goods.wide"/></td>
		            <td><s:property value="#goods.tall"/></td>
		            <td><s:property value="#goods.mweight"/></td>
		            <td><s:property value="#goods.volume"/></td>
		            <td><s:property value="#goods.vweight"/></td>
		            <td><s:property value="#goods.standard"/></td>
		            <td><s:property value="#goods.unit"/></td>
		            <td><s:property value="#goods.service"/></td>
		            <td><s:property value="#goods.creationDate"/></td>
		            <td><s:property value="#goods.baozhiqi"/></td>
		            <td><s:property value="#goods.expirationDate"/></td>
		        </tr>
	        </s:iterator>
        </tbody>
	</table>
</body>
</html>