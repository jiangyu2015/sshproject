<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/11/26
  Time: 16:46
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
                alert('请选择要修改的行');
            } else {
                var $tds = $("tr.active").children();
                var $lines = $("#dialog_edit").find('form').children();
                for (var i = 0, len = $tds.length; i < len; i++) {
                    var $line = $lines.eq(i);
                    if (i == 9) {
                        $('#typeIn option[value="' + $tds.eq(i).text() + '"]').prop('selected', true);
                    } else {
                        $line.find('input').val($tds.eq(i).text());
                    }
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
                    $("#select2").html(str);
                    $("#selectproducer").html(str);
                    $('#item2').bind('input propertychange', function () {
                        $("#select2").html(str);
                    });
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
                    $("#select3").html(str);
                    $("#selectplace").html(str);
                    $('#item3').bind('input propertychange', function () {
                        $("#select3").html(str);
                    });
                    $('#place').bind('input propertychange', function () {
                        $("#selectplace").html(str);
                    });
                },
                dataType: 'json'
            });
        });

        function check() {
            var val = $("#state").val();
            var val2 = $("#item2").val();
            var val3 = $("#item3").val();
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

            if (val == "yesok" || val == "yesno") {
                alert("该入库申请已审核不能修改");
                return false;
            }
            else if (selectId2 == undefined) {
                alert("商户未录入或未被审核通过，请与管理员联系");
                $("#div_item2").html("商户未录入或未被审核通过，请与管理员联系");
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
                alert("修改成功！");
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

        function checkSelect() {
            var val = $("#goods").val();
            var val2 = $("#producer").val();
            var val3 = $("#place").val();
            if (!val && !val2 && !val3) {
                alert("请输入至少一个查询选项");
                return false;
            }
            if (val != null && val != "") {
                if (val.indexOf("|") != -1) {
                    var strs = val.split("|");
                    if (strs[1] == "") {
                        alert("输入有误，输入商品后请选择选项框内带“|数字”的商品");
                        return false;
                    }
                }
            }
        }
    </script>
</head>

<body>
<div class="table-div">
    <div class="title">入库申请信息</div>
    <div class="btn-div">
        <input type="button" class="btn-eidt" value="修改" onclick="edit();">
        <form method="post" action="rksqSelect.action" onsubmit="return checkSelect()" class="head-form">
            <div class="head-lable">商品名称：</div>
            <input id="goods" class="head-input" list="selectgoods" name="goodsName" onchange="getInfo()"/>
            <datalist id="selectgoods"></datalist>
            <div class="head-lable"> 商户名称：</div>
            <input id="producer" class="head-input" list="selectproducer" name="producerName"/>
            <datalist id="selectproducer"></datalist>
            <div class="head-lable">入库地点：</div>
            <input id="place" class="head-input" list="selectplace" name="storagePlace"/>
            <datalist id="selectplace"></datalist>
            <input type="submit" class="btn-remove head-btn-right" value="查询">
        </form>
    </div>
    <table id="advSearch" class="table">
        <thead>
        <tr>
            <th>入库申请id</th>
            <th>商户名称</th>
            <th>商品id</th>
            <th>商品名称</th>
            <th>入库地点</th>
            <th>商品评级</th>
            <th>预期入库时间</th>
            <th>预期入库数量</th>
            <th>三联单编号</th>
            <th>入库类型</th>
            <th>申请时间</th>
            <th>处理状态</th>
            <th>审核时间</th>
            <th>新建人</th>
            <th>修改人</th>
            <th>审核人</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.storageapplist}" var="storageapp">
            <tr>
                <td><s:property value="#storageapp.storageAppId"/></td>
                <td><s:property value="#storageapp.producer.producerName"/></td>
                <td><s:property value="#storageapp.goods.goodsId"/></td>
                <td><s:property value="#storageapp.goods.goodsName"/></td>
                <td><s:property value="#storageapp.place.placeName"/></td>
                <td><s:property value="#storageapp.goods.commodityRating"/></td>
                <td><s:date format="yyyy-MM-dd" name="#storageapp.expectedDate"/></td>
                <td><s:property value="#storageapp.expectedNumber"/></td>
                <td><s:property value="#storageapp.sldId"/></td>
                <td><s:property value="#storageapp.storageType"/></td>
                <td><s:date format="yyyy-MM-dd" name="#storageapp.applicationDate"/></td>
                <td><s:property value="#storageapp.state"/></td>
                <td><s:date format="yyyy-MM-dd HH:mm:ss" name="#storageapp.auditTime"/></td>
                <td><s:property value="#storageapp.adduser"/></td>
                <td><s:property value="#storageapp.edituser"/></td>
                <td><s:property value="#storageapp.checkuser"/></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>

<div id="dialog_edit" class="dialog-div">
    <div class="dialog-masking"></div>
    <div class="dialog-content">
        <div class="title">修改入库申请</div>
        <div class="overflow-div">
            <div class="content">
                <form method="post" action="editrksq">
                    <div class="line">
                        <div class="lable">入库申请id：</div>
                        <div class="input-div"><input name="storageApp.storageAppId" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable"><span>* </span>商户名称：</div>
                        <div class="input-div"><input id="item2" list="select2" placeholder="请输入商户名称"
                                                      name="storageApp.producerName"/> <span id="div_item2"></span>
                        </div>
                        <datalist id="select2"></datalist>
                    </div>
                    <div class="line">
                        <div class="lable">商品id：</div>
                        <div class="input-div"><input readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">商品名称：</div>
                        <div class="input-div"><input name="storageApp.goodsName" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable"><span>* </span>入库地点：</div>
                        <div class="input-div"><input id="item3" list="select3" placeholder="请输入目标仓库地址"
                                                      name="storageApp.storagePlace"/><span id="div_item3"></span></div>
                        <datalist id="select3"></datalist>
                    </div>

                    <div class="line">
                        <div class="lable">商品评级：</div>
                        <div class="input-div"><input readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable"><span>* </span>预期入库时间：</div>
                        <div class="input-div"><input id="expectedDate" placeholder="请输入预期入库时间"
                                                      name="storageApp.expectedDate"
                                                      type="date"/> <span id="div_expectedDate"></span></div>
                    </div>
                    <div class="line">
                        <div class="lable"><span>* </span>预期入库数量：</div>
                        <div class="input-div"><input id="expectedNumber" placeholder="请输入预期入库数量"
                                                      name="storageApp.expectedNumber"/><span
                                id="div_expectedNumber"></span></div>
                    </div>
                    <div class="line">
                        <div class="lable">三联单编号：</div>
                        <div class="input-div"><input placeholder="请输入三联单编号" name="storageApp.sldId"/></div>
                    </div>
                    <div class="line">
                        <div class="lable"><span>* </span>入库类型：</div>
                        <div class="input-div">
                            <select id="typeIn" name="storageApp.storageType">
                                <option value="任意配置">任意配置</option>
                                <option value="一元购">一元购</option>
                                <option value="社区特卖">社区特卖</option>
                                <option value="物业礼包">物业礼包</option>
                                <option value="福利">福利</option>
                            </select>
                        </div>
                    </div>
                    <div class="line">
                        <div class="lable">申请时间：</div>
                        <div class="input-div"><input name="storageApp.applicationDate" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/>
                        </div>
                    </div>
                    <div class="line">
                        <div class="lable">处理状态：</div>
                        <div class="input-div"><input id="state" name="storageApp.state" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">审核时间：</div>
                        <div class="input-div"><input name="storageApp.auditTime" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">新增人：</div>
                        <div class="input-div"><input name="storageApp.adduser" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">修改人：</div>
                        <div class="input-div"><input name="storageApp.edituser" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">审核人：</div>
                        <div class="input-div"><input name="storageApp.checkuser" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <input type="submit" value="确定" class="btn-submit" onclick="return check();"/>
                    <input type="button" value="取消" class="btn-cancle" onclick="$('#dialog_edit').hide();"/>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>