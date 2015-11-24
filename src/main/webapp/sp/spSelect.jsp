<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>查询商品</title>
    <link type="text/css" rel="stylesheet" href="common.css"/>
</head>

<body>
<div class="title">查询商品</div>
<div class="content">
    <form method="post" action="spSelect" >
        <div class="line">
            <div class="lable">商品名称：</div>
            <div class="input-div"><input placeholder="请输入要查询的商品名称" name="goodsName"/></div>
        </div>
        <input type="submit" value="查找" class="btn-submit"/>
    </form>
</div>
</body>
</html>
