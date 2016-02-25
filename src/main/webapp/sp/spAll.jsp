<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/2/20
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>商品信息</title>
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
                    if (i == 13 || i == 18) {
                        if (i == 13) {
                            $('input:radio[name="goods.service"]').prop('checked', false);
                            $('input:radio[name="goods.service"][value="' + $tds.eq(i).text() + '"]').prop('checked', true);
                        }
                        if (i == 18) {
                            $('#typeIn option[value="' + $tds.eq(i).text() + '"]').prop('selected', true);
                        }
                    }
                    else {
                        $line.find('input').val($tds.eq(i).text());
                    }
                }
                $(".input-div span").html("");
                $("#div_alert").html("");
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

        function check() {
            var val = $("#state").val();
            var goodsName = $('#goodsName').val().replace(/\s/g, "");
            $('#goodsName').val(goodsName);
            var price = $('#price').val();
            var unit = $('#unit').val().replace(/\s/g, "");
            $('#unit').val(unit);
            var creationDate = $('#creationDate').val();
            var baozhiqi = $('#baozhiqi').val();
            var expirationDate = $('#expirationDate').val();

            $(".input-div span").html("");
            $("#div_alert").html("");
            if (val == "yesok" || val == "yesno") {
                alert("该商品已审核不能修改");
                return false;
            }
            else {
                if (goodsName == null || goodsName.length == 0 || isNull(goodsName)) {
                    $("#div_goodsName").html("请输入商品名称!");
                    return false;
                }
                if (price == "") {
                    $("#div_price").html("请输入商品单价!");
                    return false;
                }
                if (unit == null || unit.length == 0 || isNull(unit)) {
                    $("#div_unit").html("请输入商品单位!");
                    return false;
                }
                if ((creationDate != ""&& expirationDate != "" && baozhiqi == "")) {
                    $("#div_alert").html("请算出保质期后再提交）");
                    return false;
                }
                if ((creationDate == "" && baozhiqi == "") || (creationDate == "" && expirationDate == "") || (baozhiqi == "" && expirationDate == "")) {
                    $("#div_alert").html("请输入至少两个（生产日期、保质期、保质期截止日期）");
                    return false;
                }
                if (baozhiqi < 0) {
                    $("#div_alert").html("生产日期必须小于保质期截止日期!");
                    return false;
                }
            }
            $('#dialog_edit').hide();
            return true;
        }

        function isNull(str) {
            if (str == "") return true;
            var regu = "^[ ]+$";
            var re = new RegExp(regu);
            return re.test(str);
        }
        function calculate() {
            var creationDate = $('#creationDate').val();
            var baozhiqi = $('#baozhiqi').val();
            var expirationDate = $('#expirationDate').val();

            if (creationDate != "" && expirationDate != "") {
                $("#baozhiqi").val(GetDateDiff(creationDate, expirationDate));
            } else if (creationDate != "" && baozhiqi != "") {
                $("#expirationDate").val(addOrReduceDate(creationDate, baozhiqi));
            } else if (expirationDate != "" && baozhiqi != "") {
                $("#creationDate").val(addOrReduceDate(expirationDate, -baozhiqi));
            }
        }

        //日期加减天数
        function addOrReduceDate(initDate, days) {
            var date = new Date(initDate);
            date.setDate(date.getDate() + parseInt(days));

            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var day = date.getDate();

            month = month < 10 ? ("0" + month) : month;
            day = day < 10 ? ("0" + day) : day;

            return year + "-" + month + "-" + day;
        }

        //两个时间算间隔天数
        function GetDateDiff(startDate, endDate) {
            var startTime = new Date(Date.parse(startDate.replace(/-/g, "/"))).getTime();
            var endTime = new Date(Date.parse(endDate.replace(/-/g, "/"))).getTime();
            var dates = (endTime - startTime) / (1000 * 60 * 60 * 24);
            return dates;
        }

        function select() {
            window.location.href = "spSelect.action?goodsName="+ $tds.eq(0).text();
            "ytsqAdd.jsp?id=" + $tds.eq(0).text();
        }

        function check1() {
            var goods = $("#goods").val();
            if (goods == "") {
                alert("请输入商品名称");
                return false;
            }
            else  return true;
        }
    </script>
