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
<form method="post" action="spUpd">
    <s:iterator value="%{#session.goods}" var="goods">

        <table id="advSearch" width="380" height="66">
            <div class="my-form-head">
                <h1>商品信息</h1>
            </div>
            <tr>
                <td><label>商品id</label></td>
                <td><s:property value="#goods.goodsId"/></td>
            </tr>
            <tr>
                <td><label>商品名称</label></td>
                <td><input type="text" name="goods.goodsName" placeholder="${goods.goodsName}"/></td>
                <td><s:property value="#goods.goodsName"/></td>
            </tr>
            <tr>
                <td><label>后台商品名称</label></td>
                <td><input type="text" name="goods.goodsBackName" placeholder="${goods.goodsBackName}"/></td>
                <td><s:property value="#goods.goodsBackName"/></td>
            </tr>
            <tr>
                <td><label>参考价值</label></td>
                <td><input type="text" name="goods.value" placeholder="${goods.value}"/></td>
                <td><s:property value="#goods.value"/></td>
            </tr>
            <tr>
                <td><label>单价</label></td>
                <td><input type="text" name="goods.price" placeholder="${goods.price}"/></td>
                <td><s:property value="#goods.price"/></td>
            </tr>
            <tr>
                <td><label>长cm</label></td>
                <td><input type="text" name="goods.length" placeholder="${goods.length}"/></td>
                <td><s:property value="#goods.length"/></td>
            </tr>
            <tr>
                <td><label>宽cm</label></td>
                <td><input type="text" name="goods.wide" placeholder="${goods.wide}"/></td>
                <td><s:property value="#goods.wide"/></td>
            </tr>
            <tr>
                <td><label>高cm</label></td>
                <td><input type="text" name="goods.tall" placeholder="${goods.tall}"/></td>
                <td><s:property value="#goods.tall"/></td>
            </tr>
            <tr>
                <td><label>毛重kg</label></td>
                <td><input type="text" name="goods.mweight" placeholder="${goods.mweight}"/></td>
                <td><s:property value="#goods.mweight"/></td>
            </tr>
            <tr>
                <td><label>体积m*m*m</label></td>
                <td><input type="text" name="goods.volume" placeholder="${goods.volume}"/></td>
                <td><s:property value="#goods.volume"/></td>
            </tr>
            <tr>
                <td><label>体积重量kg</label></td>
                <td><input type="text" name="goods.vweight" placeholder="${goods.vweight}"/></td>
                <td><s:property value="#goods.vweight"/></td>
            </tr>
            <tr>
                <td><label>装箱规格</label></td>
                <td><input type="text" name="goods.standard" placeholder="${goods.standard}"/></td>
                <td><s:property value="#goods.standard"/></td>
            </tr>
            <tr>
                <td><label>单位</label></td>
                <td><input type="text" name="goods.unit" placeholder="${goods.unit}"/></td>
                <td><s:property value="#goods.unit"/></td>
            </tr>
            <tr>
                <td><label>实物服务</label></td>
                <td><input type="text" name="goods.service" placeholder="${goods.service}"/></td>
                <td><s:property value="#goods.service"/></td>
            </tr>
            <tr>
                <td><label>生产日期</label></td>
                <td><input type="text" name="goods.creationDate" placeholder="${goods.creationDate}"/></td>
                <td><s:property value="#goods.creationDate"/></td>
            </tr>
            <tr>
                <td><label>保质期</label></td>
                <td><input type="text" name="goods.baozhiqi" placeholder="${goods.baozhiqi}"/></td>
                <td><s:property value="#goods.baozhiqi"/></td>
            </tr>
            <tr>
                <td><label>保质期截止日期</label></td>
                <td><input type="text" name="goods.expirationDate" placeholder="${goods.expirationDate}"/></td>
                <td><s:property value="#goods.expirationDate"/></td>
            </tr>
            <tr>
                <input type="submit" value="更新" class="btn-submit"/>
            </tr>
        </table>
    </s:iterator>
</form>

</body>
</html>