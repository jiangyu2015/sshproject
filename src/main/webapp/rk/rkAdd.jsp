<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/11/27
  Time: 15:18
  To change this template use File | Settings | File Templates.

  没啥用了
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>添加入库信息</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <% if(session.getAttribute("goodslistall")==null){response.sendRedirect("listrk");} %>
</head>

<body>
<div class="title">添加入库信息</div>
<div class="content">
    <form method="post" action="rkAdd">
        <div class="line">
            <div class="lable">商品id：</div>
          <!--  <div class="input-div"><input placeholder="请输入商品id" name="storage.goodsId"/></div>  -->

            <select class="input-div" name="storage.goodsId" id="style">
                <option value="">请选择商品名称</option>
                <c:forEach items="${goodslistall}" var="items">
                    <option value="${items.goodsId}">${items.goodsName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="line">
            <div class="lable">仓库id：</div>
            <div class="input-div"><input placeholder="请输入仓库id" name="storage.placeId"/></div>
        </div>
        <div class="line">
            <div class="lable">实际入库时间：</div>
            <div class="input-div"><input placeholder="请输入实际入库时间" name="storage.storageDate" type="date"/></div>
        </div>
        <div class="line">
            <div class="lable">实收数量：</div>
            <div class="input-div"><input placeholder="请输入实收数量" name="storage.storageNumber"/></div>
        </div>
        <div class="line">
            <div class="lable">入库类型：</div>
            <!--  <div class="input-div"><input placeholder="请输入入库类型" name="storage.storageType"/></div>  -->
            <div class="input-div">
                <select name="storage.storageType">
                    <option value="调入">调入</option>
                    <option value="任意配置">任意配置</option>
                    <option value="一元购">一元购</option>
                    <option value="社区特卖">社区特卖</option>
                    <option value="物业礼包">物业礼包</option>
                    <option value="福利">福利</option>
                    <option value="福利（其他）">福利（其他）</option>
                </select>

            </div>
        </div>
        <div class="line">
            <div class="lable">备注：</div>
            <div class="input-div"><input placeholder="请输入备注" name="storage.remark"/></div>
        </div>

        <input type="submit" value="提交" class="btn-submit"/>
    </form>
</div>
</body>
</html>
