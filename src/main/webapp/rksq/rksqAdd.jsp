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
    <title>添加入库申请信息</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript">
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
                        //         str = str + "<option id='" + goods[i].goodsId + "' value='" + goods[i].goodsName + "'>";
                        //   str = str + "<option value='" + goods[i].goodsName + "'>"+ goods[i].goodsId+"</option>";
                        str = str + "<option value='" + goods[i].goodsName + "|" + goods[i].goodsId + "'>";
                    }
                    $("#select").html(str);

                    $('#item').bind('input propertychange', function () {
                        $("#select").html(str);
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
                        //  str = str + "<option>" + producer[i].producerName + "</option>";
                        str = str + "<option id='" + producer[i].producerId + "' value='" + producer[i].producerName + "'>";
                    }
                    $("#select2").html(str);

                    $('#item2').bind('input propertychange', function () {
                        $("#select2").html(str);
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
//                    alert("ck");
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
        function getInfo() {
            var goodsName=$("#item").val();
            var  placeName=$("#item3").val();
            $('#address').val("");
            $('#receiver').val("");
            $('#tel').val("");
            $('#commodityRating').val("");
            $('#price').val("");
            $('#unit').val("");
            $('#creationDate').val("2010-01-01");
            $('#baozhiqi').val("");
            $('#expirationDate').val("");
            if(goodsName!=null && goodsName!="") {
                $.ajax({
                    url: "getInfoJsonAction",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
                    data: {//设置数据源
                        goodsName: encodeURI(encodeURI(goodsName))
                    },
                    dataType: "json",//设置需要返回的数据类型*/
                    success: function (data, xhrTxt) {
                        var str = "";
                        var d = eval("(" + data + ")");
                        var goods = d.goods;
                        var commodityRating = str + goods.commodityRating;
                        var price= str +goods.price;
                        var unit=str + goods.unit;
                        var creationDate= goods.creationDate;
                        var baozhiqi= str +goods.baozhiqi;
                        var expirationDate=goods.expirationDate;
                        $('#commodityRating').val(commodityRating);
                        $('#price').val(price);
                        $('#unit').val(unit);
                        $('#creationDate').val(creationDate);
                        $('#baozhiqi').val(baozhiqi);
                        $('#expirationDate').val(expirationDate);
                    },
                    error: function () {
                        alert("系统异常，请稍后重试！");
                    }//这里不要加","
                });
            }
            if(placeName!=null && placeName!="") {
                $.ajax({
                    url: "getInfoJsonAction",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
                    data: {//设置数据源
                        placeName: encodeURI(encodeURI(placeName))
                    },
                    dataType: "json",//设置需要返回的数据类型*/
                    success: function (data, xhrTxt) {
                        var str = "";
                        var d = eval("(" + data + ")");
                        var place = d.place;
                        var address = str + place.address;
                        var receiver = str + place.receiver;
                        var tel = str + place.tel;
                        $('#address').val(address);
                        $('#receiver').val(receiver);
                        $('#tel').val(tel);
                    },
                    error: function () {
                        alert("系统异常，请稍后重试！");
                    }//这里不要加","
                });
            }
        }

        function check(form) {
            var val = $("#item").val();
            var val2 = $("#item2").val();
            var val3 = $("#item3").val();

            var selectId = $("[value='" + val + "']").eq(0).attr('value');
            var selectId2 = $("[value='" + val2 + "']").eq(0).attr('value');
            var selectId3 = $("[value='" + val3 + "']").eq(0).attr('value');
            var expectedNumber = $('#expectedNumber').val();

            var expectedDate = $("#expectedDate").val();  //期望入库时间  比较时间
            var arrs = expectedDate.split("-");
            var storageday = new Date(arrs[0], arrs[1], arrs[2]); //
            var storagedays = storageday.getTime();

            var arr = getToDay().split("-");
            var today = new Date(arr[0], arr[1], arr[2]);  //今天
            var todays = today.getTime();

            $(".input-div span").html("");  //清空

            if (selectId2 == undefined) {
                alert("商户未录入或未被审核通过，请与管理员联系");
                $("#div_item2").html("商户未录入或未被审核通过，请与管理员联系");
                return false;
            }
            else if (selectId == undefined || val.indexOf("|") == -1) {
                alert("商品未录入或未被审核通过，请与管理员联系，并且请选择带|商品id的选项");
                $("#div_item").html("商品未录入或未被审核通过，请与管理员联系，并且请选择带|商品id的选项，请先确认商品id");
                return false;
            }
            else if (selectId3 == undefined) {
                alert("仓库未录入");
                $("#div_item3").html("仓库未录入");
                return false;
            }
            else if (expectedDate == null || expectedDate.length == 0) {
                alert("预期入库时间不能为空");
                $("#div_expectedDate").html("预期入库时间不能为空");
                return false;
            }
            else if (expectedNumber == null || expectedNumber.length == 0 || isNull(expectedNumber)) {
                alert("预期入库数量不能为空");
                $("#div_expectedNumber").html("预期入库数量不能为空");
                return false;
            }
            else if (expectedNumber <= 0) {
                alert("预期入库数量需大于0");
                $("#div_expectedNumber").html("预期入库数量需大于0");
                return false;
            }
            else if (storagedays < todays) {
                alert("期望入库时间不能比今天小");
                $("#div_expectedDate").html("期望入库时间不能比今天小");
                return false;
            }
            else {
                alert("入库申请成功！");
                return true;
            }
        }

        function isNull(str) {
            if (str == "") return true;
            var regu = "^[ ]+$";
            var re = new RegExp(regu);
            return re.test(str);
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
    </script>
</head>
<body>
<div class="title">添加入库申请信息</div>
<div class="content">
    <form method="post" action="rksqAdd" onsubmit="return check(this)">
        <div class="line">
            <div class="lable"><span>* </span>商户名称：</div>
            <div class="input-div"><input id="item2" list="select2" placeholder="请输入商户名称"
                                          name="storageApp.producerName"/> <span id="div_item2"></span></div>
            <datalist id="select2"></datalist>

        </div>

        <div class="line">
            <div class="lable"><span>* </span>商品名称：</div>
            <div class="input-div"><input id="item" list="select" placeholder="请输入商品名称"
                                          name="storageApp.goodsName" onchange="getInfo()"/> <span
                    id="div_item"></span></div>
            <datalist id="select"></datalist>


        </div>
        <div class="line">
            <div class="lable"><span>* </span>入库地点：</div>
            <div class="input-div"><input id="item3" list="select3" placeholder="请输入入库地点"
                                          name="storageApp.storagePlace" onchange="getInfo()"/><span
                    id="div_item3"></span></div>
            <datalist id="select3"></datalist>

        </div>
        <div class="line">
            <div class="lable">仓库地址：</div>
            <div class="input-div"><input id="address" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable">仓库负责人：</div>
            <div class="input-div"><input id="receiver" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable">仓库联系电话：</div>
            <div class="input-div"><input id="tel" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>

        <div class="line">
            <div class="lable">单位：</div>
            <div class="input-div"><input id="unit" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable">单价：</div>
            <div class="input-div"><input id="price" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable">商品评级：</div>
            <div class="input-div"><input id="commodityRating" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable">生产日期：</div>
            <div class="input-div"><input id="creationDate"  type="date" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable">保质期：</div>
            <div class="input-div"><input id="baozhiqi" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable">保质期截止日期：</div>
            <div class="input-div"><input id="expirationDate"  type="date" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>


        <div class="line">
            <div class="lable"><span>* </span>预期入库时间：</div>
            <div class="input-div"><input id="expectedDate" placeholder="请输入预期入库时间" name="storageApp.expectedDate"
                                          type="date"/> <span id="div_expectedDate"></span></div>
        </div>
        <div class="line">
            <div class="lable"><span>* </span>预期入库数量：</div>
            <div class="input-div"><input id="expectedNumber" placeholder="请输入预期入库数量" name="storageApp.expectedNumber"
                                          onkeyup="value=value.replace(/[^\d]/g,'')"
                                          onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/><span
                    id="div_expectedNumber"></span></div>
        </div>
        <div class="line">
            <div class="lable">三联单编号：</div>
            <div class="input-div"><input placeholder="请输入三联单编号" name="storageApp.sldId"/></div>
        </div>
        <div class="line">
            <div class="lable"><span>* </span>入库类型：</div>
            <div class="input-div">
                <select name="storageApp.storageType">
                    <option value="任意配置">任意配置</option>
                    <option value="一元购">一元购</option>
                    <option value="社区特卖">社区特卖</option>
                    <option value="物业礼包">物业礼包</option>
                    <option value="福利">福利</option>
                </select>
            </div>
        </div>


        <input type="submit" value="提交" class="btn-submit"/>
    </form>
</div>
</body>
</html>
