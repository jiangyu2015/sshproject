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
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>

    <script>
        $(function () {
            $.ajax({
                type: "post",
                url: "excuteAjaxJsonAction",
                success: function (data, xhrTxt) {
                    var str = "";
                    var d = eval("(" + data + ")");
                    var goods = d.goodsList;
                    console.log(goods);
                    for (var i = 0; i < goods.length; i++) {
                        str = str + "<option value='" + goods[i].goodsName + "|" + goods[i].goodsId + "'>";
                    }
                    $("#selectgoods").html(str);
                    $('#goods').bind('input propertychange', function () {
                        $("#selectgoods").html(str);
                    });
                },
                dataType: 'json'
            });
            $.ajax({
                type: "post",
                url: "selectProducerJsonAction",
                dataType: 'json',
                success: function (data, xhrTxt) {
                    var str = "";
                    var d = eval("(" + data + ")");
                    var producer = d.producerList;
                    console.log(producer);
                    for (var i = 0; i < producer.length; i++) {
                        str = str + "<option id='" + producer[i].producerId + "' value='" + producer[i].producerName + "'>";
                    }
                    $("#selectproducer").html(str);
                    $('#producer').bind('input propertychange', function () {
                        $("#selectproducer").html(str);
                    });
                },
                error: function () {
                    alert("未查到商户");
                    $("#div_item2").html("未查到商户");
                }//这里不要加","

            });
            $.ajax({
                type: "post",
                url: "excutePlaceAjaxJsonAction",
                success: function (data, xhrTxt) {
                    var str = "";
                    var d = eval("(" + data + ")");
                    var place = d.placeList;
                    console.log(place);
                    for (var i = 0; i < place.length; i++) {
                        str = str + "<option id='" + place[i].placeId + "' value='" + place[i].placeName + "'>";
                    }
                    $("#selectplace").html(str);
                    $('#place').bind('input propertychange', function () {
                        $("#selectplace").html(str);
                    });
                },
                dataType: 'json'
            });
        });
        function checkSelect() {
            var val = $("#goods").val();
            var val2 = $("#producer").val();
            var val3 = $("#place").val();
            var selectId = $("[value='" + val + "']").eq(0).attr('value');
            var selectId2 = $("[value='" + val2 + "']").eq(0).attr('id');
            var selectId3 = $("[value='" + val3 + "']").eq(0).attr('id');
            if (!val && !val2 && !val3) {
                alert("请输入至少一个查询选项");
                return false;
            }
            if (val != null && val != "") {
                if (selectId == undefined) {
                    alert("商品未建或未通过审核，输入商品后请选择选项框内带“|数字”的商品");
                    return false;
                }
            }
            if (val2 != null && val2 != "") {
                if (selectId2 == undefined) {
                    alert("商户未建或未通过审核，请选择选项框内的商户");
                    return false;
                }
            }
            if (val3 != null && val3 != "") {
                if (selectId3 == undefined) {
                    alert("仓库未建，请选择选项框内的仓库");
                    return false;
                }
            }
        }
    </script>
</head>

<body>
<div class="table-div">
    <div class="title">入库明细信息</div>
    <div class="btn-div">
    <form method="post" action="rkSelect.action" onsubmit="return checkSelect()" class="head-form">
        <div class="head-lable">商品名称：</div>
        <input id="goods" class="head-input" list="selectgoods" name="goodsName" onchange="getInfo()"/>
        <datalist id="selectgoods"></datalist>
        <div class="head-lable"> 商户名称：</div>
        <input id="producer" class="head-input" list="selectproducer" name="producerName"/>
        <datalist id="selectproducer"></datalist>
        <div class="head-lable">入库地点：</div>
        <input id="place" class="head-input" list="selectplace" name="storagePlace"/>
        <datalist id="selectplace"></datalist>
      <%--  <div class="head-lable">入库类别：</div>
        <input id="category" class="head-input" name="category"/>--%>
        <input type="submit" class="btn-remove head-btn-right" value="查询">
    </form>
    </div>
    <table id="advSearch" class="table">
        <thead>
        <tr>
            <th>入库明细id</th>
            <th>商户名称</th>
            <th>商品id</th>
            <th>商品名称</th>
            <th>仓库名称</th>

            <th>商品生产日期</th>
            <th>商品保质期</th>
            <th>商品截止日期</th>

            <th>预期入库时间</th>
            <th>实际入库时间</th>
            <th>预期数量</th>
            <th>实收数量</th>
            <th>入库类型</th>
            <th>备注</th>
            <th>入库状态</th>
            <th>申请人</th>
            <th>确认收货人</th>
            <th>入库类别</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.storagelist}" var="storage">
            <tr>
                <td><s:property value="#storage.storageId"/></td>
                <td><s:property value="#storage.producer.producerName"/></td>
                <td><s:property value="#storage.goods.goodsId"/></td>
                <td><s:property value="#storage.goods.goodsName"/></td>
                <td><s:property value="#storage.place.placeName"/></td>

                <td><s:date format="yyyy-MM-dd" name="#storage.goods.creationDate"/></td>
                <td><s:property value="#storage.goods.baozhiqi"/></td>
                <td><s:date format="yyyy-MM-dd" name="#storage.goods.expirationDate"/></td>

                <td><s:date format="yyyy-MM-dd" name="#storage.expectedDate"/></td>
                <td><s:date format="yyyy-MM-dd" name="#storage.storageDate"/></td>
                <td><s:property value="#storage.expectedNumber"/></td>
                <td><s:property value="#storage.storageNumber"/></td>
                <td><s:property value="#storage.storageType"/></td>
                <td><s:property value="#storage.remark"/></td>
                <td><s:property value="#storage.state"/></td>
                <td><s:property value="#storage.adduser"/></td>
                <td><s:property value="#storage.checkuser"/></td>
                <td><s:property value="#storage.category"/></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>

