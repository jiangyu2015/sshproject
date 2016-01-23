<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2016/1/22
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>预提信息</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>
</head>

<body>
<div class="table-div">
    <div class="title">所有预提信息</div>
    <table id="advSearch" class="table">
        <thead>
        <tr>
            <th>预提单id</th>
            <th>商品id</th>
            <th>商品名称</th>
            <th>仓库id</th>
            <th>入库地点</th>
            <th>使用原由</th>
            <th>活动id</th>
            <th>单位</th>
            <th>预提数</th>
            <th>预提时间</th>
            <th>截止时间</th>
            <th>入库类型</th>
            <th>预提人</th>

        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.withholdingdatelist}" var="withholding">
            <tr>
                <td><s:property value="#withholding.withholdingId"/></td>
                <td><s:property value="#withholding.goods.goodsId"/></td>
                <td><s:property value="#withholding.goods.goodsName"/></td>
                <td><s:property value="#withholding.place.placeId"/></td>
                <td><s:property value="#withholding.place.placeName"/></td>
                <td><s:property value="#withholding.events"/></td>
                <td><s:property value="#withholding.activityId"/></td>
                <td><s:property value="#withholding.unit"/></td>
                <td><s:property value="#withholding.witholdingNumber"/></td>
                <td><s:date format="yyyy-MM-dd" name="#withholding.witholdingDate"/></td>
                <td><s:date format="yyyy-MM-dd" name="#withholding.deteline"/></td>
                <td><s:property value="#withholding.useType"/></td>
                <td><s:property value="#withholding.adduser"/></td>

            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>


</body>
</html>

