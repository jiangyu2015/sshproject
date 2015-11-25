<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/11/25
  Time: 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         import="java.sql.*,com.hibtest1.entity.*,java.util.*"
         pageEncoding="utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>商户信息</title>
    <link type="text/css" rel="stylesheet" href="../common.css" />
</head>

<body>
<div class="title">商户信息</div>
<table id="advSearch" class="table">
    <thead>
    <tr>
        <th>商户id</th>
        <th>商户名称</th>
        <th>商户地址</th>
        <th>联系人</th>
        <th>联系电话1</th>
        <th>联系电话2</th>
    </tr>
    </thead>
    <tbody>
    <s:iterator value="%{#session.producerlist}" var="producer">
        <tr>
            <td><s:property value="#producer.producerId"/></td>
            <td><s:property value="#producer.producerName"/></td>
            <td><s:property value="#producer.producerAddress"/></td>
            <td><s:property value="#producer.linkman"/></td>
            <td><s:property value="#producer.telOne"/></td>
            <td><s:property value="#producer.telTwo"/></td>
        </tr>
    </s:iterator>
    </tbody>
</table>
</body>
</html>