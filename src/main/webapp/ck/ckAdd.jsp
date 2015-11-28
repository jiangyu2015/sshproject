<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2015/11/28
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>添加出库信息</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
</head>

<body>
<div class="title">添加出库信息</div>
<div class="content">
    <form method="post" action="ckAdd">
        <div class="line">
            <div class="lable">商品id：</div>
            <div class="input-div"><input placeholder="请输入商品id" name="deliver.goodsId"/></div>
        </div>
        <div class="line">
            <div class="lable">仓库id：</div>
            <div class="input-div"><input placeholder="请输入仓库id" name="deliver.placeId"/></div>
        </div>
        <div class="line">
            <div class="lable">实际出库时间：</div>
            <div class="input-div"><input placeholder="请输入实际出库时间" name="deliver.deliverDate" type="date"/></div>
        </div>
        <div class="line">
            <div class="lable">预期出库数量：</div>
            <div class="input-div"><input placeholder="请输入预期出库数量" name="deliver.expecteNumber"/></div>
        </div>
        <div class="line">
            <div class="lable">实际出库数量：</div>
            <div class="input-div"><input placeholder="请输入实际出库数量" name="deliver.deliverNumber"/></div>
        </div>
        <div class="line">
            <div class="lable">出库类型：</div>
            <div class="input-div"><input placeholder="请输入出库类型" name="deliver.deliverType"/></div>
        </div>
        <div class="line">
            <div class="lable">备注：</div>
            <div class="input-div"><input placeholder="请输入备注" name="deliver.remark"/></div>
        </div>
        <input type="submit" value="提交" class="btn-submit"/>
    </form>
</div>
</body>
</html>

