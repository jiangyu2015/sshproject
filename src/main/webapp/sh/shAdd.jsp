<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>添加商户</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
</head>

<body>
<div class="title">添加商户</div>
<div class="content">
    <form method="post" action="shAdd">
        <div class="line">
            <div class="lable">商户名称：</div>
            <div class="input-div"><input placeholder="请输入商户名称" name="producer.producerName"/></div>
        </div>
        <div class="line">
            <div class="lable">商户地址：</div>
            <div class="input-div"><input placeholder="请输入商户地址" name="producer.producerAddress"/></div>
        </div>
        <div class="line">
            <div class="lable">联系人：</div>
            <div class="input-div"><input placeholder="请输入商户联系人" name="producer.linkman"/></div>
        </div>
        <div class="line">
            <div class="lable">联系电话1：</div>
            <div class="input-div"><input placeholder="请输入联系电话" name="producer.telOne"/></div>
        </div>
        <div class="line">
            <div class="lable">联系电话2：</div>
            <div class="input-div"><input placeholder="请输入备用联系电话" name="producer.telTwo"/></div>
        </div>
        <input type="submit" value="提交" class="btn-submit"/>
    </form>
</div>
</body>
</html>