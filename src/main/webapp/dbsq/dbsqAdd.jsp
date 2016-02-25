<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/12/26
  Time: 16:19
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
    <title>添加调拨申请信息</title>
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
            $.ajax({
                type: "post",
                url: "excutePlaceAjaxJsonAction",
                success: function (data, xhrTxt) {
                    var str = "";
                    var d = eval("(" + data + ")");
                    var place = d.placeList;
                    for (var i = 0; i < place.length; i++) {
                        // str = str + "<option>" + place[i].placeName + "</option>";
                        str = str + "<option id='" + place[i].placeId + "' value='" + place[i].placeName + "'>";
                    }
                    $("#select3").html(str);

                    $('#item3').bind('input propertychange', function () {
                        $("#select3").html(str);
                    });
                },
                dataType: 'json'
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
                    /*  unit: $("#unit").val()*/
                },
                dataType: "json",//设置需要返回的数据类型
                success: function (data, xhrTxt) {
                    var d = eval("(" + data + ")");
                    var availableInventory = d.availableInventory;
                    var allotNumber = $("#allotNumber").val();
                    var placeName = $("#placeName").val();
                    var placeName2 = $("#item3").val();
                    var val3 = $("#item3").val();
                    var selectId3 = $("[value='" + val3 + "']").eq(0).attr('id');

                    var expectedDate = $("#expectDate").val();  //期望入库时间  比较时间
                    var arrs = expectedDate.split("-");
                    var storageday = new Date(arrs[0], arrs[1], arrs[2]); //
                    var storagedays = storageday.getTime();

                    var arr = getToDay().split("-");
                    var today = new Date(arr[0], arr[1], arr[2]);  //今天
                    var todays = today.getTime();
                    $(".input-div span").html("");
                    $("#div_alert").html("");
                    if (selectId3 == undefined) {
                        alert("调拨申请不成功,仓库未建，请选择选项框内的仓库");
                        $("#div_item3").html("仓库未建，请选择选项框内的仓库");
                        result = false;
                    }
                    else if (expectedDate == null || expectedDate == "") {
                        $("#div_expectDate").html("期望时间不能为空");
                        result = false;

                    }
                    else if (allotNumber == null || allotNumber == "") {
                        $("#div_allotNumber").html("调拨数量不能为空");
                        result = false;
                    }
                    else if (allotNumber > availableInventory) {
                        alert("调拨申请不成功，当前预提后可用库存为" + availableInventory + "或许有人比你提前操作预提了，请确认！");
                        $("#div_alert").html("当前预提后可用库存为" + availableInventory + "或许有人比你提前操作预提了，请确认！");
                        result = false;
                    }
                    else if (placeName == placeName2) {
                        alert("调拨申请不成功，目标仓库地址与原仓库地址相同！");
                        $("#div_alert").html("目标仓库地址与原仓库地址相同！");
                        result = false;
                    }
                    else if (storagedays < todays) {
                        alert("期望调拨时间不能比今天小");
                        $("#div_expectDate").html("期望调拨时间不能比今天小");
                        result = false;
                    }
                    else {
                        alert("调拨申请成功");
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
<div class="title">添加调拨申请信息</div>
<div class="content">
    <form method="post" action="dbAdd.action" onsubmit="return check(this)">
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
            <div class="lable">原仓库地址：</div>
            <div class="input-div"><input id="placeName" name="placeName" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable"><span>* </span>目标仓库地址：</div>
            <div class="input-div"><input id="item3" list="select3" placeholder="请输入目标仓库地址" name="placeName2"/> <span
                    id="div_item3"></span></div>
            <datalist id="select3"></datalist>

        </div>
        <div class="line">
            <div class="lable"><span>* </span>期望时间：</div>
            <div class="input-div"><input id="expectDate" placeholder="请输入期望调拨时间" name="allotApp.expectDate"
                                          type="date"/> <span id="div_expectDate"></span></div>
        </div>
        <div class="line">
            <div class="lable"><span>* </span>调拨数量：</div>
            <div class="input-div">
                <input id="allotNumber" placeholder="请输入调拨数量" name="allotApp.allotNumber"
                       onkeyup="value=value.replace(/[^\d]/g,'')"
                       onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                <span id="div_allotNumber"></span></div>
        </div>
        <div class="line">
            <div class="lable">使用类型：</div>
            <div class="input-div"><input id="type" name="allotApp.allotType" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <span id="div_alert"></span><br>
        <input type="submit" value="提交" class="btn-submit"/>
    </form>
</div>
</body>
</html>
