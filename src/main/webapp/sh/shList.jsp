<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/11/25
  Time: 11:52
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
    <title>商户信息</title>
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
                $(".input-div span").html("");
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
        });

        function check( ) {
            var producerName = $('#producerName').val().replace(/\s/g, "");
            $('#producerName').val(producerName);
            var producerAddress = $('#producerAddress').val();
            var linkman = $('#linkman').val();
            $(".input-div span").html("");
            $("#div_alert").html("");

            var val = $("#state").val();
            if (val == "yesok" || val == "yesno") {
                alert("该商品已审核不能修改");
                return false;
            }
            else
            {
                if (producerName == null || producerName.length == 0 || isNull(producerName)) {
                    $("#div_producerName").html("请输入商户名称!");
                    alert("请输入商户名称!");
                    return false;
                }
                if (producerAddress ==null || producerAddress.length == 0 || isNull(producerAddress)) {
                    $("#div_producerAddress").html("请输入商户地址!");
                    alert("请输入商户地址!");
                    return false;
                }
                if (linkman ==null || linkman.length == 0 || isNull(linkman)) {
                    $("#div_linkman").html("请输入联系人!");
                    alert("请输入联系人!");
                    return false;
                }
                if ($('#telOne').val() == "" && $('#telTwo').val() == "") {
                    $("#div_alert").html("请输入至少一个联系电话!");
                    alert("请输入至少一个联系电话!");
                    return false;
                }
            }
            $('#dialog_edit').hide();
            return true;
        }
        function isNull(str) {
            if (str == "") return true;
            var regu = "^[ ]+$";
            var re = new RegExp(regu);
            return re.test(str);
        }
    </script>
</head>

<body>
<div class="table-div">
    <div class="title">商户信息</div>
    <div class="btn-div">
        <input type="button" class="btn-eidt" value="修改" onclick="edit();">
    </div>

    <table id="advSearch" class="table">
        <thead>
        <tr>
            <th>商户id</th>
            <th>商户名称</th>
            <th>商户地址</th>
            <th>联系人</th>
            <th>联系电话1</th>
            <th>联系电话2</th>
            <th>商户可用</th>
            <th>审核时间</th>
            <th>新建人</th>
            <th>修改人</th>
            <th>审核人</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.producerlist}" var="producer">
            <tr>
                <td><s:property value="#producer.producerId"/></td>
                <td><s:property value="#producer.producerName"/></td>
                <td><s:property value="#producer.producerAddress"/></td>
                <td><s:property value="#producer.linkman"/></td>
                <td><s:property value="#producer.telOne"/></td>
                <td><s:property value="#producer.telTwo"/></td>
                <td><s:property value="#producer.state"/></td>
                <td><s:date format="yyyy-MM-dd HH:mm:ss" name="#producer.auditTime"/></td>
                <td><s:property value="#producer.adduser"/></td>
                <td><s:property value="#producer.edituser"/></td>
                <td><s:property value="#producer.checkuser"/></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>


<div id="dialog_edit" class="dialog-div">
    <div class="dialog-masking"></div>
    <div class="dialog-content">
        <div class="title">修改商户</div>
        <div class="overflow-div">
            <div class="content">
                <form method="post" action="editSh"  >
                    <div class="line">
                        <div class="lable">商户id：</div>
                        <div class="input-div"><input name="producer.producerId" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>

                    </div>
                    <div class="line">
                        <div class="lable"><span>* </span>商户名称：</div>
                        <div class="input-div"><input id="producerName" name="producer.producerName"/> <span
                                id="div_producerName"></span></div>
                    </div>

                    <div class="line">
                        <div class="lable"><span>* </span>商户地址：</div>
                        <div class="input-div"><input id="producerAddress" name="producer.producerAddress"/> <span
                                id="div_producerAddress"></span></div>
                    </div>

                    <div class="line">
                        <div class="lable"><span>* </span>联系人：</div>
                        <div class="input-div"><input id="linkman" name="producer.linkman"/><span
                                id="div_linkman"></span></div>

                    </div>

                    <div class="line">
                        <div class="lable">联系电话1：</div>
                        <div class="input-div"><input id="telOne" placeholder="请输入联系电话" name="producer.telOne"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">联系电话2：</div>
                        <div class="input-div"><input id="telTwo" placeholder="请输入备用联系电话" name="producer.telTwo"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">商户可用状态：</div>
                        <div class="input-div"><input id="state" name="producer.state" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">审核时间：</div>
                        <div class="input-div"><input name="producer.auditTime" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">新增人：</div>
                        <div class="input-div"><input name="producer.adduser" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">修改人：</div>
                        <div class="input-div"><input name="producer.edituser" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">审核人：</div>
                        <div class="input-div"><input name="producer.checkuser" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <span id="div_alert"></span></br>
                    <input type="submit" value="确定" class="btn-submit" onclick="return check();"/>
                    <input type="button" value="取消" class="btn-cancle" onclick="$('#dialog_edit').hide();"/>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>