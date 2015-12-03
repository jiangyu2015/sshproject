<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/11/27
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>添加入库信息</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <style>
        .bdsug {
            background: none repeat scroll 0 0 #fff;
            border: 1px solid #ccc;
            box-shadow: 1px 1px 3px #ededed;
            display: none;
            position: absolute;
            width: 538px;
            z-index: 1;
        }
    </style>
    <script>
        var timer = "";
        //异步模糊查询供应商
        $("#goodsName").keyup(function () {
            clearTimeout(timer);
            $("#showCompanyname").empty();
            var companyname = $("#companyname").val();
            //alert(companyname);
            if (goodsName) {

                timer = setTimeout(function () {
                    $.ajax({
                        url: "<%=request.getContextPath() %>/listGoodsTest.action",
                        type: "POST",
                        data: {"goodsName": goodsName},
                        async: true,
                        dataType: "json",
                        success: function (data) {
                            if (data && data.list && data.list.length) {
                                var $ul = $("<ul></ul>");
                                for (var i = 0; i < data.list.length; i++) {
                                    var $li = $("<li></li>");
                                    $li.text(data.list[i].goodsName);
                                    $ul.append($li);
                                    $li.click(function () {

                                        $("#companyname").val($li.text());
                                        $("#showCompanyname").hide();
                                        $("#isResult").val(1);

                                    });
                                }
                                $("#showCompanyname").append($ul).show();
                            } else {
                                $("#isResult").val(0);
                            }
                        }
                    });
                }, 500);
            } else {
                $("#isResult").val(0);
                $("#showCompanyname").hide();
            }
        }).blur(function () {
            if ($("#isResult").val) {
                $(this).val("");
            }
        });


        $("body").click(function () {
            $("#showCompanyname").attr("style", "display:none");//单个属性的设置

        });
    </script>
    <!--   <% if(session.getAttribute("goodslistall")==null){response.sendRedirect("listrk");} %>  -->
</head>

<body>
<div class="title">添加入库信息</div>
<div class="content">
    <form method="post" action="rkAdd">
        <div class="line">
            <div class="lable">商品id：</div>
            <!--  <div class="input-div"><input placeholder="请输入商品id" name="storage.goodsId"/></div>

            <select class="input-div" name="storage.goodsId" id="style">
                <option value="">请选择商品名称</option>
                <c:forEach items="${goodslistall}" var="items">
                    <option value="${items.goodsId}">${items.goodsName}</option>
                </c:forEach>
            </select>  -->
        </div>
        <div class="line">
            <div class="lable">商品名称：</div>
            <div class="input-div"><input placeholder="请输入商品名称" name="storageApp.goodsName"/></div>


            <input name="isResult" id="isResult" type="hidden"/>
            <input name="storageApp.goodsName" id="goodsName" value=""/>

            <div id="isShowCompanyName"></div>
            <div class="bdsug" style="height: auto;" id="showCompanyname"></div>
            <br/>
        </div>


        <input type="submit" value="提交" class="btn-submit"/>
    </form>
</div>
</body>
</html>
