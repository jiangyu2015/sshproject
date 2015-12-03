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

        <input name="isResult" id="isResult" type="hidden" />
        <input name="companyname" id="companyname" value="" />
        <div id="isShowCompanyName" ></div>
        <div  class="bdsug" style="height: auto;" id="showCompanyname"></div> <br/>





        <input type="submit" value="提交" class="btn-submit"/>
    </form>
</div>
</body>
</html>
