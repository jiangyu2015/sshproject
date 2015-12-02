<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/12/1
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
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
           /* $('#item').bind('input propertychange', function () {
                $.ajax({
                    type: "post",
                    url: "excuteAjaxJsonAction",
                   data: {
                        item: $(this).val()
                  },
                    success: function (data, xhrTxt) {
                        var str = "";
                        alert("ok");
                        var d = eval("("+data+")");
                        var goods=d.goodsList;

                        console.log(goods);

                        for (var i = 0; i < goods.length; i++) {
                        //    str = str + "<option value=>"+goods[i].goodsId + goods[i].goodsName + "</option>";
                            str = str +"<option>"+goods[i].goodsName + "</option>";
                            alert("no"+str );
                   //     <option value="${items.goodsId}">${items.goodsName}</option>

                            $('#item').bind('input propertychange', function() {
                                $("#select").html(str);
                            });

                        }
                        $("#select").html(str);
                    },
                    dataType: 'json'
                });
            });
        });*/
           $.ajax({
                type: "post",
                url: "excuteAjaxJsonAction",
                success: function (data, xhrTxt) {
                    alert("ok");
                    var str = "";
                    var d = eval("("+data+")");
                    var goods=d.goodsList;
                    console.log(goods);
                    for (var i = 0; i < goods.length; i++) {
                       // str = str + "<option>" + goods[i].goodsName + "</option>";
                        str = str + "<option id='" +  goods[i].goodsId + "' value='" +  goods[i].goodsName + "'>";
                    }
                    $("#select").html(str);

                    $('#item').bind('input propertychange', function() {
                        $("#select").html(str);
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
    </script>
</head>
<body>
<div class="title">添加入库申请信息</div>
<div class="content">
    <form method="post" action="rksqAdd">

      <%--  <div class="line">
            <div class="lable">商品名称：</div>
            <div class="input-div"><input id="item" placeholder="请输入商品名称" name="storageApp.goodsName"/></div>
            <div id="result"></div>
            <select id="select"></select>
        </div>--%>

        <input id="item" list="select">
        <datalist id="select"></datalist>


        <%--<input type="submit" value="提交" class="btn-submit" onclick="aaa();"/>--%>
    </form>
<button  onclick="aaa();">sss</button>
</div>
</body>
</html>

