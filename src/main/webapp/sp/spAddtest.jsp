<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>添加商品</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript">
        function check(form) {
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
            if ((creationDate == "" && baozhiqi == "") || (creationDate == "" && expirationDate == "") || (baozhiqi == "" && expirationDate == "")) {
                $("#div_alert").html("请输入至少两个（生产日期、保质期、保质期截止日期）");
                return false;
            }
            if (baozhiqi < 0) {
                $("#div_alert").html("生产日期必须小于保质期截止日期!");
                return false;
            }
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
    </script>
</head>

<body>
<div class="title">添加商品</div>
<div class="content">
    <form method="post" action="addGoods" onsubmit="return check(this)">
        <div class="line">
            <div class="lable"><span>* </span>商品名称：</div>
            <div class="input-div">
                <input id="goodsName" placeholder="请输入商品名称（不要有空格）" name="goods.goodsName"/>
                <span id="div_goodsName"></span>
            </div>
        </div>

        <div class="line">
            <div class="lable">商品后台名称：</div>
            <div class="input-div"><input placeholder="请输入商品后台名称" name="goods.goodsBackName"/></div>
        </div>

        <div class="line">
            <div class="lable">参考价值：</div>
            <div class="input-div"><input placeholder="请输入参考价值(只能输入数字和小数点)" name="goods.value"
                                          onkeyup="value=value.replace(/[^\d\.]/g,'')"
                                          onblur="value=value.replace(/[^\d\.]/g,'')"/></div>
        </div>

        <div class="line">
            <div class="lable"><span>* </span>单价：</div>
            <div class="input-div">
                <input id="price" placeholder="请输入单价(只能输入数字和小数点)" name="goods.price"
                       onkeyup="value=value.replace(/[^\d\.]/g,'')"
                       onblur="value=value.replace(/[^\d\.]/g,'')"/>
                <span id="div_price"></span>
            </div>
        </div>

        <div class="line">
            <div class="lable">长cm：</div>
            <div class="input-div"><input placeholder="请输入长cm(只能输入数字和小数点)" name="goods.length"
                                          onkeyup="value=value.replace(/[^\d\.]/g,'')"
                                          onblur="value=value.replace(/[^\d\.]/g,'')"/></div>
        </div>

        <div class="line">
            <div class="lable">宽cm：</div>
            <div class="input-div"><input placeholder="请输入宽cm(只能输入数字和小数点)" name="goods.wide"
                                          onkeyup="value=value.replace(/[^\d\.]/g,'')"
                                          onblur="value=value.replace(/[^\d\.]/g,'')"/></div>
        </div>

        <div class="line">
            <div class="lable">高cm：</div>
            <div class="input-div"><input placeholder="请输入高cm(只能输入数字和小数点)" name="goods.tall"
                                          onkeyup="value=value.replace(/[^\d\.]/g,'')"
                                          onblur="value=value.replace(/[^\d\.]/g,'')"/></div>
        </div>

        <div class="line">
            <div class="lable">毛重kg：</div>
            <div class="input-div"><input placeholder="请输入毛重kg(只能输入数字和小数点)" name="goods.mweight"
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
                <input id="unit" placeholder="请输入单位，需与入库单位一致（不要有空格）" name="goods.unit"/>
                <span id="div_unit"></span>
            </div>
        </div>

        <div class="line">
            <div class="input-div">
                <div class="lable-left">
                    <input type="radio" name="goods.service" value="服务" id="radio_service"/>
                    <label for="radio_service">服务</label>
                </div>
                <div class="lable-right">
                    <input type="radio" name="goods.service" value="实物" id="radio_object" checked="checked"/>
                    <label for="radio_object">实物</label>
                </div>
            </div>
        </div>

        <div class="line">
            <div class="lable"><span>* </span>生产日期：</div>
            <div class="input-div">
                <input id="creationDate" placeholder="请输入生产日期" name="goods.creationDate" type="date"
                       onblur="calculate()"/>
            </div>
        </div>

        <div class="line">
            <div class="lable"><span>* </span>保质期：</div>
            <div class="input-div">
                <input id="baozhiqi" placeholder="请输入保质期" name="goods.baozhiqi" type="number" onblur="calculate()"/>
            </div>
        </div>

        <div class="line">
            <div class="lable"><span>* </span>保质期截止日期：</div>
            <div class="input-div">
                <input id="expirationDate" placeholder="请输入保质期截止日期" name="goods.expirationDate" type="date"
                       onblur="calculate()"/>
            </div>
        </div>
        <span id="div_alert"></span><br>
        <input type="submit" value="提交" class="btn-submit"/>
    </form>
</div>
</body>
</html>