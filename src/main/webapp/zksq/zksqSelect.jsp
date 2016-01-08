<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/12/27
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>查询所需转库商品库存流动情况</title>
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

        function check(form) {
            var val = $("#item").val();
            //   var selectId = $("[value='" + val + "']").eq(0).attr('id');
            var selectId = $("[value='" + val + "']").eq(0).attr('value');

            if (selectId == undefined) {
                alert("该商品不存在，没有通过审核或没有入库，请确认");
                document.getElementById("div_item").innerHTML = "该商品不存在，没有通过审核或没有建立，请确认!输入商品名称选择选项框内选项，无需添加|商品id!";
                return false;
            }
            else  return true;
        }
    </script>
</head>

<body>
<div class="title">查询商品库存流动情况</div>
<div class="content">
    <form method="post" action="zkSelect" onsubmit="return check(this)">
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

