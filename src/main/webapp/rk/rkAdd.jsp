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
</head>

<body>
<div class="title">添加入库信息</div>
<div class="content">
    <form method="post" action="rkAdd">
        <div class="line">
            <div class="lable">商品id：</div>
            <div class="input-div"><input placeholder="请输入商品id" name="storage.goodsId"/></div>
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
            <div class="input-div"><input placeholder="请输入入库类型" name="storage.storageType"/></div>
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
