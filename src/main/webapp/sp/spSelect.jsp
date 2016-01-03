<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>查询商品</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                type: "post",
                url: "selectAllGoodsJsonAction",
                success: function (data, xhrTxt) {
                    var str = "";
                    var d = eval("(" + data + ")");
                    var goods = d.goodsList;
                    console.log(goods);
                    for (var i = 0; i < goods.length; i++) {

                  //      str = str + "<option id='" + goods[i].goodsId + "' value='" + goods[i].goodsName + "'>";
                        str = str + "<option value='" + goods[i].goodsName + "'>";
                //        str = str + "<option value='" + goods[i].goodsName +"|"+goods[i].goodsId +"'>";
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
                alert("该商品不存在，请确认或重建");
                document.getElementById("div_item").innerHTML = "该商品不存在，请确认或重建!";
                return false;
            }
            else {
                return true;
            }
        }

        /*   function aaa() {
         var val = $("#item").val();
         var selectId = $("[value='" + val + "']").eq(0).attr('id');
         if (selectId == undefined) {
         console.log("该商品不存在");
         return;
         }
         console.log("val: " + val);
         console.log("Id: " + selectId);
         }*/
    </script>
</head>

<body>
<div class="title">查询商品</div>
<div class="content">
    <form method="post" action="spSelect" onsubmit="return check(this)">
        <div class="line">
            <div class="lable">商品名称：</div>
            <div class="input-div"><input id="item" list="select" placeholder="请输入要查询的商品名称" name="goodsName"/>
                <datalist id="select"></datalist>
            </div>
        </div>
        </br><span id="div_item"></span>
        <input type="submit" value="查找" class="btn-submit"/>
    </form>
</div>
</body>
</html>
