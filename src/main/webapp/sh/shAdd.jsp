<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>添加商户</title>
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
                $("#div_producerName").html("请输入商户名称!");
                return false;
            }
            if (producerAddress == null || producerAddress.length == 0 || isNull(producerAddress)) {
                $("#div_producerAddress").html("请输入商户地址!");
                return false;
            }
            if (linkman == null || linkman.length == 0 || isNull(linkman)) {
                $("#div_linkman").html("请输入联系人!");
                return false;
            }
            if ($('#telOne').val() == "" && $('#telTwo').val() == "") {
                $("#div_alert").html("请输入至少一个联系电话!");
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
<div class="title">添加商户</div>
<div class="content">
    <form method="post" action="shAdd.action" onsubmit="return check(this)">
        <div class="line">
            <div class="lable"><span>* </span>商户名称：</div>
            <div class="input-div">
                <input id="producerName" placeholder="请输入商户名称(不要空格)" name="producer.producerName"/>
                <span id="div_producerName"></span>
            </div>
        </div>
        <div class="line">
            <div class="lable"><span>* </span>商户地址：</div>
            <div class="input-div">
                <input id="producerAddress" placeholder="请输入商户地址" name="producer.producerAddress"/>
                <span id="div_producerAddress"></span>
            </div>
        </div>
        <div class="line">
            <div class="lable"><span>* </span>联系人：</div>
            <div class="input-div">
                <input id="linkman" placeholder="请输入商户联系人" name="producer.linkman"/>
                <span id="div_linkman"></span>
            </div>
        </div>
        <div class="line">
            <div class="lable">联系电话1：</div>
            <div class="input-div"><input id="telOne" placeholder="请输入联系电话" name="producer.telOne"/></div>
        </div>
        <div class="line">
            <div class="lable">联系电话2：</div>
            <div class="input-div"><input id="telTwo" placeholder="请输入备用联系电话" name="producer.telTwo"/></div>
        </div>
        <span id="div_alert"></span><br>
        <input type="submit" value="提交" class="btn-submit"/>
    </form>
</div>
</body>
</html>