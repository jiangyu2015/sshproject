<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/12/9
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/11/26
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>添加预提信息</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {

            $.ajax({
                url: "doWithholdingJsonAction",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
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
        function check(form) {
            var result;
            $.ajax({
                type: "post",
                async: false,
                url: "doWithholdingCheckJsonAction",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
                data: {//设置数据源
                    goodsId: $("#goodsId").val(),
                    placeId: $("#placeId").val(),
                    producerId: $("#producerId").val()
                    /*  witholdingNumber: $("#witholdingNumber").val(),*/
                    /*     type: $("#type").val(),*/
                    /*   unit: $("#unit").val()  这个恢复上面的加逗号*/
                },
                dataType: "json",//设置需要返回的数据类型
                success: function (data, xhrTxt) {
                    var str = "";
                    var d = eval("(" + data + ")");
                    var witholdingNumber = $("#witholdingNumber").val();
                    /*    alert("预提数" + witholdingNumber);*/
                    var unit = $("#unit").val();
                    var goodsUnit = str + d.goodsUnit;  //商品入库单位
                    /*    alert("后台单位" + goodsUnit);*/
                    var availableInventory = d.availableInventory;
                    var deteline = $('#deteline').val();
                    var arr = deteline.split("-");                    //比较时间
                    var overday = new Date(arr[0], arr[1], arr[2]);  //截止时间
                    var overdays = overday.getTime();
                    var arrs = getToDay().split("-");
                    var today = new Date(arrs[0], arrs[1], arrs[2]);
                    var todays = today.getTime();
                    $(".input-div span").html("");
                    $("#div_alert").html("");
                    if (unit == null || unit.length == 0) {
                        $("#div_unit").html("请输入预提单位");
                        result = false;
                    }
                    else if (witholdingNumber == null || witholdingNumber.length == 0) {
                        $("#div_witholdingNumber").html("请输入预提数");
                        witholdingNumber = 0;
                        result = false;
                    }
                    else if (deteline == null || deteline.length == 0) {
                        $("#div_deteline").html("请输入截止日期");
                        result = false;
                    }
                    else if (witholdingNumber > availableInventory) {
                        alert("预提不成功，当前预提后可用库存为" + availableInventory + "或许有人比你提前预提了，请确认！");
                        $("#div_witholdingNumber").html("当前预提后可用库存为" + availableInventory + "或许有人比你提前预提了，请确认！");
                        result = false;
                    }
                    else if (goodsUnit != unit) {
                        alert("预提不成功，商品入库单位为" + goodsUnit + "，您预提的商品单位为" + unit + "，请确认！");
                        $("#div_unit").html("商品入库单位为" + goodsUnit + "，您预提的商品单位为" + unit + "，请确认！");
                        result = false;
                    }
                    else if (overdays < todays) {
                        alert("活动截止时间不能小于今天");
                        $("#div_deteline").html("活动截止时间不能小于今天");
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
<div class="title">添加预提申请信息</div>
<div class="content">
    <form method="post" action="ytAdd" onsubmit="return check(this)">
        <div class="line">
            <div class="lable">商户id：</div>
            <div class="input-div"><input id="producerId" name="producerId" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable">商户名称：</div>
            <div class="input-div"><input id="producerName" readonly="readonly"
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
            <div class="lable">仓库id：</div>
            <div class="input-div"><input id="placeId" name="placeId" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable">仓库地址：</div>
            <div class="input-div"><input id="placeName" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable">使用原由：</div>
            <div class="input-div"><input name="withholding.events" placeholder="请输入预提出库事件原由"/></div>
        </div>
        <div class="line">
            <div class="lable">活动id：</div>
            <div class="input-div"><input name="withholding.activityId" placeholder="如该活动有id请输入"/></div>
        </div>
        <div class="line">
            <div class="lable"><span>* </span>单位：</div>
            <div class="input-div"><input id="unit" name="withholding.unit" placeholder="请确认预提商品单位，如不一致会失败"/>
                <span id="div_unit"></span></div>
        </div>
        <div class="line">
            <div class="lable"><span>* </span>预提数：</div>
            <div class="input-div"><input id="witholdingNumber" input name="withholding.witholdingNumber"
                                          placeholder="请输入预提数" onkeyup="value=value.replace(/[^\d]/g,'')"
                                          onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/><span
                    id="div_witholdingNumber"></span></div>
        </div>
        <div class="line">
            <div class="lable"><span>* </span>截止日期：</div>
            <div class="input-div"><input id="deteline" name="withholding.deteline" placeholder="请输入截止日期"
                                          type="date"/><span id="div_deteline"></span>
            </div>
        </div>
        <div class="line">
            <div class="lable">使用类型：</div>
            <div class="input-div"><input id="type" name="withholding.useType" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <span id="div_alert"></span><br>
        <input type="submit" value="提交" class="btn-submit"/>
    </form>
</div>
</body>
</html>
