<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/11/27
  Time: 14:17
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
        <th>入库明细id</th>
        <th>商户id</th>
        <th>商品id</th>
        <th>仓库id</th>
        <th>预期入库时间</th>
        <th>实际入库时间</th>
        <th>预期数量</th>
        <th>实收数量</th>
        <th>入库类型</th>
        <th>备注</th>
        <th>入库状态</th>
    </tr>
    </thead>
    <tbody>
    <s:iterator value="%{#session.storagelist}" var="storage">
        <tr>
            <td><s:property value="#storage.storageId"/></td>
            <td><s:property value="#storage.producerId"/></td>
            <td><s:property value="#storage.goodsId"/></td>
            <td><s:property value="#storage.placeId"/></td>
            <td><s:date format="yyyy-MM-dd" name="#storage.expectedDate"/></td>
            <td><s:date format="yyyy-MM-dd" name="#storage.storageDate"/></td>
            <td><s:property value="#storage.expectedNumber"/></td>
            <td><s:property value="#storage.storageNumber"/></td>
            <td><s:property value="#storage.storageType"/></td>
            <td><s:property value="#storage.remark"/></td>
            <td><s:property value="#storage.state"/></td>
        </tr>
    </s:iterator>
    </tbody>
</table>
</body>
</html>