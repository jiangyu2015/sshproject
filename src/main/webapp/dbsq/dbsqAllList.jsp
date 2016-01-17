<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/12/27
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>调拨申请信息</title>
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
                    $line.find('input').val($tds.eq(i).text());

                }
                $(".input-div span").html("");  //清空
                $("#div_alert").html("");
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

        function check() {
            var result;
            $.ajax({
                type: "post",
                async: false,
                url: "doWithholdingCheckJsonAction",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
                data: {//设置数据源
                    goodsId: $("#goodsId").val(),
                    placeName: $("#placeName").val(),
                    producerName: $("#producerName").val(),
                    witholdingNumber: $("#witholdingNumber").val(),
                    type: $("#type").val()
                },
                dataType: "json",//设置需要返回的数据类型
                success: function (data, xhrTxt) {
                    var d = eval("(" + data + ")");
                    var availableInventory = d.availableInventory;
                    var allotNumber = $("#allotNumber").val();
                    var val = $("#state").val();
                    var placeName2 = $("#item3").val();
                    var selectId3 = $("[value='" + placeName2 + "']").eq(0).attr('id');
                    var placeName = $("#placeName").val();
                    var expectDate = $("#expectDate").val();
                    var arrs = expectDate.split("-");
                    var storageday = new Date(arrs[0], arrs[1], arrs[2]); //
                    var storagedays = storageday.getTime();

                    var arr = getToDay().split("-");
                    var today = new Date(arr[0], arr[1], arr[2]);  //今天
                    var todays = today.getTime();

                    $(".input-div span").html("");  //清空
                    $("#div_alert").html("");
                    if (val == "yesok" || val == "yesno") {
                        alert("该调拨申请已审核不能修改");
                        result = false;
                    }
                    else if (placeName2 == null || placeName2 == "") {
                        alert("目标仓库不能为空");
                        $("#div_item3").html("目标仓库不能为空");
                        result = false;
                    }

                    else if (placeName == placeName2) {
                        alert("调拨申请修改不成功，目标仓库地址与原仓库地址相同！");
                        $("#div_item3").html("目标仓库地址与原仓库地址不能相同");
                        result = false;
                    }
                    else if (selectId3 == undefined) {
                        alert("调拨申请修改不成功,仓库未建，请选择选项框内的仓库");
                        $("#div_item3").html("仓库未建，请选择选项框内的仓库");
                        result = false;
                    }
                    else if (allotNumber == null || allotNumber == "") {
                        alert("调拨数量不能为空");
                        $("#div_allotNumber").html("调拨数量不能为空");
                        result = false;
                    }
                    else if (allotNumber > availableInventory) {
                        alert("调拨申请不成功，当前预提后可用库存为" + availableInventory + "或许有人比你提前操作预提了，请确认！");
                        $("#div_alert").html("当前预提后可用库存为" + availableInventory + "或许有人比你提前操作预提了，请确认！");
                        result = false;
                    }
                    else if (expectDate == null || expectDate == "") {
                        alert("期望时间不能为空");
                        $("#div_expectDate").html("期望时间不能为空");
                        result = false;

                    }
                    else if (storagedays < todays) {
                        alert("期望调拨时间不能比今天小");
                        $("#div_expectDate").html("期望调拨时间不能比今天小");
                        result = false;
                    }
                    else {
                        alert("调拨修改成功！");
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

    </script>
</head>

<body>
<div class="table-div">
    <div class="title">调拨申请信息</div>
    <div class="btn-div">
        <input type="button" class="btn-eidt" value="修改" onclick="edit();">
    </div>
    <table id="advSearch" class="table">
        <thead>
        <tr>
            <th>调拨申请id</th>
            <th>商户名称</th>
            <th>商品id</th>
            <th>商品名称</th>
            <th>原仓库地点</th>
            <th>目标仓库地点</th>
            <th>期望时间</th>
            <th>调拨数</th>
            <th>使用类型</th>
            <th>申请时间</th>
            <th>申请人</th>
            <th>修改人</th>
            <th>处理状态</th>
            <th>审核时间</th>
            <th>审核人</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.allotapplistall}" var="allotapp">
            <tr>
                <td><s:property value="#allotapp.allotAppId"/></td>
                <td><s:property value="#allotapp.producer.producerName"/></td>
                <td><s:property value="#allotapp.goods.goodsId"/></td>
                <td><s:property value="#allotapp.goods.goodsName"/></td>
                <td><s:property value="#allotapp.placeOut.placeName"/></td>
                <td><s:property value="#allotapp.placeIn.placeName"/></td>
                <td><s:date format="yyyy-MM-dd" name="#allotapp.expectDate"/></td>
                <td><s:property value="#allotapp.allotNumber"/></td>
                <td><s:property value="#allotapp.allotType"/></td>
                <td><s:date format="yyyy-MM-dd HH:mm:ss" name="#allotapp.applicationDate"/></td>
                <td><s:property value="#allotapp.adduser"/></td>
                <td><s:property value="#allotapp.edituser"/></td>
                <td><s:property value="#allotapp.state"/></td>
                <td><s:date format="yyyy-MM-dd HH:mm:ss" name="#allotapp.auditTime"/></td>
                <td><s:property value="#allotapp.checkuser"/></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>

<div id="dialog_edit" class="dialog-div">
    <div class="dialog-masking"></div>
    <div class="dialog-content">
        <div class="title">修改调拨申请</div>
        <div class="overflow-div">
            <div class="content">
                <form method="post" action="editdbsq">
                    <div class="line">
                        <div class="lable">调拨申请id：</div>
                        <div class="input-div"><input name="allotApp.allotAppId" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">商户名称：</div>
                        <div class="input-div"><input id="producerName" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">商品id：</div>
                        <div class="input-div"><input id="goodsId" readonly="readonly"
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
                        <div class="input-div"><input id="item3" list="select3" placeholder="请输入目标仓库地址"
                                                      name="placeName2"/><span id="div_item3"></span></div>
                        <datalist id="select3"></datalist>
                    </div>
                    <div class="line">
                        <div class="lable"><span>* </span>期望时间：</div>
                        <div class="input-div"><input id="expectDate" placeholder="请输入期望调拨时间" name="allotApp.expectDate"
                                                      type="date"/><span id="div_expectDate"></span>
                        </div>
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
                        <div class="input-div"><input id="type" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">申请时间：</div>
                        <div class="input-div"><input type="datetime" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">申请人：</div>
                        <div class="input-div"><input readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">修改人：</div>
                        <div class="input-div"><input readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">处理状态：</div>
                        <div class="input-div"><input id="state" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">审核时间：</div>
                        <div class="input-div"><input type="datetime" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/>
                        </div>
                    </div>
                    <div class="line">
                        <div class="lable">审核人：</div>
                        <div class="input-div"><input readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <span id="div_alert"></span><br>
                    <input type="submit" value="提交" class="btn-submit" onclick="return check();"/>
                    <input type="button" value="取消" class="btn-cancle" onclick="$('#dialog_edit').hide();"/>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>

