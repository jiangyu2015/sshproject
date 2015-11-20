<%@ page language="java" contentType="text/html; charset=utf-8"
         import="java.sql.*,com.hibtest1.entity.*,java.util.*"
         pageEncoding="utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
</head>
<body>
<s:iterator value="%{#session.goodslist}" var="goods">

    <table id="advSearch" width="380" height="66">
        <div class="my-form-head">
            <h1>商品信息</h1>
        </div>
        <tr>
            <td><label>商品名称</label></td>
            <td><s:property value="#goods.goodsName"/></td>
        </tr>
        <tr>
            <td><label>后台商品名称</label></td>
            <td><s:property value="#goods.goodsBackName"/></td>
        </tr>
        <tr>
            <td><label>参考价值</label></td>
            <td><s:property value="#goods.value"/></td>
        </tr>
        <tr>
            <td><label>单价</label></td>
            <td><s:property value="#goods.price"/></td>
        </tr>
        <tr>
            <td><label>长cm</label></td>
            <td><s:property value="#goods.length"/></td>
        </tr>
        <tr>
            <td><label>宽cm</label></td>
            <td><s:property value="#goods.wide"/></td>
        </tr>
        <tr>
            <td><label>高cm</label></td>
            <td><s:property value="#goods.tall"/></td>
        </tr>
        <tr>
            <td><label>毛重kg</label></td>
            <td><s:property value="#goods.mweight"/></td>
        </tr>
        <tr>
            <td><label>体积m*m*m</label></td>
            <td><s:property value="#goods.volume"/></td>
        </tr>
        <tr>
            <td><label>体积重量kg</label></td>
            <td><s:property value="#goods.vweight"/></td>
        </tr>
        <tr>
            <td><label>装箱规格</label></td>
            <td><s:property value="#goods.standard"/></td>
        </tr>
        <tr>
            <td><label>单位</label></td>
            <td><s:property value="#goods.unit"/></td>
        </tr>
        <tr>
            <td><label>实物服务</label></td>
            <td><s:property value="#goods.service"/></td>
        </tr>
        <tr>
            <td><label>生产日期</label></td>
            <td><s:property value="#goods.creationDate"/></td>
        </tr>
        <tr>
            <td><label>保质期</label></td>
            <td><s:property value="#goods.baozhiqi"/></td>
        </tr>
        <tr>
            <td><label>保质期截止日期</label></td>
            <td><s:property value="#goods.expirationDate"/></td>
        </tr>


    </table>
</s:iterator>

</body>
</html>