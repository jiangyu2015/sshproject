<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/12/10
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
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
    <title>查询预提明细</title>
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
                        str = str + "<option value='" + goods[i].goodsName + "|" + goods[i].goodsId + "'>";
                    }
                    $("#select").html(str);

                    $('#item').bind('input propertychange', function () {
                        $("#select").html(str);
                    });
                },
                dataType: 'json'
            });
        });
    </script>
</head>

<body>
<div class="title">查询预提明细</div>
<div class="content">

    <%-- <div class="line">
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
     </div>--%>
    <form method="post" action="ytSelectDeliver.action">
        <div class="line">
            <div class="lable">预提单号：</div>
            <div class="input-div"><input placeholder="请输入预提单号"
                                          name="withholding.withholdingId"/>
            </div>
        </div>
        <div class="line">
            <div class="lable">活动号：</div>
            <div class="input-div"><input placeholder="请输入预提时填写的活动号"
                                          name="withholding.activityId"/>

            </div>
        </div>
        <div class="line">
            <div class="lable">商品名称：</div>
            <div class="input-div"><input id="item" list="select" placeholder="请输入要查询的入库商品名称" name="goodsName"/>
                <datalist id="select"></datalist>
            </div>
        </div>
        <input type="submit" value="查找" class="btn-submit" <%--onclick="find();"--%>/>
    </form>
</div>
</body>
</html>
