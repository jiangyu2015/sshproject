<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2016/1/22
  Time: 13:23
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
        function edit() {
            if ($(".active").length == 0) {
                alert('请选择要确认的行');
            } else {
                var $tds = $("tr.active").children();
                var $lines = $("#dialog_edit").find('form').children();
                for (var i = 0, len = $tds.length; i < len; i++) {
                    var $line = $lines.eq(i);
                    $line.find('input').val($tds.eq(i).text());

                }
                $("#dialog_edit").show();
            }
        }

        var _move = false;//移动标记
        var _x, _y;//鼠标离控件左上角的相对位置

        $(function () {
            $("tbody tr").bind('click', function () {
                $('table tr').removeClass('active');
                $(this).addClass('active');
            });
            var width = $(document).width();
            var height = $(document).height();
            $(".dialog-content .title").click(function () {
            }).mousedown(function (e) {
                _move = true;
                _x = e.pageX - parseInt($(".dialog-content").css("left"));
                _y = e.pageY - parseInt($(".dialog-content").css("top"));
            });
            $(document).mousemove(function (e) {
                if (_move) {
                    var x = e.pageX - _x;//移动时根据鼠标位置计算控件左上角的绝对位置
                    var y = e.pageY - _y;

                    if (x <= 0) {
                        x = 0;
                    } else if (x >= 0.2 * width) {
                        x = 0.2 * width;
                    }

                    if (y <= 0) {
                        y = 0;
                    } else if (y >= (0.2 * height)) {
                        y = 0.2 * height;
                    }

                    $(".dialog-content").css({top: y, left: x});//控件新位置
                }
            }).mouseup(function () {
                _move = false;
            });
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
        function check() {
            var storageDate = $("#storageDate").val();  //实际入库时间
            var expectedNumber = $("#expectedNumber").val(); //预期入库数
            var storageNumber = $("#storageNumber").val(); //实收数量    实收数量和预期入库数到时候再说
            var arr = getToDay().split("-");    //比较时间
            var today = new Date(arr[0], arr[1], arr[2]);  //今天
            var todays = today.getTime();
            var arrs = storageDate.split("-");
            var storageday = new Date(arrs[0], arrs[1], arrs[2]); //实际入库时间
            var storagedays = storageday.getTime();
            $(".input-div span").html("");
            $("#div_alert").html("");

            if (storageDate == null || storageDate.length == 0) {
                alert("请输入实际入库日期！");
                $("#div_storageDate").html("请输入实际入库日期！");
                return false;
            }
            if (storageNumber == null || storageNumber.length == 0) {
                alert("请输入实际入库数！");
                $("#div_storageNumber").html("请输入实际入库数！");
                return false;
            }
            if (storagedays > todays) {
                alert("确认收货不成功，实际入库时间不能比今天大");
                $("#div_alert").html("确认收货不成功，实际入库时间不能比今天大");
                return false;
            }
            else {
                $('#dialog_edit').hide();
                alert("确认收货成功");
                return true;
            }
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

        function selectCategory() {
            var type = $("#type").val();
            if (type == "入库类型") {
                window.location.href = "rkcheck.action";
            } else if (type == "正常调拨") {
                window.location.href = "zcdbstorage.action";
            }
            else if (type == "正常入库") {
                window.location.href = "zcrkstorage.action";
            }
        }
        function checkSelect() {
            var val = $("#goods").val();
            var val2 = $("#producer").val();
            var val3 = $("#place").val();
            var val4 = $("#category").val();
            var selectId = $("[value='" + val + "']").eq(0).attr('value');
            var selectId2 = $("[value='" + val2 + "']").eq(0).attr('id');
            var selectId3 = $("[value='" + val3 + "']").eq(0).attr('id');
            if (!val && !val2 && !val3&& !val4) {
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
    <div class="title">确认收货</div>
    <div class="btn-div">
        <input type="button" class="btn-eidt" value="确认收货" onclick="edit();" style="width: 90px;">
    </div>
    <div class="btn-div">
        <form method="post" action="rkCheckSelect.action" onsubmit="return checkSelect()" class="head-form">
            <div class="head-lable">商品名称：</div>
            <input id="goods" class="head-input" list="selectgoods" name="goodsName"/>
            <datalist id="selectgoods"></datalist>
            <div class="head-lable"> 商户名称：</div>
            <input id="producer" class="head-input" list="selectproducer" name="producerName" style="width: 10%;"/>
            <datalist id="selectproducer"></datalist>
            <div class="head-lable">入库地点：</div>
            <input id="place" class="head-input" list="selectplace" name="storagePlace"  style="width: 10%;"/>
            <datalist id="selectplace"></datalist>
            <div class="head-lable">入库类别：</div>
            <select id="category"class="head-input" name="category" style="width: 10%;"/>
            <option></option>
            <option value="正常入库">正常入库</option>
            <option value="正常调拨">正常调拨</option>
            </select>
            <input type="submit" class="btn-remove" value="查询" style="left: 20px;;">
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
            <th>
                <select id="type" style="background: none; border: none; -webkit-box-shadow: none; width: auto;
            			font-size: 14px; color: #4d4d4d; font-weight: bold;" onchange="selectCategory();">
                    <option>入库类型</option>
                    <option>正常入库</option>
                    <option>正常调拨</option>
                </select>
            </th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.storagelistcheck}" var="storage">
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

<div id="dialog_edit" class="dialog-div">
    <div class="dialog-masking"></div>
    <div class="dialog-content">
        <div class="title">确认收货</div>
        <div class="overflow-div">
            <div class="content">
                <form method="post" action="rkOk">
                    <div class="line">
                        <div class="lable">入库明细id：</div>
                        <div class="input-div"><input name="storage.storageId" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>

                    </div>
                    <div class="line">
                        <div class="lable">商户名称：</div>
                        <div class="input-div">
                            <input name="storage.producer.producerName" readonly="readonly"
                                   style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">商品id：</div>
                        <div class="input-div"><input name="storage.goods.goodsId" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">商品名称：</div>
                        <div class="input-div"><input name="storage.goods.goodsName" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">仓库名称：</div>
                        <div class="input-div"><input name="storage.place.placeName" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">商品生产日期：</div>
                        <div class="input-div"><input name="storage.goods.creationDate" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;" type="date"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">商品保质期：</div>
                        <div class="input-div"><input name="storage.goods.baozhiqi" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">商品截止日期：</div>
                        <div class="input-div"><input name="storage.goods.expirationDate" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;" type="date"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">预期入库时间：</div>
                        <div class="input-div"><input id="expectedDate" name="storage.expectedDate" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;" type="date"/></div>
                    </div>

                    <div class="line">
                        <div class="lable"><span>* </span>实际入库时间：</div>
                        <div class="input-div"><input id="storageDate" placeholder="请输入实际入库时间"
                                                      name="storage.storageDate" type="date"/> <span
                                id="div_storageDate"></span>
                        </div>
                    </div>

                    <div class="line">
                        <div class="lable">预期数量：</div>
                        <div class="input-div"><input id="expectedNumber" name="storage.expectedNumber"
                                                      readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable"><span>* </span>实收数量：</div>
                        <div class="input-div">
                            <input id="storageNumber" placeholder="请输入实收数量"
                                   name="storage.storageNumber" onkeyup="value=value.replace(/[^\d]/g,'')"
                                   onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                            <span id="div_storageNumber"></span></div>
                    </div>

                    <div class="line">
                        <div class="lable">入库类型：</div>
                        <div class="input-div"><input name="storage.storageType" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">备注：</div>
                        <div class="input-div"><input placeholder="请输入备注（可输入200个字符）" name="storage.remark" maxlength="200"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">入库状态：</div>
                        <div class="input-div"><input id="state" name="storage.state" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">申请人：</div>
                        <div class="input-div"><input name="storage.adduser" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">确认收货人：</div>
                        <div class="input-div"><input name="storage.checkuser" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">入库类别：</div>
                        <div class="input-div"><input readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <span id="div_alert"></span><br>
                    <div style="position: relative; bottom: 0px;">
                        <input type="submit" value="确认" class="btn-submit" onclick="return check();"/>
                        <input type="button" value="取消" class="btn-cancle" onclick="$('#dialog_edit').hide();"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>

