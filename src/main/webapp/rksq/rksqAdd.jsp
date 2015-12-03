<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/11/26
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>添加入库申请信息</title>
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
                     //   str = str + "<option>" + goods[i].goodsName + "</option>";
                              str = str + "<option id='" + goods[i].goodsId + "' value='" + goods[i].goodsName + "'>";
                    }
                    $("#select").html(str);

                    $('#item').bind('input propertychange', function () {
                        $("#select").html(str);
                    });
                },
                dataType: 'json'
            });

            $.ajax({
                type: "post",
                url: "excuteProducerAjaxJsonAction",
                success: function (data, xhrTxt) {
                    var str = "";
//                    alert("sh");
                    var d = eval("(" + data + ")");
                    var producer = d.producerList;
                    console.log(producer);
                    for (var i = 0; i < producer.length; i++) {
                      //  str = str + "<option>" + producer[i].producerName + "</option>";
                              str = str + "<option id='" + producer[i].producerId + "' value='" + producer[i].producerName + "'>";
                    }
                    $("#select2").html(str);

                    $('#item2').bind('input propertychange', function () {
                        $("#select2").html(str);
                    });
                },
                dataType: 'json'
            });

            $.ajax({
                type: "post",
                url: "excutePlaceAjaxJsonAction",
                success: function (data, xhrTxt) {
                    var str = "";
//                    alert("ck");
                    var d = eval("(" + data + ")");
                    var place = d.placeList;
                    console.log(place);
                    for (var i = 0; i < place.length; i++) {
                       // str = str + "<option>" + place[i].placeName + "</option>";
                              str = str + "<option id='" + place[i].placeId  + "' value='" + place[i].placeName  + "'>";
                    }
                    $("#select3").html(str);

                    $('#item3').bind('input propertychange', function () {
                        $("#select3").html(str);
                    });
                },
                dataType: 'json'
            });
        });

    </script>
</head>
<body>
<div class="title">添加入库申请信息</div>
<div class="content">
    <form method="post" action="rksqAdd">
        <div class="line">
            <div class="lable">商户名称：</div>
            <div class="input-div"><input id="item2" list="select2" placeholder="请输入商户名称"
                                          name="storageApp.producerName"/>
                <datalist id="select2"></datalist>
            </div>
        </div>
        <div class="line">
            <div class="lable">商品名称：</div>
            <div class="input-div"><input id="item" list="select" placeholder="请输入商品名称" name="storageApp.goodsName"/>
                <datalist id="select"></datalist>
            </div>
        </div>
        <div class="line">
            <div class="lable">入库地点：</div>
            <div class="input-div"><input id="item3" list="select3" placeholder="请输入入库地点"
                                          name="storageApp.storagePlace"/>
                <datalist id="select3"></datalist>
            </div>
        </div>
        <div class="line">
            <div class="lable">商品评级：</div>
            <div class="input-div"><input placeholder="请输入商品评级" name="storageApp.commodityRating"/></div>
        </div>
        <div class="line">
            <div class="lable">预期入库时间：</div>
            <div class="input-div"><input placeholder="请输入预期入库时间" name="storageApp.expectedDate" type="date"/></div>
        </div>
        <div class="line">
            <div class="lable">预期入库数量：</div>
            <div class="input-div"><input placeholder="请输入预期入库数量" name="storageApp.expectedNumber"/></div>
        </div>
        <div class="line">
            <div class="lable">三联单编号：</div>
            <div class="input-div"><input placeholder="请输入三联单编号" name="storageApp.sldId"/></div>
        </div>
        <div class="line">
            <div class="lable">入库类型：</div>
            <div class="input-div"><input placeholder="请输入入库类型" name="storageApp.storageType"/></div>
        </div>
        <%--  <div class="line">
              <div class="lable">处理状态：</div>
              <div class="input-div"><input placeholder="请输入处理状态" name="storageApp.state"/></div>
          </div>--%>
        <input type="submit" value="提交" class="btn-submit"/>
    </form>
</div>
</body>
</html>
