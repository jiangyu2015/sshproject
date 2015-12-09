<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/12/9
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>查询所需预提商品库存流动情况</title>
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

                        //      str = str + "<option id='" + goods[i].goodsId + "' value='" + goods[i].goodsName + "'>";
                        //   str = str + "<option>" + goods[i].goodsName + "</option>";
                        str = str + "<option value='" + goods[i].goodsName + "'>"
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

        function check() {
            var val = $("#item").val();
            //   var selectId = $("[value='" + val + "']").eq(0).attr('id');
            var selectId = $("[value='" + val + "']").eq(0).attr('value');

            if (selectId == undefined) {
                alert("该商品不存在");
                return;
            }
           /* alert("val: " + val);
            alert("Id: " + selectId);*/
        }
    </script>
</head>

<body>
<div class="title">查询商品库存流动情况</div>
<div class="content">
    <form method="post" action="ytSelect">
        <div class="line">
            <div class="lable">商品名称：</div>
            <div class="input-div"><input id="item" list="select" placeholder="请输入要查询的商品名称" name="goodsName"/>
                <datalist id="select"></datalist>
            </div>
        </div>
        <%-- <button  onclick="aaa();">sss</button>--%>
        <input type="submit" value="查找" class="btn-submit" onclick="check();"/>


    </form>
</div>
</body>
</html>

