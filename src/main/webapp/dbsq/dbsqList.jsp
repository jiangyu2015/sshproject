<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/12/27
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>调拨申请信息</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>
</head>

<body>
<div class="table-div">
    <div class="title">调拨申请信息</div>
    <table id="advSearch" class="table">
        <thead>
        <tr>
            <th>商户名称</th>
            <th>商品id</th>
            <th>商品名称</th>
            <th>原仓库地点</th>
            <th>目标仓库地点</th>
            <th>调拨数</th>
            <th>使用类型</th>
            <th>申请时间</th>
            <th>申请人</th>
            <th>修改人</th>
            <th>处理状态</th>
            <th>审核时间</th>
            <th>审核人</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.allotapplist}" var="allotapp">
            <tr>
                <td><s:property value="#allotapp.producer.producerName"/></td>
                <td><s:property value="#allotapp.goods.goodsId"/></td>
                <td><s:property value="#allotapp.goods.goodsName"/></td>
                <td><s:property value="#allotapp.placeOut.placeName"/></td>
                <td><s:property value="#allotapp.placeIn.placeName"/></td>
                <td><s:property value="#allotapp.allotNumber"/></td>
                <td><s:property value="#allotapp.allotType"/></td>
                <td><s:date format="yyyy-MM-dd hh:mm:ss" name="#allotapp.applicationDate"/></td>
                <td><s:property value="#allotapp.adduser"/></td>
                <td><s:property value="#allotapp.edituser"/></td>
                <td><s:property value="#allotapp.state"/></td>
                <td><s:date format="yyyy-MM-dd hh:mm:ss" name="#allotapp.auditTime"/></td>
                <td><s:property value="#allotapp.checkuser"/></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>
</body>
</html>