</head>
</head>
<body>
<div class="table-div">
    <div class="title">商品信息</div>
    <div class="btn-div">
        <input type="button" class="btn-eidt" value="修改" onclick="edit();"/>
        <form method="post" action="spSelect.action" onsubmit="return check1()" class="head-form">
            <div class="head-lable">商品名称：</div>
            <input id="goods" class="head-input"  name="goodsName"/>
            <input type="submit" class="btn-remove head-btn-right" value="模糊查询" style="width: 90px;"/>
        </form>
    </div>
    <table id="advSearch" class="table">
        <thead>
        <tr>
            <th>商品id</th>
            <th>商品名称</th>
            <th>后台商品名称</th>
            <th>参考价值</th>
            <th>单价</th>
            <th>长cm</th>
            <th>宽cm</th>
            <th>高cm</th>
            <th>毛重kg</th>
            <th>体积m*m*m</th>
            <th>体积重量kg</th>
            <th>装箱规格</th>
            <th>单位</th>
            <th>实物服务</th>
            <th>生产日期</th>
            <th>保质期</th>
            <th>保质期截止日期</th>
            <th>商品可用</th>
            <th>商品评级</th>
            <th>审核时间</th>
            <th>新建人</th>
            <th>修改人</th>
            <th>审核人</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.goodslistall}" var="goods">
            <tr>
                <td><s:property value="#goods.goodsId"/></td>
                <td><s:property value="#goods.goodsName"/></td>
                <td><s:property value="#goods.goodsBackName"/></td>
                <td><s:property value="#goods.value"/></td>
                <td><s:property value="#goods.price"/></td>
                <td><s:property value="#goods.length"/></td>
                <td><s:property value="#goods.wide"/></td>
                <td><s:property value="#goods.tall"/></td>
                <td><s:property value="#goods.mweight"/></td>
                <td><s:property value="#goods.volume"/></td>
                <td><s:property value="#goods.vweight"/></td>
                <td><s:property value="#goods.standard"/></td>
                <td><s:property value="#goods.unit"/></td>
                <td><s:property value="#goods.service"/></td>
                <td><s:date format="yyyy-MM-dd" name="#goods.creationDate"/></td>
                <td><s:property value="#goods.baozhiqi"/></td>
                <td><s:date format="yyyy-MM-dd" name="#goods.expirationDate"/></td>
                <td><s:property value="#goods.state"/></td>
                <td><s:property value="#goods.commodityRating"/></td>
                <td><s:date format="yyyy-MM-dd HH:mm:ss" name="#goods.auditTime"/></td>
                <td><s:property value="#goods.adduser"/></td>
                <td><s:property value="#goods.edituser"/></td>
                <td><s:property value="#goods.checkuser"/></td>
            </tr>
        </s:iterator>
        <s:iterator value="%{#session.pagebeangoods}" var="pageBean">
            <div class="divcss5">
                <tr>
                    <td colspan="23" align="center" bgcolor="#5BA8DE">
                        <a class="bar-margin">共<s:property value="#pageBean.allRow"/>条记录</a>
                        <a class="bar-margin"> 共<s:property value="#pageBean.totalPage"/>页</a>
                        <a class="bar-margin">当前第<s:property value="#pageBean.currentPage"/>页</a><br>
                        <s:if test="%{#pageBean.currentPage == 1}">
                            <a class="bar-margin">第一页</a><a class="bar-margin">上一页</a>
                        </s:if> <!-- currentPage为当前页 --> <s:else>
                        <a class="bar-margin" href="listGoods.action?page=1">第一页</a>
                        <a class="bar-margin" href="listGoods.action?page=<s:property value='%{#pageBean.currentPage-1}'/>">上一页</a>
                    </s:else>
                        <s:if test="%{#pageBean.currentPage != #pageBean.totalPage}">
                            <a class="bar-margin" href="listGoods.action?page=<s:property value='%{#pageBean.currentPage+1}'/>">下一页</a>
                            <a class="bar-margin" href="listGoods.action?page=<s:property value='#pageBean.totalPage'/>">最后一页</a>
                        </s:if> <s:else>
                        <a class="bar-margin">下一页</a><a class="bar-margin">最后一页</a>
                    </s:else>
                    </td>
                </tr>
            </div>
        </s:iterator>
        </tbody>
    </table>
