<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/11/29
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/11/28
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>活动预提信息</title>
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
    </script>
</head>

<body>
<div class="table-div">
    <div class="title">活动预提信息</div>
    <div class="btn-div">
        <input type="button" class="btn-eidt" value="修改" onclick="edit();">
        <input type="button" class="btn-remove" value="删除" onclick="alert('删除');">
    </div>
    <table id="advSearch" class="table">
        <thead>
        <tr>
            <th>活动预提id</th>
            <th>活动id</th>
            <th>活动预提消耗</th>
            <th>预提消耗总数</th>

        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.activitylistall}" var="activity">
            <tr>
                <td><s:property value="#activity.aid"/></td>
                <td><s:property value="#activity.withholding.withholdingId"/></td>
                <td><s:property value="#activity.consumeNumber"/></td>
                <td><s:property value="#activity.withholding.witholdingNumber"/></td>

            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>

<div id="dialog_edit" class="dialog-div">
    <div class="dialog-masking"></div>
    <div class="dialog-content">
        <div class="title">修改出库明细信息</div>
        <div class="overflow-div">
            <div class="content">
                <form method="post" action="editck">
                    <div class="line">
                        <div class="lable">出库明细id：</div>
                        <div class="input-div"><input name="deliver.deliverId" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">商品id：</div>
                        <div class="input-div"><input placeholder="请输入商品id" name="deliver.goodsId"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">仓库id：</div>
                        <div class="input-div"><input placeholder="请输入仓库id" name="deliver.placeId"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">实际出库时间：</div>
                        <div class="input-div"><input placeholder="请输入实际出库时间" name="deliver.deliverDate"  type="date"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">预期出库数量：</div>
                        <div class="input-div"><input placeholder="请输入实收数量" name="deliver.expecteNumber"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">实际出库数量：</div>
                        <div class="input-div"><input placeholder="请输入实收数量" name="deliver.deliverNumber"/></div>
                    </div>


                    <div class="line">
                        <div class="lable">出库类型：</div>
                        <div class="input-div"><input placeholder="请输入出库类型" name="deliver.deliverType"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">备注：</div>
                        <div class="input-div"><input placeholder="请输入备注" name="deliver.remark"/></div>
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
