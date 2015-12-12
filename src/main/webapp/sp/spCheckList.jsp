<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/12/11
  Time: 22:33
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
            alert("no");
            $.ajax({
                type: "post",
                url: "goodsCheckJsonAction",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
                data: {//设置数据源
                    id: $('#goodsId').val()
                },
                dataType: "json",//设置需要返回的数据类型
                success: function () {
                    alert("已确认未通过");
                    $('#dialog_edit').hide();
                    //  window.location.reload();
                    window.location.href = "spCheck.action";
                },
                error: function () {
                    alert("系统异常，请稍后重试！");
                }//这里不要加","
            });
        }

        function btnOk() {
            alert("yes");
            $.ajax({
                type: "post",
                url: "goodsCheckOkJsonAction",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
                data: {//设置数据源
                    id: $('#goodsId').val()
                },
                dataType: "json",//设置需要返回的数据类型
                success: function () {
                    alert("已确认通过");
                    $('#dialog_edit').hide();
                    //  window.location.reload();
                    window.location.href = "spCheck.action";
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
    <div class="title">待审核商品信息</div>
    <div class="btn-div">
        <input type="button" class="btn-eidt" value="审核" onclick="check();">
    </div>
    <table id="advSearch" class="table">
        <thead>
        <tr>
            <th>商品id</th>
            <th>商品名称</th>
            <th>后台商品名称</th>
            <th>参考价值</th>
            <th>单价</th>
            <th>长cm</th>
            <th>宽cm</th>
            <th>高cm</th>
            <th>毛重kg</th>
            <th>体积m*m*m</th>
            <th>体积重量kg</th>
            <th>装箱规格</th>
            <th>单位</th>
            <th>实物服务</th>
            <th>生产日期</th>
            <th>保质期</th>
            <th>保质期截止日期</th>
            <th>商品可用</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.goodslistcheck}" var="goods">
            <tr>
                <td><s:property value="#goods.goodsId"/></td>
                <td><s:property value="#goods.goodsName"/></td>
                <td><s:property value="#goods.goodsBackName"/></td>
                <td><s:property value="#goods.value"/></td>
                <td><s:property value="#goods.price"/></td>
                <td><s:property value="#goods.length"/></td>
                <td><s:property value="#goods.wide"/></td>
                <td><s:property value="#goods.tall"/></td>
                <td><s:property value="#goods.mweight"/></td>
                <td><s:property value="#goods.volume"/></td>
                <td><s:property value="#goods.vweight"/></td>
                <td><s:property value="#goods.standard"/></td>
                <td><s:property value="#goods.unit"/></td>
                <td><s:property value="#goods.service"/></td>
                <td><s:date format="yyyy-MM-dd" name="#goods.creationDate"/></td>
                <td><s:property value="#goods.baozhiqi"/></td>
                <td><s:date format="yyyy-MM-dd" name="#goods.expirationDate"/></td>
                <td><s:property value="#goods.state"/></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>

<div id="dialog_edit" class="dialog-div">
    <div class="dialog-masking"></div>
    <div class="dialog-content">
        <div class="title">审核商品</div>
        <div class="overflow-div">
            <div class="content">
                <form method="post" <%--action="spCheckOk"--%>>
                    <div class="line">
                        <div class="lable">商品id：</div>
                        <div class="input-div"><input id="goodsId" name="goods.goodsId" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">商品名称：</div>
                        <div class="input-div"><input name="goods.goodsName" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">商品后台名称：</div>
                        <div class="input-div"><input name="goods.goodsBackName" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">参考价值：</div>
                        <div class="input-div"><input name="goods.value" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">单价：</div>
                        <div class="input-div"><input name="goods.price" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">长cm：</div>
                        <div class="input-div"><input name="goods.length" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">宽cm：</div>
                        <div class="input-div"><input name="goods.wide" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">高cm：</div>
                        <div class="input-div"><input name="goods.tall" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">毛重kg：</div>
                        <div class="input-div"><input name="goods.mweight" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">体积m*m*m：</div>
                        <div class="input-div"><input name="goods.volume" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">体积重量kg：</div>
                        <div class="input-div"><input name="goods.vweight" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">装箱规格：</div>
                        <div class="input-div"><input name="goods.standard" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">单位：</div>
                        <div class="input-div"><input name="goods.unit" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">实物服务：</div>
                        <div class="input-div"><input name="goods.service" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>

                    </div>
                    <div class="line">
                        <div class="lable">生产日期：</div>
                        <div class="input-div"><input name="goods.creationDate" type="date" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/>
                        </div>
                    </div>
                    <div class="line">
                        <div class="lable">保质期：</div>
                        <div class="input-div"><input name="goods.baozhiqi" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">保质期截止日期：</div>
                        <div class="input-div"><input name="goods.expirationDate" type="date" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/>
                        </div>
                    </div>
                    <div class="line">
                        <div class="lable">商品可用：</div>
                        <div class="input-div"><input name="goods.state" readonly="readonly"
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


