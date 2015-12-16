<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/11/26
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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

        function check(form) {
            var val = $("#state").val();
            if (val == "yesok" || val == "yesno") {
                alert("该入库申请已审核不能修改");
                return false;
            }
            else {
                return true;
            }
        }
    </script>
</head>

<body>
<div class="table-div">
    <div class="title">入库申请信息</div>
    <div class="btn-div">
        <input type="button" class="btn-eidt" value="修改" onclick="edit();">
     <%--   <input type="button" class="btn-remove" value="删除" onclick="alert('删除');">--%>
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
            <th>申请时间</th>
            <th>处理状态</th>
            <th>审核时间</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.storageapplistall}" var="storageapp">
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
                <td><s:date format="yyyy-MM-dd" name="#storageapp.applicationDate"/></td>
                <td><s:property value="#storageapp.state"/></td>
                <td><s:date format="yyyy-MM-dd hh:mm:ss" name="#storageapp.auditTime"/></td>
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
                <form method="post" action="editrksq" onsubmit="return check(this)">
                    <div class="line">
                        <div class="lable">入库申请id：</div>
                        <div class="input-div"><input name="storageApp.storageAppId" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">商户名称：</div>
                        <div class="input-div"><input placeholder="请输入商户名称" name="storageApp.producerName"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">商品名称：</div>
                        <div class="input-div"><input placeholder="请输入商品名称" name="storageApp.goodsName"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">入库地点：</div>
                        <div class="input-div"><input placeholder="请输入入库地点" name="storageApp.storagePlace"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">商品评级：</div>
                        <div class="input-div"><input placeholder="请输入商品评级" name="storageApp.commodityRating"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">预期入库时间：</div>
                        <div class="input-div"><input placeholder="请输入预期入库时间" name="storageApp.expectedDate" type="date"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">预期入库数量：</div>
                        <div class="input-div"><input placeholder="请输入预期入库数量" name="storageApp.expectedNumber"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">三联单编号：</div>
                        <div class="input-div"><input placeholder="请输入三联单编号" name="storageApp.sldId"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">入库类型：</div>
                        <div class="input-div"><input placeholder="请输入入库类型" name="storageApp.storageType"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">申请时间：</div>
                        <div class="input-div"><input  name="storageApp.applicationDate"  readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"//></div>
                    </div>
                    <div class="line">
                        <div class="lable">处理状态：</div>
                        <div class="input-div"><input id="state" name="storageApp.state" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">审核时间：</div>
                        <div class="input-div"><input  name="storageApp.auditTime" readonly="readonly"
                                                       style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <input type="submit" value="确定" class="btn-submit" onclick="$('#dialog_edit').hide();"/>
                    <input type="button" value="取消" class="btn-cancle" onclick="$('#dialog_edit').hide();"/>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
