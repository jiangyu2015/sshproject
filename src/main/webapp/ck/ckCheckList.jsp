<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/12/30
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>出库明细信息</title>
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

        function check() {
            var deliverDate = $("#deliverDate").val();  //实际出库时间
            /*     var expecteNumber = $("#expecteNumber").val(); //预期出库数*/
            var deliverNumber = $("#deliverNumber").val(); //实收数量    实收数量和预期入库数到时候再说
            var arr = getToDay().split("-");    //比较时间
            var today = new Date(arr[0], arr[1], arr[2]);  //今天
            var todays = today.getTime();
            var arrs = deliverDate.split("-");
            var deliverday = new Date(arrs[0], arrs[1], arrs[2]); //实际入库时间
            var deliverdays = deliverday.getTime();
            $(".input-div span").html("");

            if (deliverNumber == "" || deliverNumber == null) {
                $("#div_deliverNumber").html("请输入实际出库数！");
                return false;
            }
            else if (deliverDate == "" || deliverDate == null) {
                $("#div_deliverDate").html("请输入实际出库数量！");
                return false;
            }
            else if (deliverdays > todays) {
                alert("确认出库不成功，实际出库时间比今天大？真的出库了再来填，拜拜！");
                $("#div_deliverDate").html("实际出库时间不能比今天大");
                return false;
            }
            else {
                alert("确认出库成功");
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

    </script>
</head>

<body>
<div class="table-div">
    <div class="title">确认出库</div>
    <div class="btn-div">
        <input type="button" class="btn-eidt" value="确认出库" onclick="edit();" style="position: relative; width: 90px;">
        <%-- <input type="button" class="btn-remove" value="删除" onclick="alert('删除');">--%>
    </div>
    <table id="advSearch" class="table">
        <thead>
        <tr>
            <th>出库明细id</th>
            <th>商户名称</th>
            <th>商品名称</th>
            <th>仓库地点</th>
            <th>实际出库时间</th>
            <th>预期出库数量</th>
            <th>实际出库数量</th>
            <th>出库类型</th>
            <th>备注</th>
            <th>出库填写人</th>
            <th>出库确认人</th>
            <%--  <th>预提单号</th>  //这是调拨申请的出库 没有预提单号--%>
            <th>出库类别</th>
            <th>出库状态</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.deliverlistcheck}" var="deliver">
            <tr>
                <td><s:property value="#deliver.deliverId"/></td>
                <td><s:property value="#deliver.producer.producerName"/></td>
                <td><s:property value="#deliver.goods.goodsName"/></td>
                <td><s:property value="#deliver.place.placeName"/></td>
                <td><s:date format="yyyy-MM-dd" name="#deliver.deliverDate"/></td>
                <td><s:property value="#deliver.expecteNumber"/></td>
                <td><s:property value="#deliver.deliverNumber"/></td>
                <td><s:property value="#deliver.deliverType"/></td>
                <td><s:property value="#deliver.remark"/></td>
                <td><s:property value="#deliver.adduser"/></td>
                <td><s:property value="#deliver.checkuser"/></td>
                    <%--      <td><s:property value="#deliver.withholding.withholdingId"/></td>--%>
                <td><s:property value="#deliver.category"/></td>
                <td><s:property value="#deliver.state"/></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>

<div id="dialog_edit" class="dialog-div">
    <div class="dialog-masking"></div>
    <div class="dialog-content">
        <div class="title">确认出货</div>
        <div class="overflow-div">
            <div class="content">
                <form method="post" action="ckOk">
                    <div class="line">
                        <div class="lable">出库明细id：</div>
                        <div class="input-div"><input name="deliver.deliverId" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">商户名称：</div>
                        <div class="input-div"><input name="deliver.producer.producerName" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">商品名称：</div>
                        <div class="input-div"><input name="deliver.goods.goodsName" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">仓库名称：</div>
                        <div class="input-div"><input name="deliver.place.placeName" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable"><span>* </span>实际出库时间：</div>
                        <div class="input-div"><input id="deliverDate" name="deliver.deliverDate" type="date"/><span
                                id="div_deliverDate"></span></div>
                    </div>

                    <div class="line">
                        <div class="lable">预期出库数量：</div>
                        <div class="input-div"><input id="expecteNumber" name="deliver.expecteNumber"
                                                      readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable"><span>* </span>实际出库数量：</div>
                        <div class="input-div">
                            <input id="deliverNumber" placeholder="请输入出库数量"
                                   name="deliver.deliverNumber" onkeyup="value=value.replace(/[^\d]/g,'')"
                                   onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                            <span id="div_deliverNumber"></span></div>
                    </div>


                    <div class="line">
                        <div class="lable">出库类型：</div>
                        <div class="input-div"><input name="deliver.deliverType" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">备注：</div>
                        <div class="input-div"><input placeholder="请输入备注" name="deliver.remark"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">出库填写人：</div>
                        <div class="input-div"><input readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">确认出库人：</div>
                        <div class="input-div"><input readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <%--  <div class="line">
                          <div class="lable">预提单号：</div>
                          <div class="input-div"><input  readonly="readonly"
                                                         style="border: none;-webkit-box-shadow: none;"/></div>
                      </div>--%>
                    <div class="line">
                        <div class="lable">出库类别：</div>
                        <div class="input-div"><input readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">出库状态：</div>
                        <div class="input-div"><input readonly="readonly"
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
