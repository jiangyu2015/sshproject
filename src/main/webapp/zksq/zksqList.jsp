<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/12/27
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>转库申请信息</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>
</head>

<body>
<div class="table-div">
    <div class="title">转库申请信息</div>
    <table id="advSearch" class="table">
        <thead>
        <tr>
            <th>商户名称</th>
            <th>商品id</th>
            <th>商品名称</th>
            <th>仓库地点</th>
            <th>转库数</th>
            <th>原使用类型</th>
            <th>目标使用类型</th>
            <th>申请时间</th>
            <th>申请人</th>
            <th>修改人</th>
            <th>处理状态</th>
            <th>审核时间</th>
            <th>审核人</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.transferapplist}" var="transferapp">
            <tr>
                <td><s:property value="#transferapp.producer.producerName"/></td>
                <td><s:property value="#transferapp.goods.goodsId"/></td>
                <td><s:property value="#transferapp.goods.goodsName"/></td>
                <td><s:property value="#transferapp.place.placeName"/></td>
                <td><s:property value="#transferapp.transferNumber"/></td>
                <td><s:property value="#transferapp.typeOut"/></td>
                <td><s:property value="#transferapp.typeIn"/></td>
                <td><s:date format="yyyy-MM-dd hh:mm:ss" name="#transferapp.applicationDate"/></td>
                <td><s:property value="#transferapp.adduser"/></td>
                <td><s:property value="#transferapp.edituser"/></td>
                <td><s:property value="#transferapp.state"/></td>
                <td><s:date format="yyyy-MM-dd hh:mm:ss" name="#transferapp.auditTime"/></td>
                <td><s:property value="#transferapp.checkuser"/></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>
</body>
</html>
