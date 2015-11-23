<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/11/23
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body >
<div class="my-form-head">
    <h1>商品信息</h1>
</div>
<table id="advSearch" width="900" height="66">
    <tr>
        <td><label>商品id</label></td>
        <td><label>商品名称</label></td>
        <td><label>后台商品名称</label></td>
        <td><label>参考价值</label></td>
        <td><label>单价</label></td>
        <td><label>长cm</label></td>
        <td><label>宽cm</label></td>
        <td><label>高cm</label></td>
        <td><label>毛重kg</label></td>
        <td><label>体积m*m*m</label></td>
        <td><label>体积重量kg</label></td>
        <td><label>装箱规格</label></td>
        <td><label>单位</label></td>
        <td><label>实物服务</label></td>
        <td><label>生产日期</label></td>
        <td><label>保质期</label></td>
        <td><label>保质期截止日期</label></td>
    </tr>
<s:iterator value="%{#session.goodslistall}" var="goods">
        <tr>
            <td><s:property value="#goods.goodsId"/></td>
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
    </table>
</s:iterator>

</body>
</html>