</div>
<div id="dialog_edit" class="dialog-div">
    <div class="dialog-masking"></div>
    <div class="dialog-content">
        <div class="title">修改商品</div>
        <div class="overflow-div">
            <div class="content">
                <form method="post" action="spEdit">
                    <div class="line">
                        <div class="lable">商品id：</div>
                        <div class="input-div"><input name="goods.goodsId" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable"><span>* </span>商品名称：</div>
                        <div class="input-div">
                            <input id="goodsName" placeholder="请输入商品名称" name="goods.goodsName"/>
                            <span id="div_goodsName"></span>
                        </div>
                    </div>
                    <div class="line">
                        <div class="lable">商品后台名称：</div>
                        <div class="input-div"><input placeholder="请输入商品后台名称" name="goods.goodsBackName"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">参考价值：</div>
                        <div class="input-div"><input placeholder="请输入参考价值" name="goods.value"
                                                      onkeyup="value=value.replace(/[^\d\.]/g,'')"
                                                      onblur="value=value.replace(/[^\d\.]/g,'')"/></div>
                    </div>
                    <div class="line">
                        <div class="lable"><span>* </span>单价：</div>
                        <div class="input-div">
                            <input id="price" placeholder="请输入单价" name="goods.price"
                                   onkeyup="value=value.replace(/[^\d\.]/g,'')"
                                   onblur="value=value.replace(/[^\d\.]/g,'')"/>
                            <span id="div_price"></span>
                        </div>

                    </div>
                    <div class="line">
                        <div class="lable">长cm：</div>
                        <div class="input-div"><input placeholder="请输入长cm" name="goods.length"
                                                      onkeyup="value=value.replace(/[^\d\.]/g,'')"
                                                      onblur="value=value.replace(/[^\d\.]/g,'')"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">宽cm：</div>
                        <div class="input-div"><input placeholder="请输入宽cm" name="goods.wide"
                                                      onkeyup="value=value.replace(/[^\d\.]/g,'')"
                                                      onblur="value=value.replace(/[^\d\.]/g,'')"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">高cm：</div>
                        <div class="input-div"><input placeholder="请输入高cm" name="goods.tall"
                                                      onkeyup="value=value.replace(/[^\d\.]/g,'')"
                                                      onblur="value=value.replace(/[^\d\.]/g,'')"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">毛重kg：</div>
                        <div class="input-div"><input placeholder="请输入毛重kg" name="goods.mweight"
                                                      onkeyup="value=value.replace(/[^\d\.]/g,'')"
                                                      onblur="value=value.replace(/[^\d\.]/g,'')"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">体积m*m*m：</div>
                        <div class="input-div"><input placeholder="请输入体积m*m*m" name="goods.volume"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">体积重量kg：</div>
                        <div class="input-div"><input placeholder="请输入体积重量kg" name="goods.vweight"
                                                      onkeyup="value=value.replace(/[^\d\.]/g,'')"
                                                      onblur="value=value.replace(/[^\d\.]/g,'')"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">装箱规格：</div>
                        <div class="input-div"><input placeholder="请输入装箱规格" name="goods.standard"/></div>
                    </div>
                    <div class="line">
                        <div class="lable"><span>* </span>单位：</div>
                        <div class="input-div">
                            <input id="unit" placeholder="请输入单位" name="goods.unit"/>
                            <span id="div_unit"></span>
                        </div>
                    </div>
                    <div class="line">
                        <div class="input-div">
                            <div class="lable-left">
                                <input type="radio" name="goods.service" value="服务" id="radio_service"/>
                                <label for="radio_service"/>服务
                            </div>
                            <div class="lable-right">
                                <input type="radio" name="goods.service" value="实物" id="radio_object"
                                       checked="checked"/>
                                <label for="radio_object"/>实物
                            </div>
                        </div>
                    </div>
                    <div class="line">
                        <div class="lable"><span>* </span>生产日期：</div>
                        <div class="input-div">
                            <input id="creationDate" name="goods.creationDate" type="date" onblur="calculate()"/>
                        </div>
                    </div>
                    <div class="line">
                        <div class="lable"><span>* </span>保质期：</div>
                        <div class="input-div">
                            <input id="baozhiqi" placeholder="请输入保质期" name="goods.baozhiqi" onblur="calculate()"/>
                        </div>
                    </div>
                    <div class="line">
                        <div class="lable"><span>* </span>保质期截止日期：</div>
                        <div class="input-div">
                            <input id="expirationDate" name="goods.expirationDate" type="date" onblur="calculate()"/>
                        </div>
                    </div>


                    <div class="line">
                        <div class="lable">商品可用：</div>
                        <div class="input-div"><input id="state" name="goods.state" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable"><span>* </span>商品评级：</div>
                        <div class="input-div">
                            <select id="typeIn" name="goods.commodityRating">
                                <option value=""></option>
                                <option value="A+">A+</option>
                                <option value="A">A</option>
                                <option value="B+">B+</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                            </select>
                        </div>
                    </div>
                    <div class="line">
                        <div class="lable">审核时间：</div>
                        <div class="input-div"><input name="goods.auditTime" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <div class="line">
                        <div class="lable">新增人：</div>
                        <div class="input-div"><input name="goods.adduser" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">修改人：</div>
                        <div class="input-div"><input name="goods.edituser" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">审核人：</div>
                        <div class="input-div"><input name="goods.checkuser" readonly="readonly"
                                                      style="border: none;-webkit-box-shadow: none;"/></div>
                    </div>
                    <span id="div_alert"></span><br>

                    <input type="submit" value="确定" class="btn-submit" onclick="return check();"/>
                    <input type="button" value="取消" class="btn-cancle" onclick="$('#dialog_edit').hide();"/>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
