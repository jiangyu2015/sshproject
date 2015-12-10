<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/12/4
  Time: 10:18
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
        });

        function btn() {
            alert("no");
                $.ajax({
                    type: "post",
                    url: "excuteCheckJsonAction",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
                    data: {//设置数据源
                        id:  $('#storageAppId').val()
                    },
                    dataType: "json",//设置需要返回的数据类型
                    success: function () {
                        alert("已确认未通过");
                        $('#dialog_edit').hide();
                      //  window.location.reload();
                        window.location.href="rksqcheck.action";
                    },
                    error: function () {
                        alert("系统异常，请稍后重试！");
                    }//这里不要加","
                });

        }

    </script>

</head>

<body>
<div class="table-div">
    <div class="title">未审核入库申请信息</div>
    <div class="btn-div">
        <input type="button" class="btn-eidt" value="审核" onclick="check();">
       <%-- <input type="button" class="btn-remove" value="删除" onclick="alert('删除');">--%>
    </div>
    <table id="advSearch" class="table">
        <thead>
        <tr>
            <th>入库申请id</th>
            <th>商户名称</th>
            <th>商品名称</th>
            <th>入库地点</th>
            <th>商品评级</th>
            <th>预期入库时间</th>
            <th>预期入库数量</th>
            <th>三联单编号</th>
            <th>入库类型</th>
            <th>处理状态</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.storageapplistcheck}" var="storageapp">
            <tr>
                <td><s:property value="#storageapp.storageAppId"/></td>
                <td><s:property value="#storageapp.producerName"/></td>
                <td><s:property value="#storageapp.goodsName"/></td>
                <td><s:property value="#storageapp.storagePlace"/></td>
                <td><s:property value="#storageapp.commodityRating"/></td>
                <td><s:date format="yyyy-MM-dd" name="#storageapp.expectedDate"/></td>
                <td><s:property value="#storageapp.expectedNumber"/></td>
                <td><s:property value="#storageapp.sldId"/></td>
                <td><s:property value="#storageapp.storageType"/></td>
                <td><s:property value="#storageapp.state"/></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>

<div id="dialog_edit" class="dialog-div">
    <div class="dialog-masking"></div>
    <div class="dialog-content">
        <div class="title">审核入库申请</div>
        <div class="overflow-div">
            <div class="content">
                <form id="checkForm" method="post" action="rksqOk">
                    <div class="line">
                        <div class="lable">入库申请id：</div>
                        <div class="input-div"><input id="storageAppId" name="storageApp.storageAppId" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">商户名称：</div>
                        <div class="input-div"><input name="storageApp.producerName" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">商品名称：</div>
                        <div class="input-div"><input name="storageApp.goodsName" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">入库地点：</div>
                        <div class="input-div"><input name="storageApp.storagePlace" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">商品评级：</div>
                        <div class="input-div"><input name="storageApp.commodityRating" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">预期入库时间：</div>
                        <div class="input-div"><input name="storageApp.expectedDate"  type="date" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>

                    </div>
                    <div class="line">
                        <div class="lable">预期入库数量：</div>
                        <div class="input-div"><input name="storageApp.expectedNumber" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">三联单编号：</div>
                        <div class="input-div"><input name="storageApp.sldId" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">入库类型：</div>
                        <div class="input-div"><input name="storageApp.storageType" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">处理状态：</div>
                        <div class="input-div"><input name="storageApp.state" readonly="readonly"
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

