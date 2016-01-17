<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/12/27
  Time: 20:47
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
    <title>添加转库申请信息</title>
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
                    /*    var producerId = GetQueryString("producerId");
                     var placeId = GetQueryString("placeId");*/
                    $('#goodsId').val(goodsId);
                    $('#goodsName').val(goodsName);
                    $('#placeName').val(placeName);
                    $('#producerName').val(producerName);
                    $('#typeOut').val(type);
                }
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
                    type: $("#typeOut").val()
                    /*  unit: $("#unit").val()*/
                },
                dataType: "json",//设置需要返回的数据类型
                success: function (data, xhrTxt) {
                    var d = eval("(" + data + ")");
                    var availableInventory = d.availableInventory;
                    var transferNumber = $("#transferNumber").val();

                    var typeOut = $("#typeOut").val();
                    var typeIn = $("#typeIn").val();

                    var expectDate = $("#expectDate").val();  //期望入库时间  比较时间
                    var arrs = expectDate.split("-");
                    var storageday = new Date(arrs[0], arrs[1], arrs[2]); //
                    var storagedays = storageday.getTime();

                    var arr = getToDay().split("-");
                    var today = new Date(arr[0], arr[1], arr[2]);  //今天
                    var todays = today.getTime();
                    $(".input-div span").html("");
                    $("#div_alert").html("");
                    if (transferNumber == null || transferNumber == "") {
                        alert("转库数量不能为空");
                        $("#div_transferNumber").html("转库数量不能为空");
                        result = false;
                    }
                    else if (expectDate == null || expectDate == "") {
                        alert("期望时间不能为空");
                        $("#div_expectDate").html("期望时间不能为空");
                        result = false;

                    }
                    else if (transferNumber > availableInventory) {
                        alert("转库申请不成功，当前预提后可用库存为" + availableInventory + "或许有人比你提前操作预提了，请确认！");
                        $("#div_alert").html("转库申请不成功，当前预提后可用库存为" + availableInventory + "或许有人比你提前操作预提了，请确认！");
                        result = false;
                    }
                    else if (typeIn == typeOut) {
                        alert("转库申请不成功，目标使用类型与原先一样！");
                        $("#div_alert").html("目标使用类型与原先一样！");
                        result = false;
                    }
                    else if (storagedays < todays) {
                        alert("期望转库时间不能比今天小");
                        $("#div_alert").html("期望转库时间不能比今天小");
                        result = false;
                    }
                    else {
                        alert("转库申请成功");
                        result = true;
                    }
                }
            });
            return result;
        }

        var newdate = null;
        function getToDay() {   //获取今天的日子
            var now = new Date();
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
<div class="title">添加转库申请信息</div>
<div class="content">
    <form method="post" action="zkAdd" onsubmit="return check(this)">
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
            <div class="lable"><span>* </span>转库数量：</div>
            <div class="input-div">
                <input id="transferNumber" placeholder="请输入转库数量"
                       name="transferApp.transferNumber" onkeyup="value=value.replace(/[^\d]/g,'')"
                       onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                <span id="div_transferNumber"></span>
            </div>
        </div>
        <div class="line">
            <div class="lable">原使用类型：</div>
            <div class="input-div"><input id="typeOut" name="transferApp.typeOut" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable">目标使用类型：</div>
            <div class="input-div">
                <select id="typeIn" name="transferApp.typeIn">
                    <option value="任意配置">任意配置</option>
                    <option value="一元购">一元购</option>
                    <option value="社区特卖">社区特卖</option>
                    <option value="物业礼包">物业礼包</option>
                    <option value="福利">福利</option>
                </select>
            </div>
        </div>
        <div class="line">
            <div class="lable"><span>* </span>期望时间：</div>
            <div class="input-div"><input id="expectDate"  name="transferApp.expectDate"
                                          type="date"/><span id="div_expectDate"></span></div>
        </div>
        <span id="div_alert"></span><br>
        <input type="submit" value="提交" class="btn-submit"/>
    </form>
</div>
</body>
</html>
