<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/12/10
  Time: 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>预提信息</title>
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
    <div class="title">所有预提信息</div>
    <div class="btn-div">
        <form method="post" action="listyt.action" onsubmit="return checkSelect()" class="head-form">
            <div class="head-lable">商品名称：</div>
            <input id="goods" class="head-input" list="selectgoods" name="goodsName" onchange="getInfo()"/>
            <datalist id="selectgoods"></datalist>
            <div class="head-lable"> 商户名称：</div>
            <input id="producer" class="head-input" list="selectproducer" name="producerName"/>
            <datalist id="selectproducer"></datalist>
            <div class="head-lable">入库地点：</div>
            <input id="place" class="head-input" list="selectplace" name="storagePlace"/>
            <datalist id="selectplace"></datalist>
            <input type="submit" class="btn-remove head-btn-right" value="查询">
        </form>
    </div>
    <table id="advSearch" class="table">
        <thead>
        <tr>
            <th>预提单id</th>
            <th>商品id</th>
            <th>商品名称</th>
            <th>仓库id</th>
            <th>入库地点</th>
            <th>使用原由</th>
            <th>活动id</th>
            <th>单位</th>
            <th>预提数</th>
            <th>预提时间</th>
            <th>截止时间</th>
            <th>入库类型</th>
            <th>预提人</th>

        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.withholdinglistall}" var="withholding">
            <tr>
                <td><s:property value="#withholding.withholdingId"/></td>
                <td><s:property value="#withholding.goods.goodsId"/></td>
                <td><s:property value="#withholding.goods.goodsName"/></td>
                <td><s:property value="#withholding.place.placeId"/></td>
                <td><s:property value="#withholding.place.placeName"/></td>
                <td><s:property value="#withholding.events"/></td>
                <td><s:property value="#withholding.activityId"/></td>
                <td><s:property value="#withholding.unit"/></td>
                <td><s:property value="#withholding.witholdingNumber"/></td>
                <td><s:date format="yyyy-MM-dd" name="#withholding.witholdingDate"/></td>
                <td><s:date format="yyyy-MM-dd" name="#withholding.deteline"/></td>
                <td><s:property value="#withholding.useType"/></td>
                <td><s:property value="#withholding.adduser"/></td>

            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>


</body>
</html>