<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/11/28
  Time: 14:41
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
    <title>出库明细信息</title>
    <link type="text/css" rel="stylesheet" href="../common.css" />
</head>

<body>
<div class="title">出库明细信息</div>
<table id="advSearch" class="table">
    <thead>
    <tr>
        <th>出库明细id</th>
        <th>商户名称</th>
        <th>商品名称</th>
        <th>仓库地点</th>
        <th>实际出库时间</th>
        <th>预期出库数量</th>
        <th>实际出库数量</th>
        <th>出库类型</th>
        <th>备注</th>
        <th>出库填写人</th>
        <th>预提单号</th>
        <th>出库类别</th>
        <th>出库状态</th>
    </tr>
    </thead>
    <tbody>
    <s:iterator value="%{#session.deliverlist}" var="deliver">
        <tr>
            <td><s:property value="#deliver.deliverId"/></td>
            <td><s:property value="#deliver.producer.producerName"/></td>
            <td><s:property value="#deliver.goods.goodsName"/></td>
            <td><s:property value="#deliver.place.placeName"/></td>
            <td><s:date format="yyyy-MM-dd" name="#deliver.deliverDate"/></td>
            <td><s:property value="#deliver.expecteNumber"/></td>
            <td><s:property value="#deliver.deliverNumber"/></td>
            <td><s:property value="#deliver.deliverType"/></td>
            <td><s:property value="#deliver.remark"/></td>
            <td><s:property value="#deliver.adduser"/></td>
            <td><s:property value="#deliver.withholding.withholdingId"/></td>
            <td><s:property value="#deliver.category"/></td>
            <td><s:property value="#deliver.state"/></td>
        </tr>
    </s:iterator>
    </tbody>
</table>
</body>
</html>