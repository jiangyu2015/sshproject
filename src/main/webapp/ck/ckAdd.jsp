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
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                url: "doDeliverJsonAction",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
                data: {//设置数据源
                    id: GetQueryString("id")
                },
                dataType: "json",//设置需要返回的数据类型*/
                success: function (data, xhrTxt) {
                    var str = "";
                    var d = eval("(" + data + ")");
                    var goodsId = str + d.goodsId;
                    var goodsName = str + d.goodsName;
                    var placeId = str + d.placeId;
                    var placeName = str + d.placeName;
                    var producerId = str + d.producerId;
                    var producerName = str + d.producerName;
                    var type = str + d.type;
                    $('#goodsId').val(goodsId);
                    $('#goodsName').val(goodsName);
                    $('#placeId').val(placeId);
                    $('#placeName').val(placeName);
                    $('#type').val(type);
                    $('#producerId').val(producerId);
                    $('#producerName').val(producerName);
                    $('#id').val(GetQueryString("id"));
                },
                error: function () {
                    alert("系统异常，请稍后重试！");
                }//这里不要加","
            });
        });

        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null)return unescape(r[2]);
            return null;
        }

    </script>
</head>

<body>
<div class="title">添加出库信息</div>
<div class="content">
    <form method="post" action="ckAdd">
        <div class="line">
            <div class="lable">预提单id：</div>
            <div class="input-div"><input id="id" name="withholdingId" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable">商户id：</div>
            <div class="input-div"><input id="producerId" name="producerId" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable">商户名称：</div>
            <div class="input-div"><input id="producerName" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable">商品id：</div>
            <div class="input-div"><input id="goodsId" name="goodsId" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>

        <div class="line">
            <div class="lable">商品名称：</div>
            <div class="input-div"><input id="goodsName"  readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable">仓库id：</div>
            <div class="input-div"><input id="placeId" name="placeId" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>
        <div class="line">
            <div class="lable">仓库地址：</div>
            <div class="input-div"><input id="placeName" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>

        </div>
        <div class="line">
            <div class="lable">应发数量：</div>
            <div class="input-div"><input id="witholdingNumber" input name="deliver.expecteNumber"
                                          placeholder="请输入应发数量"/></div>
        </div>
        <div class="line">
            <div class="lable">实发数量：</div>
            <div class="input-div"><input  input name="deliver.deliverNumber"
                                          placeholder="请输入实发数量"/></div>
        </div>

        <div class="line">
            <div class="lable">出库时间：</div>
            <div class="input-div"><input name="deliver.deliverDate" placeholder="请输入出库时间" type="date"/></div>
        </div>

        <div class="line">
            <div class="lable">使用类型：</div>
            <div class="input-div"><input id="type" name="withholding.useType" readonly="readonly"
                                          style="border: none;-webkit-box-shadow: none;"/></div>
        </div>


        <input type="submit" value="提交" class="btn-submit" />
    </form>
</div>
</body>
</html>

