<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/12/5
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>查询入库明细</title>
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
                         /*     str = str + "<option id='" + goods[i].goodsId + "' value='" + goods[i].goodsId + "'>"+ goods[i].goodsName+"</option>";*/
                    //  str = str + "<option value='" + goods[i].goodsName + "'>"+ goods[i].goodsId+"</option>";
                    //    str = str + "<option value='" + goods[i].goodsName + "'data-id='"+goods[i].goodsId+"'>"+ goods[i].goodsId+"</option>";
                        str = str + "<option value='" + goods[i].goodsName +"|"+goods[i].goodsId +"'>";
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
        function aaa(){
            var val = $("#item").val();
            var selectId = $("[value='" + val + "']").eq(0).attr('id');
            if(selectId == undefined){
                console.log("该商品不存在");
                return;
            }
            console.log("val: " + val);
            console.log("Id: " + selectId);
        }

      /*  function  find(){
            var val = $("#item").val();
            var strs = val.split('|');
            var value=strs[0];
            var id=strs[1];
            console.log(id + "," + value);
            $.ajax({
                type: "post",
                url: "selectStorageJsonAction",
                data: {
                    goodId: id,
                    goodNmae: value
                },
                success: function (data, xhrTxt) {

                },
                dataType: 'json'
            });
        }*/
    </script>
</head>

<body>
<div class="title">查询入库明细</div>
<div class="content">
    <form method="post" action="rkSelect.action">
        <div class="line">
            <div class="lable">商品名称：</div>
            <div class="input-div"><input id="item" list="select" placeholder="请输入要查询的入库商品名称" name="goodsName"/>
                <datalist id="select"></datalist>
            </div>
        </div>
        <div class="line">
            <div class="lable">商户名称：</div>
            <div class="input-div"><input id="item2" list="select2" placeholder="请输入要查询的入库商户名称" name="producerName"/>
                <datalist id="select2"></datalist>
            </div>
        </div>

        <div class="line">
            <div class="lable">仓库地址：</div>
            <div class="input-div"><input id="item3" list="select3" placeholder="请输入要查询的入库商户名称" name="storagePlace"/>
                <datalist id="select3"></datalist>
            </div>
        </div>


        <input type="submit" value="查找" class="btn-submit" <%--onclick="find();"--%>/>
    </form>
</div>
</body>
</html>
