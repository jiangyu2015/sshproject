<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/12/8
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>添加预提事件原由</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
</head>

<body>
<div class="title">添加预提事件原由</div>
<div class="content">
    <form method="post" action="eventsAdd">
        <div class="line">
            <div class="lable">事件名称：</div>
            <div class="input-div"><input placeholder="请输入预提时间原由" name="events.eventName"/></div>
        </div>
        <div class="line">
            <div class="lable">活动id：</div>
            <div class="input-div"><input placeholder="如事件有活动id，请输入" name="events.activityId"/></div>
        </div>
        <div class="line">
            <div class="lable">备注：</div>
            <div class="input-div"><input placeholder="请输入备注" name="events.remark"/></div>
        </div>

        <input type="submit" value="提交" class="btn-submit"/>
    </form>
</div>
</body>
</html>