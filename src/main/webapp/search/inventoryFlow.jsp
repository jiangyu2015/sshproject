<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/12/6
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>
</head>
<body>
<%--<script>
    $.ajax({
        url: 'searchkcld',
        success: function () {

        }
    });
</script>--%>
<div class="table-div">
    <div class="title">库存仓库信息</div>
    <table id="advSearch" class="table">
        <thead>
        <tr>
            <th>id</th>
            <th>商品名称</th>
            <th>库存名称</th>
            <th>初次入库时间</th>
            <th>初次入库数量</th>
            <th>总入库数</th>
            <th>总出库数</th>
            <th>账面剩余库存数</th>
            <th>入库类型</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.inventoryflow}" var="inventoryflow">
            <tr>
                <td><s:property value="#inventoryflow.id"/></td>
                <td><s:property value="#inventoryflow.goodsName"/></td>
                <td><s:property value="#inventoryflow.placeName"/></td>
                <td><s:date format="yyyy-MM-dd" name="#inventoryflow.firstStorageTime"/></td>

                <td><s:property value="#inventoryflow.firstStorageNumber"/></td>
                <td><s:property value="#inventoryflow.totolStorage"/></td>
                <td><s:property value="#inventoryflow.totolDeliver"/></td>
                <td><s:property value="#inventoryflow.carryingExcessInventory"/></td>
                <td><s:property value="#inventoryflow.type"/></td>

            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>
</body>
</html>
