<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/12/4
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>入库明细信息</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>

    <script>
        function edit() {
            if ($(".active").length == 0) {
                alert('请选择要修改的行');
            } else {
                var $tds = $("tr.active").children();
                var $lines = $("#dialog_edit").find('form').children();
                for (var i = 0, len = $tds.length; i < len; i++) {
                    var $line = $lines.eq(i);
                    $line.find('input').val($tds.eq(i).text());

                }

                $("#dialog_edit").show();
            }
        }

        var _move = false;//移动标记
        var _x, _y;//鼠标离控件左上角的相对位置

        $(function () {
            $("tbody tr").bind('click', function () {
                $('table tr').removeClass('active');
                $(this).addClass('active');
            });
            var width = $(document).width();
            var height = $(document).height();
            $(".dialog-content .title").click(function () {
            }).mousedown(function (e) {
                _move = true;
                _x = e.pageX - parseInt($(".dialog-content").css("left"));
                _y = e.pageY - parseInt($(".dialog-content").css("top"));
            });
            $(document).mousemove(function (e) {
                if (_move) {
                    var x = e.pageX - _x;//移动时根据鼠标位置计算控件左上角的绝对位置
                    var y = e.pageY - _y;

                    if (x <= 0) {
                        x = 0;
                    } else if (x >= 0.2 * width) {
                        x = 0.2 * width;
                    }

                    if (y <= 0) {
                        y = 0;
                    } else if (y >= (0.2 * height)) {
                        y = 0.2 * height;
                    }

                    $(".dialog-content").css({top: y, left: x});//控件新位置
                }
            }).mouseup(function () {
                _move = false;
            });
        });

        function check(form) {
            var storageDate = $("#storageDate").val();  //实际入库时间
            var expectedNumber = $("#expectedNumber").val(); //预期入库数
            var storageNumber = $("#storageNumber").val(); //实收数量    实收数量和预期入库数到时候再说
            var arr = getToDay().split("-");    //比较时间
            var today = new Date(arr[0], arr[1], arr[2]);  //今天
            var todays = today.getTime();
            var arrs = storageDate.split("-");
            var storageday = new Date(arrs[0], arrs[1], arrs[2]); //实际入库时间
            var storagedays = storageday.getTime();
            if (storagedays > todays) {
                alert("确认收货不成功，实际入库时间比今天大？真的入库了再来填，拜拜！");
               return  false;
            }
            else {
                alert("确认收货成功");
               return true;
            }
        }

        var newdate = null;
        function getToDay() {   //获取今天的日子
            var now = new Date();
            var nowYear = now.getFullYear();
            var nowMonth = now.getMonth();
            var nowDate = now.getDate();
            newdate = new Date(nowYear, nowMonth, nowDate);
            nowMonth = doHandleMonth(nowMonth + 1);
            nowDate = doHandleMonth(nowDate);
            return nowYear + "-" + nowMonth + "-" + nowDate;
        }

        function doHandleMonth(month) {
            if (month.toString().length == 1) {
                month = "0" + month;
            }
            return month;
        }

		function selectCategory(){
            var type=$("#type").val();
        	alert("选择了:"+type);
            if(type="入库类型"){
                window.location.href="rkcheck.action";
            }else if(type=="正常调拨"){
                window.location.href="zcdbstorage.action";
            }
            else if(type=="正常入库"){
                window.location.href="zcrkstorage.action";
            }
        }
    </script>
</head>

<body>
<div class="table-div">
    <div class="title">确认收货</div>
    <div class="btn-div">
        <input type="button" class="btn-eidt" value="确认收货" onclick="edit();">
        <%-- <input type="button" class="btn-remove" value="删除" onclick="alert('删除');">--%>
    </div>
    <table id="advSearch" class="table">
        <thead>
        <tr>
            <th>入库明细id</th>
            <th>商户名称</th>
            <th>商品名称</th>
            <th>仓库名称</th>
            <th>预期入库时间</th>
            <th>实际入库时间</th>
            <th>预期数量</th>
            <th>实收数量</th>
            <th>入库类型</th>
            <th>备注</th>
            <th>入库状态</th>
            <th>申请人</th>
            <th>确认收货人</th>
            <th>
				<select id="type" style="background: none; border: none; -webkit-box-shadow: none; width: auto; 
            			font-size: 14px; color: #4d4d4d; font-weight: bold;" onchange="selectCategory();" >
                    <option>入库类型</option>
	            	<option>正常入库</option>
	            	<option>正常调拨</option>
            	</select>
			</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.storagelistcheck}" var="storage">
            <tr>
                <td><s:property value="#storage.storageId"/></td>
                <td><s:property value="#storage.producer.producerName"/></td>
                <td><s:property value="#storage.goods.goodsName"/></td>
                <td><s:property value="#storage.place.placeName"/></td>
                <td><s:date format="yyyy-MM-dd" name="#storage.expectedDate"/></td>
                <td><s:date format="yyyy-MM-dd" name="#storage.storageDate"/></td>
                <td><s:property value="#storage.expectedNumber"/></td>
                <td><s:property value="#storage.storageNumber"/></td>
                <td><s:property value="#storage.storageType"/></td>
                <td><s:property value="#storage.remark"/></td>
                <td><s:property value="#storage.state"/></td>
                <td><s:property value="#storage.adduser"/></td>
                <td><s:property value="#storage.checkuser"/></td>
                <td><s:property value="#storage.category"/></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>

<div id="dialog_edit" class="dialog-div">
    <div class="dialog-masking"></div>
    <div class="dialog-content">
        <div class="title">确认收货</div>
        <div class="overflow-div">
            <div class="content">
                <form method="post" action="rkOk" onsubmit="return check(this)">
                    <div class="line">
                        <div class="lable">入库明细id：</div>
                        <div class="input-div"><input name="storage.storageId" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>

                    </div>
                    <div class="line">
                        <div class="lable">商户名称：</div>
                        <div class="input-div">
                            <input name="storage.producer.producerName" readonly="readonly"
                                   style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">商品名称：</div>
                        <div class="input-div"><input name="storage.goods.goodsName" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">仓库名称：</div>
                        <div class="input-div"><input name="storage.place.placeName" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">预期入库时间：</div>
                        <div class="input-div"><input id="expectedDate" name="storage.expectedDate" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;" type="date"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">实际入库时间：</div>
                        <div class="input-div"><input id="storageDate" placeholder="请输入实际入库时间"
                                                      name="storage.storageDate" type="date"/>
                        </div>
                    </div>

                    <div class="line">
                        <div class="lable">预期数量：</div>
                        <div class="input-div"><input id="expectedNumber" name="storage.expectedNumber"
                                                      readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">实收数量：</div>
                        <div class="input-div"><input id="storageNumber" placeholder="请输入实收数量"
                                                      name="storage.storageNumber"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">入库类型：</div>
                        <div class="input-div"><input name="storage.storageType" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">备注：</div>
                        <div class="input-div"><input placeholder="请输入备注" name="storage.remark"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">入库状态：</div>
                        <div class="input-div"><input id="state" name="storage.state" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">申请人：</div>
                        <div class="input-div"><input name="storage.adduser" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">确认收货人：</div>
                        <div class="input-div"><input name="storage.checkuser" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">入库类别：</div>
                        <div class="input-div"><input  readonly="readonly"
                                                       style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div style="position: relative; bottom: 0px;">
                        <input type="submit" value="确认" class="btn-submit" onclick="btn()"/>
                        <input type="button" value="取消" class="btn-cancle" onclick="$('#dialog_edit').hide();"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>

