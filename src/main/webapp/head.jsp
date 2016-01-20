<%@ page language="java" contentType="text/html; charset=utf-8"
         import="java.sql.*,com.hibtest1.entity.*,java.util.*"
         pageEncoding="utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>标题</title>
    <link rel="stylesheet" href="style.css" type="text/css"/>
    <style type="text/css">
        #top {
            width: 100% !important;
            margin: 0px auto;
        }

        #vi {
            height: 120px;
            background: #E8E8E8;
            width: 100%;
        }
    </style>
</head>

<body>
<div id="top">
    <div id="top_txt">
        您好，<%=session.getAttribute("name")%>
        <a href="index.html" target="_parent">   |  退出系统</a>
    </div>
    <h5>
        <em>
            <marquee scrollamount="6" behavior="alternate" loop="3" style=" margin-left: 300px">欢迎进入仓库管理系统</marquee>
        </em>
    </h5>
</div>
<div id="vi">
    <div id="photo">
        <img src="picture/logo.png">
    </div>
</div>
</body>
</html>