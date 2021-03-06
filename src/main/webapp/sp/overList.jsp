<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2016/2/15
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>已过期商品信息</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>
    <script>
        function spDel() {
            if ($(".active").length == 0) {
                alert('请选择要修改的行');
            } else {
                var $tds = $("tr.active").children();
                var id = $tds.eq(0).text();
                $.ajax({
                    type: "post",
                    data: {//设置数据源
                        goodsId: id
                    },
                    url: "deleteGoodsJsonAction",
                    success: function (data, xhrTxt) {
                        window.location.href = "overGoods.action";
                    },
                    error: function () {
                        alert("系统异常，请稍后重试！");
                    },
                    dataType: 'json'
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
    <div class="title">以下为过期商品</div>
    <div class="btn-div">
        <input type="button" class="btn-eidt" value="删除" onclick="spDel();">
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
            <th>商品评级</th>
            <th>审核时间</th>
            <th>新建人</th>
            <th>修改人</th>
            <th>审核人</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.goodslist}" var="goods">
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
                <td><s:property value="#goods.commodityRating"/></td>
                <td><s:date format="yyyy-MM-dd hh:mm:ss" name="#goods.auditTime"/></td>
                <td><s:property value="#goods.adduser"/></td>
                <td><s:property value="#goods.edituser"/></td>
                <td><s:property value="#goods.checkuser"/></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>

</body>
</html>
