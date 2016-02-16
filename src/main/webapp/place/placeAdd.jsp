<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2016/2/16
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>添加仓库</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript">
        function check(form) {
            var producerName = $('#producerName').val().replace(/\s/g, "");
            $('#producerName').val(producerName);
            var producerAddress = $('#producerAddress').val();
            var linkman = $('#linkman').val();
            $(".input-div span").html("");
            $("#div_alert").html("");
            if (producerName == null || producerName.length == 0 || isNull(producerName)) {
                $("#div_producerName").html("请输入仓库名称!");
                return false;
            }
            if (producerAddress ==null || producerAddress.length == 0 || isNull(producerAddress)) {
                $("#div_producerAddress").html("请输入仓库地址!");
                return false;
            }
            if (linkman ==null || linkman.length == 0 || isNull(linkman)) {
                $("#div_linkman").html("请输入联系人!");
                return false;
            }
            if ($('#telOne').val() == "") {
                $("#div_alert").html("请输入联系电话");
                return false;
            }
        }
        function isNull(str) {
            if (str == "") return true;
            var regu = "^[ ]+$";
            var re = new RegExp(regu);
            return re.test(str);
        }
    </script>
</head>

<body>
<div class="title">添加仓库</div>
<div class="content">
    <form method="post" action="addPlace" onsubmit="return check(this)">
        <div class="line">
            <div class="lable"><span>* </span>仓库名称：</div>
            <div class="input-div">
                <input id="producerName" placeholder="请输入仓库名称(不要空格)" name="place.placeName"/>
                <span id="div_producerName"></span>
            </div>
        </div>
        <div class="line">
            <div class="lable"><span>* </span>仓库地址：</div>
            <div class="input-div">
                <input id="producerAddress" placeholder="请输入仓库地址" name="place.address"/>
                <span id="div_producerAddress"></span>
            </div>
        </div>
        <div class="line">
            <div class="lable"><span>* </span>联系人：</div>
            <div class="input-div">
                <input id="linkman" placeholder="请输入商户联系人" name="place.receiver"/>
                <span id="div_linkman"></span>
            </div>
        </div>
        <div class="line">
            <div class="lable">联系电话：</div>
            <div class="input-div"><input id="telOne" placeholder="请输入联系电话" name="place.tel"/></div>
        </div>
        <span id="div_alert"></span><br>
        <input type="submit" value="提交" class="btn-submit"/>
    </form>
</div>
</body>
</html>