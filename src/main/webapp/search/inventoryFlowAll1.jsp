<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/12/13
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript">
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
                        str = str + "<option value='" + goods[i].goodsName + "'>";
                    }
                    $("#select").html(str);
                    $('#item').bind('input propertychange', function () {
                        $("#select").html(str);
                    });
                },
                dataType: 'json'
            });
        });
        function check1() {
            var val = $("#item").val();
            var selectId = $("[value='" + val + "']").eq(0).attr('value');
            if (selectId == undefined) {
                alert("该商品不存在，没有通过审核或没有建立，请确认!输入商品名称选择选项框内选项，无需添加|商品id!");
                return false;
            }
            else  return true;
        }
        function check2() {
            var goods = $("#goods").val();
            if (goods == "") {
                alert("请输入商品名称");
                return false;
            }
            else  return true;
        }
    </script>
</head>
<body>
<div class="table-div">
    <div class="title">商品库存流动信息</div>
    <form method="post" action="inventoryFlowSelect.action" onsubmit="return check1()" class="head-form" style="float: left;">
        <div class="head-lable">商品名称：</div>
        <input id="item" class="head-input" list="select" name="goodsName" style="width: 180px;"/>
        <datalist id="select"></datalist>
        <input type="submit" class="btn-remove head-btn-right" value="查询">
    </form>
    <form method="post" action="inventoryFlowSelect.action" onsubmit="return check2()" class="head-form">
        <div class="head-lable"></div>
        <input id="goods" class="head-input"  name="goodsName" style="width: 180px;"/>
        <input type="submit" class="btn-remove head-btn-right" value="模糊查询" style="width: 90px;"/>
    </form>
    <table id="advSearch" class="table">
        <thead>
        <tr>
            <th>id</th>
            <th>商户id</th>
            <th>商户名称</th>
            <th>商品id</th>
            <th>商品名称</th>
            <th>库存id</th>
            <th>库存地点名称</th>
            <%--   <th>总应收数</th>--%>
            <th>总入库数</th>
            <th>总出库数</th>
            <th>账面剩余库存数</th>
            <th>预提数</th>
            <th>预提消耗</th>
            <th>剩余预提</th>
            <th>预提后可用库存</th>
            <th>使用类型</th>
            <th>备注</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.inventoryflowall}" var="inventoryflow">
            <tr>
                <td><s:property value="#inventoryflow.id"/></td>
                <td><s:property value="#inventoryflow.producerId"/></td>
                <td><s:property value="#inventoryflow.producerName"/></td>
                <td><s:property value="#inventoryflow.goodsId"/></td>
                <td><s:property value="#inventoryflow.goodsName"/></td>
                <td><s:property value="#inventoryflow.placeId"/></td>
                <td><s:property value="#inventoryflow.placeName"/></td>
                    <%--       <td><s:property value="#inventoryflow.expectNumber"/></td>--%>
                <td><s:property value="#inventoryflow.totolStorage"/></td>
                <td><s:property value="#inventoryflow.totolDeliver"/></td>
                <td><s:property value="#inventoryflow.carryingExcessInventory"/></td>
                <td><s:property value="#inventoryflow.withholdingNumber"/></td>
                <td><s:property value="#inventoryflow.withholdingConsume"/></td>
                <td><s:property value="#inventoryflow.surplusWithholdingNumber"/></td>
                <td><s:property value="#inventoryflow.availableInventory"/></td>
                <td><s:property value="#inventoryflow.type"/></td>
                <td><s:property value="#inventoryflow.remark"/></td>

            </tr>
        </s:iterator>
        <s:iterator value="%{#session.pagebeancommoditydto}" var="pageBean">
            <div class="divcss5">
                <tr>
                    <td colspan="15" align="center" bgcolor="#5BA8DE">
                        <a class="bar-margin">共<s:property value="#pageBean.allRow"/>条记录</a>
                        <a class="bar-margin">共<s:property  value="#pageBean.totalPage"/>页</a>
                        <a class="bar-margin">当前第<s:property value="#pageBean.currentPage"/>页</a><br>
                        <s:if test="%{#pageBean.currentPage == 1}">
                            <a class="bar-margin">第一页</a><a class="bar-margin">上一页</a>
                        </s:if> <!-- currentPage为当前页 --> <s:else>
                            <a class="bar-margin" href="searchall.action?page=1">第一页</a>
                            <a class="bar-margin" href="searchall.action?page=<s:property value="%{#pageBean.currentPage-1}"/>">上一页</a>
                        </s:else>
                        <s:if test="%{#pageBean.currentPage != #pageBean.totalPage}">
                            <a class="bar-margin" href="searchall.action?page=<s:property value="%{#pageBean.currentPage+1}"/>">下一页</a>
                            <a class="bar-margin" href="searchall.action?page=<s:property value="#pageBean.totalPage"/>">最后一页</a>
                        </s:if> <s:else>
                            <a class="bar-margin">下一页</a><a class="bar-margin">最后一页</a>
                        </s:else>
                    </td>
                </tr>
            </div>
        </s:iterator>
        </tbody>
    </table>
</div>
</body>
</html>

