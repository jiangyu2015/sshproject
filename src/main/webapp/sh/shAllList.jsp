<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
                alert("该商户已审核不能修改");
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
    <div class="title">商户信息</div>
    <div class="btn-div">
        <input type="button" class="btn-eidt" value="修改" onclick="edit();">
        <input type="button" class="btn-remove" value="删除" onclick="alert('删除');">
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
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.producerlistall}" var="producer">
            <tr>
                <td><s:property value="#producer.producerId"/></td>
                <td><s:property value="#producer.producerName"/></td>
                <td><s:property value="#producer.producerAddress"/></td>
                <td><s:property value="#producer.linkman"/></td>
                <td><s:property value="#producer.telOne"/></td>
                <td><s:property value="#producer.telTwo"/></td>
                <td><s:property value="#producer.state"/></td>
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
                <form method="post" action="editSh" onsubmit="return check(this)">
                    <div class="line">
                        <div class="lable">商户id：</div>
                        <div class="input-div"><input name="producer.producerId" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>

                    </div>
                    <div class="line">
                        <div class="lable">商户名称：</div>
                        <div class="input-div"><input placeholder="请输入商户名称" name="producer.producerName"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">商户地址：</div>
                        <div class="input-div"><input placeholder="请输入商户地址" name="producer.producerAddress"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">联系人：</div>
                        <div class="input-div"><input placeholder="请输入联系人" name="producer.linkman"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">联系电话1：</div>
                        <div class="input-div"><input placeholder="请输入联系电话" name="producer.telOne"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">联系电话2：</div>
                        <div class="input-div"><input placeholder="请输入备用联系电话" name="producer.telTwo"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">商户可用状态：</div>
                        <div class="input-div"><input id="state" name="producer.state" readonly="readonly"
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