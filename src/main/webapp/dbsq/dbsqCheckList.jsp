<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/12/28
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>未审核入库申请信息</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>

    <script type="text/javascript">
        function check() {
            if ($(".active").length == 0) {
                alert('请选择要审核的申请表');
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
        });

        function btn() {
            alert("no");
            $.ajax({
                type: "post",
                url: "allotCheckJsonAction",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
                data: {//设置数据源
                    id: $('#allotAppId').val()
                },
                dataType: "json",//设置需要返回的数据类型
                success: function () {
                    alert("已确认未通过");
                    $('#dialog_edit').hide();
                    //  window.location.reload();
                    window.location.href = "dbsqcheck.action";
                },
                error: function () {
                    alert("系统异常，请稍后重试！");
                }//这里不要加","
            });

        }
        function checkSelect() {
            var val = $("#goods").val();
            var selectId = $("[value='" + val + "']").eq(0).attr('value');
            if (val == null || val == "") {
                alert("请输入查询选项");
                return false;
            }
            else if (val != null && val != "") {
                if (selectId == undefined) {
                    alert("商品未建或未通过审核，输入商品后请选择选项框内带“|数字”的商品");
                    return false;
                }
            }
        }
    </script>

</head>

<body>
<div class="table-div">
    <div class="title">未审核调拨申请信息</div>
    <div class="btn-div">
        <input type="button" class="btn-eidt" value="审核" onclick="check();">
        <form method="post" action="dbsqSelectCheck.action" onsubmit="return checkSelect()" class="head-form">
            <div class="head-lable">商品名称：</div>
            <input id="goods" class="head-input" list="selectgoods" name="goodsName" onchange="getInfo()"/>
            <datalist id="selectgoods"></datalist>
            <input type="submit" class="btn-remove head-btn-right" value="查询">
        </form>
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
        <s:iterator value="%{#session.allotapplischeck}" var="allotapp">
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
        <div class="title">审核调拨申请</div>
        <div class="overflow-div">
            <div class="content">
                <form id="checkForm" method="post" action="qbsqOk">
                    <div class="line">
                        <div class="lable">调拨申请id：</div>
                        <div class="input-div"><input id="allotAppId" name="allotApp.allotAppId" readonly="readonly"
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
                        <div class="lable">目标仓库地址：</div>
                        <div class="input-div"><input id="item3" list="select3" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                        <datalist id="select3"></datalist>
                    </div>
                    <div class="line">
                        <div class="lable">期望时间：</div>
                        <div class="input-div"><input type="date" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">调拨数量：</div>
                        <div class="input-div"><input id="allotNumber" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">使用类型：</div>
                        <div class="input-div"><input id="type" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <input type="submit" value="通过" class="btn-submit" onclick="$('#dialog_edit').hide();"/>
                    <input type="button"  value="不通过" class="btn" onclick="btn()"/>
                    <input type="button" value="取消" class="btn-cancle" onclick="$('#dialog_edit').hide();"/>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>

