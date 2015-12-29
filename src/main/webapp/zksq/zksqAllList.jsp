<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/12/27
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>转库申请信息</title>
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
            var typeOut = $("#typeOut").val();
            var typeIn = $("#typeIn").val();
            if (val == "yesok" || val == "yesno") {
                alert("该转库申请已审核不能修改");
                return false;
            }
            else if (typeIn == typeOut) {
                alert("转库申请修改不成功，目标使用类型与原先一样！");
                return false;
            }
            else {
                alert("转库申请修改成功！");
                return true;
            }
        }

    </script>
</head>

<body>
<div class="table-div">
    <div class="title">转库申请信息</div>
    <div class="btn-div">
        <input type="button" class="btn-eidt" value="修改" onclick="edit();">
    </div>
    <table id="advSearch" class="table">
        <thead>
        <tr>
            <th>转库申请id</th>
            <th>商户名称</th>
            <th>商品id</th>
            <th>商品名称</th>
            <th>仓库地点</th>
            <th>转库数</th>
            <th>原使用类型</th>
            <th>目标使用类型</th>
            <th>期望时间</th>
            <th>申请时间</th>
            <th>申请人</th>
            <th>修改人</th>
            <th>处理状态</th>
            <th>审核时间</th>
            <th>审核人</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.transferapplistall}" var="transferapp">
            <tr>
                <td><s:property value="#transferapp.transferAppId"/></td>
                <td><s:property value="#transferapp.producer.producerName"/></td>
                <td><s:property value="#transferapp.goods.goodsId"/></td>
                <td><s:property value="#transferapp.goods.goodsName"/></td>
                <td><s:property value="#transferapp.place.placeName"/></td>
                <td><s:property value="#transferapp.transferNumber"/></td>
                <td><s:property value="#transferapp.typeOut"/></td>
                <td><s:property value="#transferapp.typeIn"/></td>
                <td><s:date format="yyyy-MM-dd" name="#transferapp.expectDate"/></td>
                <td><s:date format="yyyy-MM-dd HH:mm:ss" name="#transferapp.applicationDate"/></td>
                <td><s:property value="#transferapp.adduser"/></td>
                <td><s:property value="#transferapp.edituser"/></td>
                <td><s:property value="#transferapp.state"/></td>
                <td><s:date format="yyyy-MM-dd HH:mm:ss" name="#transferapp.auditTime"/></td>
                <td><s:property value="#transferapp.checkuser"/></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>

<div id="dialog_edit" class="dialog-div">
    <div class="dialog-masking"></div>
    <div class="dialog-content">
        <div class="title">修改转库申请</div>
        <div class="overflow-div">
            <div class="content">
                <form method="post" action="editzksq" onsubmit="return check(this)">
                    <div class="line">
                        <div class="lable">转库申请id：</div>
                        <div class="input-div"><input readonly="readonly" name="transferApp.transferAppId"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">商户名称：</div>
                        <div class="input-div"><input id="producerName" name="producerName" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">商品id：</div>
                        <div class="input-div"><input id="goodsId" name="goodsId" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">商品名称：</div>
                        <div class="input-div"><input id="goodsName" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">仓库地址：</div>
                        <div class="input-div"><input id="placeName" name="placeName" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">转库数量：</div>
                        <div class="input-div"><input id="allotNumber" placeholder="请输入转库数量"
                                                      name="transferApp.transferNumber"/>
                        </div>
                    </div>
                    <div class="line">
                        <div class="lable">原使用类型：</div>
                        <div class="input-div"><input id="typeOut" name="transferApp.typeOut" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">目标使用类型：</div>
                        <div class="input-div">
                            <select id="typeIn" name="transferApp.typeIn">
                                <option value="任意配置">任意配置</option>
                                <option value="一元购">一元购</option>
                                <option value="社区特卖">社区特卖</option>
                                <option value="物业礼包">物业礼包</option>
                                <option value="福利">福利</option>
                            </select>
                        </div>
                    </div>
                    <div class="line">
                        <div class="lable">期望时间：</div>
                        <div class="input-div"><input  name="transferApp.expectDate"
                                                      type="date"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">申请时间：</div>
                        <div class="input-div"><input type="datetime" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">申请人：</div>
                        <div class="input-div"><input readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">修改人：</div>
                        <div class="input-div"><input readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">处理状态：</div>
                        <div class="input-div"><input id="state" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">审核时间：</div>
                        <div class="input-div"><input type="datetime" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/>
                        </div>
                    </div>
                    <div class="line">
                        <div class="lable">审核人：</div>
                        <div class="input-div"><input readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <input type="submit" value="提交" class="btn-submit"/>
                    <input type="button" value="取消" class="btn-cancle" onclick="$('#dialog_edit').hide();"/>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
