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
            var producerName = $('#producerName').val();
            var producerAddress = $('#producerAddress').val();
            var linkman = $('#linkman').val();
            if (producerName == "") {
                document.getElementById("div_producerName").innerHTML = "请输入商户名称!";
                return false;
            }
            if (producerAddress == "") {
                document.getElementById("div_producerAddress").innerHTML = "请输入商户地址!";
                return false;
            }
            if (linkman == "") {
                document.getElementById("div_linkman").innerHTML = "请输入联系人!";
                return false;
            }
            if ($('#telOne').val() == "" && $('#telTwo').val() == "") {
                document.getElementById("div_alert").innerHTML = "请输入至少一个联系电话!";
                return false;
            }
        }
    </script>
</head>

<body>
<div class="title">添加商户</div>
<div class="content">
    <form method="post" action="shAdd" onsubmit="return check(this)">
        <div class="line">
            <div class="lable">商户名称：</div>
            <div class="input-div"><input id="producerName" placeholder="请输入商户名称" name="producer.producerName"/>
                &nbsp;<span id="div_producerName"></span></div>
        </div>
        <div class="line">
            <div class="lable">商户地址：</div>
            <div class="input-div"><input id="producerAddress" placeholder="请输入商户地址" name="producer.producerAddress"/>&nbsp;<span
                    id="div_producerAddress"></span></div>
        </div>
        <div class="line">
            <div class="lable">联系人：</div>
            <div class="input-div"><input id="linkman" placeholder="请输入商户联系人" name="producer.linkman"/>&nbsp;<span
                    id="div_linkman"></span></div>
        </div>
        <div class="line">
            <div class="lable">联系电话1：</div>
            <div class="input-div"><input id="telOne" placeholder="请输入联系电话" name="producer.telOne"/></div>
        </div>
        <div class="line">
            <div class="lable">联系电话2：</div>
            <div class="input-div"><input id="telTwo" placeholder="请输入备用联系电话" name="producer.telTwo"/></div>
        </div>
        &nbsp;<span id="div_alert"></span>

        <input type="submit" value="提交" class="btn-submit"/>
    </form>
</div>
</body>
</html>