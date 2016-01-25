<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/12/30
  Time: 22:35
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
        $(function () {
            $.ajax({
                type: "post",
                url: "excuteAjaxJsonAction",
                success: function (data, xhrTxt) {
                    var str = "";
                    var d = eval("(" + data + ")");
                    var goods = d.goodsList;
                    console.log(goods);
                    for (var i = 0; i < goods.length; i++) {
                        str = str + "<option value='" + goods[i].goodsName + "|" + goods[i].goodsId + "'>";
                    }
                    $("#selectgoods").html(str);
                    $('#goods').bind('input propertychange', function () {
                        $("#selectgoods").html(str);
                    });
                },
                dataType: 'json'
            });
            $.ajax({
                type: "post",
                url: "selectProducerJsonAction",
                dataType: 'json',
                success: function (data, xhrTxt) {
                    var str = "";
                    var d = eval("(" + data + ")");
                    var producer = d.producerList;
                    console.log(producer);
                    for (var i = 0; i < producer.length; i++) {
                        str = str + "<option id='" + producer[i].producerId + "' value='" + producer[i].producerName + "'>";
                    }

                    $("#selectproducer").html(str);
                    $('#producer').bind('input propertychange', function () {
                        $("#selectproducer").html(str);
                    });
                },
                error: function () {
                    alert("未查到商户");
                    $("#div_item2").html("未查到商户");
                }//这里不要加","

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
                        str = str + "<option id='" + place[i].placeId + "' value='" + place[i].placeName + "'>";
                    }
                    $("#selectplace").html(str);
                    $('#place').bind('input propertychange', function () {
                        $("#selectplace").html(str);
                    });
                },
                dataType: 'json'
            });
        });
        function checkSelect() {
            var val = $("#goods").val();
            var val2 = $("#producer").val();
            var val3 = $("#place").val();
            var selectId = $("[value='" + val + "']").eq(0).attr('value');
            var selectId2 = $("[value='" + val2 + "']").eq(0).attr('id');
            var selectId3 = $("[value='" + val3 + "']").eq(0).attr('id');
            if (!val && !val2 && !val3) {
                alert("请输入至少一个查询选项");
                return false;
            }
            if (val != null && val != "") {
                if (selectId == undefined) {
                    alert("商品未建或未通过审核，输入商品后请选择选项框内带“|数字”的商品");
                    return false;
                }
            }
            if (val2 != null && val2 != "") {
                if (selectId2 == undefined) {
                    alert("商户未建或未通过审核，请选择选项框内的商户");
                    return false;
                }
            }
            if (val3 != null && val3 != "") {
                if (selectId3 == undefined) {
                    alert("仓库未建，请选择选项框内的仓库");
                    return false;
                }
            }
        }
    </script>
</head>

<body>
<div class="table-div">
    <div class="title">出库明细信息</div>
    <div class="btn-div">
        <form method="post" action="listokck.action" onsubmit="return checkSelect()" class="head-form">
            <div class="head-lable">商品名称：</div>
            <input id="goods" class="head-input" list="selectgoods" name="goodsName"/>
            <datalist id="selectgoods"></datalist>
            <div class="head-lable"> 商户名称：</div>
            <input id="producer" class="head-input" list="selectproducer" name="producerName"/>
            <datalist id="selectproducer"></datalist>
            <div class="head-lable">入库地点：</div>
            <input id="place" class="head-input" list="selectplace" name="placeName"/>
            <datalist id="selectplace"></datalist>
            <input type="submit" class="btn-remove head-btn-right" value="查询">
        </form>
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
            <th>预提单号</th>
            <th>出库类别</th>
            <th>出库状态</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.deliverlistok}" var="deliver">
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
                <td><s:property value="#deliver.withholding.withholdingId"/></td>
                <td><s:property value="#deliver.category"/></td>
                <td><s:property value="#deliver.state"/></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>

<%--<div id="dialog_edit" class="dialog-div">
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
                        <div class="lable">实际出库时间：</div>
                        <div class="input-div"><input name="deliver.deliverDate" type="date" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">预期出库数量：</div>
                        <div class="input-div"><input name="deliver.expecteNumber" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">实际出库数量：</div>
                        <div class="input-div"><input name="deliver.deliverNumber" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
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
                        <div class="lable">出库类别：</div>
                        <div class="input-div"><input readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">出库状态：</div>
                        <div class="input-div"><input readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>


                    <input type="submit" value="确定" class="btn-submit" onclick="$('#dialog_edit').hide();"/>
                    <input type="button" value="取消" class="btn-cancle" onclick="$('#dialog_edit').hide();"/>
                </form>
            </div>
        </div>
    </div>
</div>--%>
</body>
</html>
