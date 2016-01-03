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
            var goodsName = $('#goodsName').val();
            var price = $('#price').val();
            var unit = $('#unit').val();
            if (goodsName == "") {
                document.getElementById("div_goodsName").innerHTML = "请输入商品名称!";
                return false;
            }
            if (price == "") {
                document.getElementById("div_price").innerHTML = "请输入商品单价!";
                return false;
            }
            if (unit == "") {
                document.getElementById("div_unit").innerHTML = "请输入商品单位!";
                return false;
            }
        }
        function addExpirationDate(str) {  //截止日期跳出鼠标后算其他两个
            var creationDate = $('#creationDate').val();
            alert("creationDate" + creationDate);
            var baozhiqi = $('#baozhiqi').val();
            var expirationDate = $('#expirationDate').val();

            var newDate, sDate, eDate, iDays
            //js月份默认是从0开始的所以月份要-1
            var a = creationDate.split("-")
            sDate = new Date(a[2], a[1] - 1, a[0])

            var b = expirationDate.split("-")
            eDate = new Date(b[2], b[1] - 1, b[0])
            //(1000 * 60 * 60 * 24) 得到分钟除60000就好了
            c = (eDate - sDate);
            alert(c);
            iDays = Math.floor((eDate - sDate) / 86400000)
            alert("shishi" + iDays);


            /*    if (baozhiqi == "" && creationDate != null && str != null) {
             baozhiqi = ( str.getTime() - creationDate.getTime()) / (1000 * 60 * 60 * 24);
             $('#baozhiqi').val(baozhiqi);
             alert(baozhiqi);
             }*/
            /* if (baozhiqi != null && creationDate == "" && str != null) {
             creationDate=sdf.format(datetime+baozhiqi*24*60*60*1000);
             $('#creationDate').val(creationDate);
             }*/
        }

    </script>
</head>

<body>
<div class="title">添加商品</div>
<div class="content">
    <form method="post" action="addGoods" onsubmit="return check(this)">
        <div class="line">
            <div class="lable">商品名称：</div>
            <div class="input-div"><input id="goodsName" placeholder="请输入商品名称" name="goods.goodsName"/> &nbsp;<span
                    id="div_goodsName"></span></div>
        </div>

        <div class="line">
            <div class="lable">商品后台名称：</div>
            <div class="input-div"><input placeholder="请输入商品后台名称" name="goods.goodsBackName"/></div>
        </div>

        <div class="line">
            <div class="lable">参考价值：</div>
            <div class="input-div"><input placeholder="请输入参考价值(只能输入数字和小数点)" name="goods.value"
                                          onkeyup="value=value.replace(/[^\d.]/g,'') "
                                          onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"/>
            </div>
        </div>

        <div class="line">
            <div class="lable">单价：</div>
            <div class="input-div"><input id="price" placeholder="请输入单价(只能输入数字和小数点)" name="goods.price"
                                          onkeyup="value=value.replace(/[^\d.]/g,'') "
                                          onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"/>
                &nbsp;<span id="div_price"></span>
            </div>
        </div>

        <div class="line">
            <div class="lable">长cm：</div>
            <div class="input-div"><input placeholder="请输入长cm(只能输入数字和小数点)" name="goods.length"
                                          onkeyup="value=value.replace(/[^\d.]/g,'') "
                                          onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"/>
            </div>
        </div>

        <div class="line">
            <div class="lable">宽cm：</div>
            <div class="input-div"><input placeholder="请输入宽cm(只能输入数字和小数点)" name="goods.wide"
                                          onkeyup="value=value.replace(/[^\d.]/g,'') "
                                          onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"/>
            </div>
        </div>

        <div class="line">
            <div class="lable">高cm：</div>
            <div class="input-div"><input placeholder="请输入高cm(只能输入数字和小数点)" name="goods.tall"
                                          onkeyup="value=value.replace(/[^\d.]/g,'') "
                                          onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"/>
            </div>
        </div>

        <div class="line">
            <div class="lable">毛重kg：</div>
            <div class="input-div"><input placeholder="请输入毛重kg(只能输入数字和小数点)" name="goods.mweight"
                                          onkeyup="value=value.replace(/[^\d.]/g,'') "
                                          onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"/>
            </div>
        </div>

        <div class="line">
            <div class="lable">体积m*m*m：</div>
            <div class="input-div"><input placeholder="请输入体积m*m*m" name="goods.volume"/></div>
        </div>

        <div class="line">
            <div class="lable">体积重量kg：</div>
            <div class="input-div"><input placeholder="请输入体积重量kg" name="goods.vweight"
                                          onkeyup="value=value.replace(/[^\d.]/g,'') "
                                          onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"/>
            </div>
        </div>

        <div class="line">
            <div class="lable">装箱规格：</div>
            <div class="input-div"><input placeholder="请输入装箱规格" name="goods.standard"/></div>
        </div>

        <div class="line">
            <div class="lable">单位：</div>
            <div class="input-div"><input id="unit" placeholder="请输入单位，需与入库单位一致" name="goods.unit"/> &nbsp;<span
                    id="div_unit"></span></div>
        </div>

        <div class="line">
            <div class="input-div">
                <div class="lable-left">
                    <input type="radio" name="goods.service" value="服务" id="radio_service"/>
                    <label for="radio_service">服务</lable>
                </div>
                <div class="lable-right">
                    <input type="radio" name="goods.service" value="实物" id="radio_object" checked="checked"/>
                    <label for="radio_object">实物</lable>
                </div>
            </div>
        </div>

        <div class="line">
            <div class="lable">生产日期：</div>
            <div class="input-div"><input id="creationDate" placeholder="请输入生产日期" name="goods.creationDate"
                                          type="date"/></div>
        </div>

        <div class="line">
            <div class="lable">保质期：</div>
            <div class="input-div"><input id="baozhiqi" placeholder="请输入保质期" name="goods.baozhiqi"/></div>
        </div>

        <div class="line">
            <div class="lable">保质期截止日期：</div>
            <div class="input-div"><input id="expirationDate" placeholder="请输入保质期截止日期" name="goods.expirationDate"
                                          type="date" onblur="addExpirationDate(this.value)"/></div>
        </div>

        <input type="submit" value="提交" class="btn-submit"/>
    </form>
</div>
</body>
</html>