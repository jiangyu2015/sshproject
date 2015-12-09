<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript">

        function doWithholding() {
            if ($(".active").length == 0) {
                alert('请选择要修改的行');
            } else {
                var $tds = $("tr.active").children();
                alert($tds.eq(0).text())
                $.ajax({
                  /*  type: "post",
                    url: "doWithholdingJsonAction",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
                    data: {//设置数据源
                        id: $tds.eq(0).text()
                    },*/
                  /*  dataType: "json",//设置需要返回的数据类型*/
                    success: function () {
                        window.location.href = "ytsqAdd.jsp?id="+$tds.eq(0).text();
                    },
                    error: function () {
                        alert("系统异常，请稍后重试！");
                    }//这里不要加","
                });
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
        <input type="button" class="btn-eidt" value="预提申请" onclick="doWithholding();">

    </div>
    <table id="advSearch" class="table">
        <thead>
        <tr>
            <th>入库明细id</th>
            <th>商户名称</th>
            <th>商品名称</th>
            <th>库存名称</th>
            <th>初次入库时间</th>
            <th>初次入库数量</th>
            <th>总应收数</th>
            <th>总入库数</th>
            <th>总出库数</th>
            <th>账面剩余库存数</th>
            <th>入库类型</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.inventoryflow}" var="inventoryflow">
            <tr>
                <td id="storageId"><s:property value="#inventoryflow.id"/></td>
                <td><s:property value="#inventoryflow.producerName"/></td>
                <td><s:property value="#inventoryflow.goodsName"/></td>
                <td><s:property value="#inventoryflow.placeName"/></td>
                <td><s:date format="yyyy-MM-dd" name="#inventoryflow.firstStorageTime"/></td>
                <td><s:property value="#inventoryflow.firstStorageNumber"/></td>
                <td><s:property value="#inventoryflow.expectNumber"/></td>
                <td><s:property value="#inventoryflow.totolStorage"/></td>
                <td><s:property value="#inventoryflow.totolDeliver"/></td>
                <td><s:property value="#inventoryflow.carryingExcessInventory"/></td>
                <td><s:property value="#inventoryflow.type"/></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>


</body>
</html>
