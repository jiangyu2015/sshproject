<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/12/27
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>调拨申请信息</title>
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

            $.ajax({
                type: "post",
                url: "excutePlaceAjaxJsonAction",
                success: function (data, xhrTxt) {
                    var str = "";
                    var d = eval("(" + data + ")");
                    var place = d.placeList;
                    console.log(place);
                    for (var i = 0; i < place.length; i++) {
                        // str = str + "<option>" + place[i].placeName + "</option>";
                        str = str + "<option id='" + place[i].placeId + "' value='" + place[i].placeName + "'>";
                    }
                    $("#select3").html(str);

                    $('#item3').bind('input propertychange', function () {
                        $("#select3").html(str);
                    });
                },
                dataType: 'json'
            });
        });

        function check(form) {
            var val = $("#state").val();
            var val3 = $("#item3").val();
            var selectId3 = $("[value='" + val3 + "']").eq(0).attr('id');
            var placeName = $("#placeName").val();
            var placeName2 = $("#item3").val();
            if (val == "yesok" || val == "yesno") {
                alert("该调拨申请已审核不能修改");
                return false;
            }
            else if (placeName == placeName2) {
                alert("调拨申请修改不成功，目标仓库地址与原仓库地址相同！");
                return false;
            }
            else if (val3 != null && val3 != "") {
                if (selectId3 == undefined) {
                    alert("调拨申请修改不成功,仓库未建，请选择选项框内的仓库");
                    return false;
                }
            }
            else {
                return true;
            }
        }
    </script>
</head>

<body>
<div class="table-div">
    <div class="title">调拨申请信息</div>
    <div class="btn-div">
        <input type="button" class="btn-eidt" value="修改" onclick="edit();">
    </div>
    <table id="advSearch" class="table">
        <thead>
        <tr>
            <th>调拨申请id</th>
            <th>商户名称</th>
            <th>商品id</th>
            <th>商品名称</th>
            <th>原仓库地点</th>
            <th>目标仓库地点</th>
            <th>期望时间</th>
            <th>调拨数</th>
            <th>使用类型</th>
            <th>申请时间</th>
            <th>申请人</th>
            <th>修改人</th>
            <th>处理状态</th>
            <th>审核时间</th>
            <th>审核人</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.allotapplistall}" var="allotapp">
            <tr>
                <td><s:property value="#allotapp.allotAppId"/></td>
                <td><s:property value="#allotapp.producer.producerName"/></td>
                <td><s:property value="#allotapp.goods.goodsId"/></td>
                <td><s:property value="#allotapp.goods.goodsName"/></td>
                <td><s:property value="#allotapp.placeOut.placeName"/></td>
                <td><s:property value="#allotapp.placeIn.placeName"/></td>
                <td><s:date format="yyyy-MM-dd" name="#allotapp.expectDate"/></td>
                <td><s:property value="#allotapp.allotNumber"/></td>
                <td><s:property value="#allotapp.allotType"/></td>
                <td><s:date format="yyyy-MM-dd HH:mm:ss" name="#allotapp.applicationDate"/></td>
                <td><s:property value="#allotapp.adduser"/></td>
                <td><s:property value="#allotapp.edituser"/></td>
                <td><s:property value="#allotapp.state"/></td>
                <td><s:date format="yyyy-MM-dd HH:mm:ss" name="#allotapp.auditTime"/></td>
                <td><s:property value="#allotapp.checkuser"/></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>

<div id="dialog_edit" class="dialog-div">
    <div class="dialog-masking"></div>
    <div class="dialog-content">
        <div class="title">修改调拨申请</div>
        <div class="overflow-div">
            <div class="content">
                <form method="post" action="editdbsq" onsubmit="return check(this)">
                    <div class="line">
                        <div class="lable">调拨申请id：</div>
                        <div class="input-div"><input name="allotApp.allotAppId" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">商户名称：</div>
                        <div class="input-div"><input id="producerName" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">商品id：</div>
                        <div class="input-div"><input id="goodsId" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">商品名称：</div>
                        <div class="input-div"><input id="goodsName" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">原仓库地址：</div>
                        <div class="input-div"><input id="placeName" name="placeName" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable"><span>* </span>目标仓库地址：</div>
                        <div class="input-div"><input id="item3" list="select3" placeholder="请输入目标仓库地址"
                                                      name="placeName2"/></div>
                        <datalist id="select3"></datalist>
                    </div>
                    <div class="line">
                        <div class="lable"><span>* </span>期望时间：</div>
                        <div class="input-div"><input id=""placeholder="请输入期望调拨时间" name="allotApp.expectDate" type="date"/><span id="div_expectDate">
                        </div>
                    </div>
                    <div class="line">
                        <div class="lable">调拨数量：</div>
                        <div class="input-div"><input id="allotNumber" name="allotApp.allotNumber" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">使用类型：</div>
                        <div class="input-div"><input id="type" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
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

