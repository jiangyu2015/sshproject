<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/12/10
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         import="java.sql.*,com.hibtest1.entity.*,java.util.*"
         pageEncoding="utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>预提信息</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript">
        function doDeliver() {
            if ($(".active").length == 0) {
                alert('请选择要出库的行');
            } else {
                var $tds = $("tr.active").children();
                if ($tds.eq(10).text() == $('#sumwithholdingdeliver').html()) {
                    alert("预提消耗已等于预提数，不能出库");
                }
                else {
                    alert("预提" + $tds.eq(10).text() + "出库数" + $('#sumwithholdingdeliver').html());
                    $.ajax({
                        success: function () {
                            window.location.href = "ckAdd.jsp?id=" + $tds.eq(0).text() +
                                    "&withholdingNumber=" + $tds.eq(10).text() + "&witholdingDate=" + $tds.eq(11).text() +
                                    "&deteline=" + $tds.eq(12).text();
                        },
                        error: function () {
                            alert("系统异常，请稍后重试！");
                        }//这里不要加","
                    });
                }
            }
        }

        function doRelease() {
            if ($(".active").length == 0) {
                alert('请选择要释放的行');
            } else {
                if (document.getElementById("sess").value != "梁吉") {
                    alert('只有梁吉鸽鸽可以释放！');
                }
                else {
                    var deteline = $("tr.active").children().eq(12).text();
                    var arr = deteline.split("-");                    //比较时间
                    var overday = new Date(arr[0], arr[1], arr[2]);
                    var overdays = overday.getTime(); //截止时间
                    var arrs = getToDay().split("-");
                    var today = new Date(arrs[0], arrs[1], arrs[2]);
                    var todays = today.getTime();

                    if (overdays < todays)
                        alert('预提已结束，无需释放');
                    else {
                        $.ajax({
                            url: "doReleaseJsonAction",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
                            data: {//设置数据源
                                id: $("tr.active").children().eq(0).text()
                            },
                            dataType: "json",//设置需要返回的数据类型*/
                            success: function (data, xhrTxt) {
                                alert('预提已释放');
                                window.location.href = "ytSelectDeliver.action?id=" + $("tr.active").children().eq(0).text() + "&timeId=4";

                            },
                            error: function () {
                                alert("系统异常，请稍后重试！");
                            }//这里不要加","
                        });
                    }

                }
            }
        }

        var newdate = null;
        function getToDay() {   //获取今天的日子
            var now = new Date();
            var nowYear = now.getFullYear();
            var nowMonth = now.getMonth();
            var nowDate = now.getDate();
            newdate = new Date(nowYear, nowMonth, nowDate);
            nowMonth = doHandleMonth(nowMonth + 1);
            nowDate = doHandleMonth(nowDate);
            return nowYear + "-" + nowMonth + "-" + nowDate;
        }

        function doHandleMonth(month) {
            if (month.toString().length == 1) {
                month = "0" + month;
            }
            return month;
        }

        $(function () {
            $("#advSearch tbody tr").bind('click', function () {
                $('table tr').removeClass('active');
                $(this).addClass('active');
            });
        });
        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null)return unescape(r[2]);
            return null;
        }

    </script>
</head>

<body>
<div class="title">预提信息</div>
<div class="btn-div">
    <input type="button" class="btn-eidt" value="预提消耗" onclick="doDeliver();" style="position: relative; width: 90px;"/>
    当前预提消耗为： <span id="sumwithholdingdeliver"><%=session.getAttribute("sumwithholdingdeliver")%></span>
    <input type="button" class="btn-eidt" value="预提释放" onclick="doRelease();"
           style="position: absolute; width: 90px; right: 10px;"/>
    <input type="hidden" id="sess" name="hiddenField" value=<%=session.getAttribute("name")%>>

</div>

<table id="advSearch" class="table">
    <thead>
    <tr>
        <th>预提单id</th>
        <th>商户id</th>
        <th>商户名称</th>
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
    <s:iterator value="%{#session.withholdinglist}" var="withholding">
        <tr>
            <td><s:property value="#withholding.withholdingId"/></td>
            <td><s:property value="#withholding.producer.producerId"/></td>
            <td><s:property value="#withholding.producer.producerName"/></td>
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
<div class="title">该预提对应出库明细信息</div>
<table id="advSearch1" class="table">
    <thead>
    <tr>
        <th>出库明细id</th>
        <th>商户id</th>
        <th>商户名称</th>
        <th>商品id</th>
        <th>商品名称</th>
        <th>仓库id</th>
        <th>仓库名称</th>
        <th>实际出库时间</th>
        <th>预期出库数量</th>
        <th>实际出库数量</th>
        <th>出库类型</th>
        <th>备注</th>
        <th>出库填写人</th>
        <th>预提id</th>
    </tr>
    </thead>
    <tbody1>
        <s:iterator value="%{#session.deliverytlist}" var="deliver">
            <tr>
                <td><s:property value="#deliver.deliverId"/></td>
                <td><s:property value="#deliver.producer.producerId"/></td>
                <td><s:property value="#deliver.producer.producerName"/></td>
                <td><s:property value="#deliver.goods.goodsId"/></td>
                <td><s:property value="#deliver.goods.goodsName"/></td>
                <td><s:property value="#deliver.place.placeId"/></td>
                <td><s:property value="#deliver.place.placeName"/></td>
                <td><s:date format="yyyy-MM-dd" name="#deliver.deliverDate"/></td>
                <td><s:property value="#deliver.expecteNumber"/></td>
                <td><s:property value="#deliver.deliverNumber"/></td>
                <td><s:property value="#deliver.deliverType"/></td>
                <td><s:property value="#deliver.remark"/></td>
                <td><s:property value="#deliver.adduser"/></td>
                <td><s:property value="#deliver.withholding.withholdingId"/></td>
            </tr>
        </s:iterator>
    </tbody1>
</table>
</body>
</html>
