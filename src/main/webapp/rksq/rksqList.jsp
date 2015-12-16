<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/11/26
  Time: 16:46
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
    <title>入库申请信息</title>
    <link type="text/css" rel="stylesheet" href="../common.css" />
</head>

<body>
<div class="title">入库申请信息</div>
<table id="advSearch" class="table">
    <thead>
    <tr>
        <th>入库申请id</th>
        <th>商户名称</th>
        <th>商品名称</th>
        <th>入库地点</th>
        <th>商品评级</th>
        <th>预期入库时间</th>
        <th>预期入库数量</th>
        <th>三联单编号</th>
        <th>入库类型</th>
        <th>申请时间</th>
        <th>处理状态</th>
    </tr>
    </thead>
    <tbody>
    <s:iterator value="%{#session.storageapplist}" var="storageapp">
        <tr>
            <td><s:property value="#storageapp.storageAppId"/></td>
            <td><s:property value="#storageapp.producerName"/></td>
            <td><s:property value="#storageapp.goodsName"/></td>
            <td><s:property value="#storageapp.storagePlace"/></td>
            <td><s:property value="#storageapp.commodityRating"/></td>
            <td><s:property value="#storageapp.expectedDate"/></td>
            <td><s:property value="#storageapp.expectedNumber"/></td>
            <td><s:property value="#storageapp.sldId"/></td>
            <td><s:property value="#storageapp.storageType"/></td>
            <td><s:date format="yyyy-MM-dd" name="#storageapp.applicationDate"/></td>
            <td><s:property value="#storageapp.state"/></td>
        </tr>
    </s:iterator>
    </tbody>
</table>
</body>
</html>