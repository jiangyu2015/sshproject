<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/12/12
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>未审核商品</title>
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
            $.ajax({
                type: "post",
                url: "producerCheckJsonAction",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
                data: {//设置数据源
                    id: $('#producerId').val()
                },
                dataType: "json",//设置需要返回的数据类型
                success: function () {
                    alert("已确认未通过");
                    $('#dialog_edit').hide();
                    //  window.location.reload();
                    window.location.href = "shCheck.action";
                },
                error: function () {
                    alert("系统异常，请稍后重试！");
                }//这里不要加","
            });
        }

        function btnOk() {
            $.ajax({
                type: "post",
                url: "producerCheckOkJsonAction",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
                data: {//设置数据源
                    id: $('#producerId').val()
                },
                dataType: "json",//设置需要返回的数据类型
                success: function () {
                    alert("已确认通过");
                    $('#dialog_edit').hide();
                    //  window.location.reload();
                    window.location.href = "shCheck.action";
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
    <div class="title">商户信息</div>
    <div class="btn-div">
        <input type="button" class="btn-eidt" value="审核" onclick="check();">
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
            <th>新建人</th>
            <th>修改人</th>
            <th>审核人</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.producerlistcheck}" var="producer">
            <tr>
                <td><s:property value="#producer.producerId"/></td>
                <td><s:property value="#producer.producerName"/></td>
                <td><s:property value="#producer.producerAddress"/></td>
                <td><s:property value="#producer.linkman"/></td>
                <td><s:property value="#producer.telOne"/></td>
                <td><s:property value="#producer.telTwo"/></td>
                <td><s:property value="#producer.state"/></td>
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
                <form <%--method="post" action="editSh"--%>>
                    <div class="line">
                        <div class="lable">商户id：</div>
                        <div class="input-div"><input id="producerId" name="producer.producerId" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>

                    </div>
                    <div class="line">
                        <div class="lable">商户名称：</div>
                        <div class="input-div"><input name="producer.producerName" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">商户地址：</div>
                        <div class="input-div"><input name="producer.producerAddress" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">联系人：</div>
                        <div class="input-div"><input name="producer.linkman" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">联系电话1：</div>
                        <div class="input-div"><input name="producer.telOne" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">联系电话2：</div>
                        <div class="input-div"><input name="producer.telTwo" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">商户可用状态：</div>
                        <div class="input-div"><input name="producer.state" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">新增人：</div>
                        <div class="input-div"><input  name="producer.adduser" readonly="readonly"
                                                       style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">修改人：</div>
                        <div class="input-div"><input  name="producer.edituser" readonly="readonly"
                                                       style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">审核人：</div>
                        <div class="input-div"><input  name="producer.checkuser" readonly="readonly"
                                                       style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <input type="button" value="通过" class="btn-submit" onclick="btnOk()"/>
                    <input type="button" value="不通过" class="btn" onclick="btn()"/>
                    <input type="button" value="取消" class="btn-cancle" onclick="$('#dialog_edit').hide();"/>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
</html>

