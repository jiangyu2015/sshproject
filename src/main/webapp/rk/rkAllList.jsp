<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/11/27
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>入库明细信息</title>
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

        function search() {
            window.location.href = "rkSelect.jsp";
        }
    </script>
</head>

<body>
<div class="table-div">
    <div class="title">入库明细信息</div>
    <div class="btn-div">
        <%--  <input type="button" class="btn-eidt" value="修改" onclick="edit();">--%>
        <input type="button" class="btn-remove" value="查询" onclick="search();">
    </div>
    <table id="advSearch" class="table">
        <thead>
        <tr>
            <th>入库明细id</th>
            <th>商户名称</th>
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
            <th>入库类别</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.storagelistall}" var="storage">
            <tr>
                <td><s:property value="#storage.storageId"/></td>
                <td><s:property value="#storage.producer.producerName"/></td>
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
        <div class="title">修改入库明细信息</div>
        <div class="overflow-div">
            <div class="content">
                <form method="post" action="editrk">
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
                                                      style="border: none;-webkit-box-shadow: none;" type="date"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">商品截止日期：</div>
                        <div class="input-div"><input name="storage.goods.expirationDate" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;" type="date"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">预期入库时间：</div>
                        <div class="input-div"><input name="storage.expectedDate" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;" type="date"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">实际入库时间：</div>
                        <div class="input-div"><input name="storage.storageDate" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;" type="date"/></div>
                    </div>


                    <div class="line">
                        <div class="lable">预期数量：</div>
                        <div class="input-div"><input name="storage.expectedNumber" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">实收数量：</div>
                        <div class="input-div"><input name="storage.storageNumber" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">入库类型：</div>
                        <div class="input-div"><input name="storage.storageType" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">备注：</div>
                        <div class="input-div"><input placeholder="请输入备注" name="storage.remark"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">入库状态：</div>
                        <div class="input-div"><input name="storage.state" readonly="readonly"
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
                        <div class="input-div"><input  readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>


                    <div style="position: relative; bottom: 0px; text-align: center;">
                        <input type="submit" value="确定" class="btn-submit" onclick="$('#dialog_edit').hide();"/>
                        <input type="button" value="取消" class="btn-cancle" onclick="$('#dialog_edit').hide();"/>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>

