<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/12/26
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>添加调拨信息</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                success: function () {
                    var producerName = GetQueryString("producerName");
                    var goodsId = GetQueryString("goodsId");
                    var goodsName = GetQueryString("goodsName");
                    var placeName = GetQueryString("placeName");
                    var type = GetQueryString("type");
                    var availableInventory = GetQueryString("availableInventory");
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
                    placeId: $("#placeId").val(),
                    producerId: $("#producerId").val(),
                    witholdingNumber: $("#witholdingNumber").val(),
                    /*     type: $("#type").val(),*/
                    unit: $("#unit").val()
                },
                dataType: "json",//设置需要返回的数据类型
                success: function (data, xhrTxt) {
                    var str = "";
                    var d = eval("(" + data + ")");
                    var witholdingNumber = $("#witholdingNumber").val();
                    alert("预提数" + witholdingNumber);
                    var unit = $("#unit").val();
                    var goodsUnit = str + d.goodsUnit;  //商品入库单位
                    alert("后台单位" + goodsUnit);
                    var availableInventory = d.availableInventory;
                    var deteline = $('#deteline').val();
                    var arr = deteline.split("-");                    //比较时间
                    var overday = new Date(arr[0], arr[1], arr[2]);  //截止时间
                    var overdays = overday.getTime();
                    var arrs = getToDay().split("-");
                    var today = new Date(arrs[0], arrs[1], arrs[2]);
                    var todays = today.getTime();

                    if (witholdingNumber > availableInventory) {
                        alert("预提不成功，当前预提后可用库存为" + availableInventory + "或许有人比你提前预提了，请确认！");
                        result = false;
                    }
                    else if (goodsUnit != unit) {
                        alert("预提不成功，商品入库单位为" + goodsUnit + "，您预提的商品单位为" + unit + "，请确认！");
                        result = false;
                    }
                    else if (overdays < todays) {
                        alert("活动截止时间不能小于今天")
                        result = false;
                    }
                    else {
                        alert("预提成功");
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
<div class="title">添加调拨申请信息</div>
<div class="content">
    <form method="post" action="ytAdd" onsubmit="return check(this)">
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
            <div class="lable">目标仓库地址：</div>
            <div class="input-div"><input placeholder="请输入目标仓库地址" name="placeName2"/></div>
        </div>
        <div class="line">
            <div class="lable">调拨数量：</div>
            <div class="input-div"><input placeholder="请输入调拨数量" name="allot.allotNumber"/></div>
        </div>
        <div class="line">
            <div class="lable">使用类型：</div>
            <div class="input-div"><input id="type" name="allot.allotType"/></div>
        </div>
        <input type="submit" value="提交" class="btn-submit"/>
    </form>
</div>
</body>
</html>
