<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/12/12
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>查询未审核商品</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                type: "post",
                url: "selectAllNoGoodsJsonAction",
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


        function check(form) {
            var val = $("#item").val();
            var selectId = $("[value='" + val + "']").eq(0).attr('value');
            if (selectId == undefined) {
                alert("该商品已审核或不存在");
                document.getElementById("div_item").innerHTML = "该商品已审核或不存在!";
                return false;
            }
            else {
                return true;
            }
        }

    </script>
</head>

<body>
<div class="title">查询未审核商品</div>
<div class="content">
    <form method="post" action="spSelectCheck" onsubmit="return check(this)">
        <div class="line">
            <div class="lable">商品名称：</div>
            <div class="input-div"><input id="item" list="select" placeholder="请输入要查询的商品名称" name="goodsName"/>
                <datalist id="select"></datalist>
            </div>
        </div>
        <span id="div_item"></span><br>
        <input type="submit" value="查找" class="btn-submit"/>
    </form>
</div>
</body>
</html>

