<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/1/31
  Time: 13:34
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
    <title>添加其他出库信息</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                success: function () {
                    var producerName = decodeURI(GetQueryString("producerName"));
                    var goodsId = GetQueryString("goodsId");
                    var goodsName = decodeURI(GetQueryString("goodsName"));
                    var placeName = decodeURI(GetQueryString("placeName"));
                    var type = decodeURI(GetQueryString("type"));
                    $('#goodsId').val(goodsId);
                    $('#goodsName').val(goodsName);
                    $('#placeName').val(placeName);
                    $('#producerName').val(producerName);
                    $('#type').val(type);
                }
            });

        });
        function check(form) {
            var result;
            $.ajax({
                type: "post",
                async: false,
                url: "doWithholdingCheckJsonAction",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
                data: {//设置数据源
                    goodsId: $("#goodsId").val(),
                    placeId: GetQueryString("placeId"),
                    producerId: GetQueryString("producerId"),
                    witholdingNumber: $("#witholdingNumber").val(),
                    type: $("#type").val()
                },
                dataType: "json",//设置需要返回的数据类型
                success: function (data, xhrTxt) {
                    var d = eval("(" + data + ")");
                    var availableInventory = d.availableInventory;
                    var allotNumber = $("#allotNumber").val();
                    var placeName = $("#placeName").val();
                    var expectedDate = $("#expectDate").val();  //期望入库时间  比较时间
                    var arrs = expectedDate.split("-");
                    var storageday = new Date(arrs[0], arrs[1], arrs[2]); //
                    var storagedays = storageday.getTime();

                    var arr = getToDay().split("-");
                    var today = new Date(arr[0], arr[1], arr[2]);  //今天
                    var todays = today.getTime();
                    $(".input-div span").html("");
                    $("#div_alert").html("");
                     if (expectedDate == null || expectedDate == "") {
                        $("#div_expectDate").html("期望时间不能为空");
                        result = false;

                    }
                    else if (allotNumber == null || allotNumber == "") {
                        $("#div_allotNumber").html("出库数量不能为空");
                        result = false;
                    }
                    else if (allotNumber > availableInventory) {
                        alert("出库申请不成功，当前预提后可用库存为" + availableInventory + "或许有人比你提前操作预提了，请确认！");
                        $("#div_alert").html("当前预提后可用库存为" + availableInventory + "或许有人比你提前操作预提了，请确认！");
                        result = false;
                    }
                    else if (storagedays < todays) {
                        alert("期望调拨时间不能比今天小");
                        $("#div_expectDate").html("期望调拨时间不能比今天小");
                        result = false;
                    }
                    else {
                        alert("出库申请成功");
                        result = true;
                    }
                }
            });
            return result;
        }

        var newdate = null;
        function getToDay() {
            var date = new Date($.ajax({async: false}).getResponseHeader("Date"));
            var bombay = date + (3600000 * 8);
            var now = new Date(bombay);
            var nowYear = now.getFullYear();
            var nowMonth = now.getMonth();
            var nowDate = now.getDate();
            newdate = new Date(nowYear, nowMonth, nowDate);
            nowMonth = doHandleMonth(nowMonth + 1);
            nowDate = doHandleMonth(nowDate);
            return nowYear + "-" + nowMonth + "-" + nowDate;
        }

        function doHandleMonth(month) {
            if (month.toString().length == 1) {
                month = "0" + month;
            }
            return month;
        }

        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null)return unescape(r[2]);
            return null;
        }
    </script>
</head>
<body>
<div class="title">添加出库申请信息</div>
<div class="content">
    <form method="post" action="ckOtherAdd.action" onsubmit="return check(this)">
        <div class="line">
            <div class="lable">商户名称：</div>
            <div class="input-div"><input id="producerName" name="producerName" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable">商品id：</div>
            <div class="input-div"><input id="goodsId" name="goodsId" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable">商品名称：</div>
            <div class="input-div"><input id="goodsName" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable">仓库地址：</div>
            <div class="input-div"><input id="placeName" name="placeName" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable"><span>* </span>期望时间：</div>
            <div class="input-div"><input id="expectDate" placeholder="请输入期望调拨时间" name="deliver.expecteDate"
                                          type="date"/> <span id="div_expectDate"></span></div>
        </div>
        <div class="line">
            <div class="lable"><span>* </span>预期出库数量：</div>
            <div class="input-div">
                <input id="allotNumber" placeholder="请输入预期出库数量" name="deliver.expecteNumber"
                       onkeyup="value=value.replace(/[^\d]/g,'')"
                       onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                <span id="div_allotNumber"></span></div>
        </div>
        <div class="line">
            <div class="lable">使用类型：</div>
            <div class="input-div"><input id="type" name="deliver.deliverType" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable">备注：</div>
            <div class="input-div">
                <select name="deliver.remark">
                    <option value=""></option>
                    <option value="调账">调账</option>
                    <option value="转残次">转残次</option>
                </select>
            </div>
        </div>
        <span id="div_alert"></span><br>
        <input type="submit" value="提交" class="btn-submit"/>
    </form>
</div>
</body>
</html>

