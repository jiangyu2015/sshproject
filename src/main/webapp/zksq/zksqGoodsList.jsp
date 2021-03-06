<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/12/27
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript">

        function doWithholding() {
            if ($(".active").length == 0) {
                alert('请选择要修改的行');
                return;
            } else {
                var $tds = $("tr.active").children();
                if ($tds.eq(13).text() == 0) {
                    alert("可用库存为0，不可转库");
                    return;
                }
                else {
                    $.ajax({
                        success: function () {
                            window.location.href =encodeURI(encodeURI( "zksqAdd.jsp?id=" + $tds.eq(0).text() + "&producerId="
                                    + $tds.eq(1).text() + "&producerName=" + $tds.eq(2).text() + "&goodsId=" + $tds.eq(3).text() + "&goodsName=" + $tds.eq(4).text()
                                    + "&placeId="+$tds.eq(5).text()+"&placeName=" + $tds.eq(6).text()+"&type="+$tds.eq(14).text()));
                        },
                        error: function () {
                            alert("系统异常，请稍后重试！");
                        }//这里不要加","
                    });
                }
            }
        }

        $(function () {
            $("tbody tr").bind('click', function () {
                $('table tr').removeClass('active');
                $(this).addClass('active');
            });
        });

    </script>

</head>
<body>
<div class="table-div">
    <div class="title">库存仓库信息</div>
    <div class="btn-div">
        <input type="button" class="btn-eidt" value="转库申请" onclick="doWithholding();"
               style="position: relative; width: 90px;"/>

    </div>
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
            <th>入库类型</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.inventoryflowgoods}" var="inventoryflow">
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

            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>


</body>
</html>

