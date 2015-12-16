<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/12/10
  Time: 14:04
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
    <title>预提信息</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                url: "deliverSelectJsonAction",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
                data: {//设置数据源
                    id: GetQueryString("id")
                },
                dataType: "json",//设置需要返回的数据类型*/
                success: function (data, xhrTxt) {

                    var str = "";
                    var d = eval("(" + data + ")");
                    var goodsId = str + d.goodsId;
                    var goodsName = str + d.goodsName;
                    var placeId = str + d.placeId;
                    var placeName = str + d.placeName;
                    var producerId = str + d.producerId;
                    var producerName = str + d.producerName;
                    var type = str + d.type;
                    $('#goodsId').val(goodsId);
                    $('#goodsName').val(goodsName);
                    $('#placeId').val(placeId);
                    $('#placeName').val(placeName);
                    $('#producerId').val(producerId);
                    $('#producerName').val(producerName);
                    $('#type').val(type);
                },
                error: function () {
                    alert("系统异常，请稍后重试！");
                }//这里不要加","
            });
        });


        $(function () {
            $("tbody tr").bind('click', function () {
                $('table tr').removeClass('active');
                $(this).addClass('active');
            });
        });
        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null)return unescape(r[2]);
            return null;
        }

    </script>
</head>

<body>
<div class="title">预提信息</div>
<div class="btn-div">
    <input type="button" class="btn-eidt" value="预提消耗" onclick="doDeliver();">
</div>
<table id="advSearch" class="table">
    <thead>
    <tr>
        <th>预提单id</th>
        <th>商户id</th>
        <th>商户名称</th>
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
    </tr>
    </thead>
    <tbody>
    <s:iterator value="%{#session.withholdinglist}" var="withholding">
        <tr>
            <td><s:property value="#withholding.withholdingId"/></td>
            <td><s:property value="#withholding.producer.producerId"/></td>
            <td><s:property value="#withholding.producer.producerName"/></td>
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

        </tr>
    </s:iterator>
    </tbody>
</table>
<div class="title">该预提对应出库明细信息</div>
<table id="advSearch" class="table">
    <thead>
    <tr>
        <th>出库明细id</th>
        <th>商户id</th>
        <th>商户名称</th>
        <th>商品id</th>
        <th>商品名称</th>
        <th>仓库id</th>
        <th>仓库名称</th>
        <th>实际出库时间</th>
        <th>预期出库数量</th>
        <th>实际出库数量</th>
        <th>出库类型</th>
        <th>备注</th>
        <th>预提id</th>
    </tr>
    </thead>
    <tbody1>
        <s:iterator value="%{#session.deliverlist}" var="deliver">
            <tr>
                <td><s:property value="#deliver.deliverId"/></td>
                <td><s:property value="#deliver.producer.producerId"/></td>
                <td><s:property value="#deliver.producer.producerName"/></td>
                <td><s:property value="#deliver.goods.goodsId"/></td>
                <td><s:property value="#deliver.goods.goodsName"/></td>
                <td><s:property value="#deliver.place.placeId"/></td>
                <td><s:property value="#deliver.place.placeName"/></td>
                <td><s:date format="yyyy-MM-dd" name="#deliver.deliverDate"/></td>
                <td><s:property value="#deliver.expecteNumber"/></td>
                <td><s:property value="#deliver.deliverNumber"/></td>
                <td><s:property value="#deliver.deliverType"/></td>
                <td><s:property value="#deliver.remark"/></td>
                <td><s:property value="#deliver.withholding.withholdingId"/></td>
            </tr>
        </s:iterator>
    </tbody1>
</table>
</body>
</html>
