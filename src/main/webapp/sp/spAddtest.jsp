<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>添加商品</title>
    <link type="text/css" rel="stylesheet" href="common.css" />
</head>

<body>
<div class="title">添加商品</div>
<div class="content">
    <form method="post" action="addGoods" >
        <div class="line">
            <div class="lable">商品名称：</div>
            <div class="input-div"><input placeholder="请输入商品名称" name="goods.goodsName"/></div>
        </div>

        <div class="line">
            <div class="lable">商品后台名称：</div>
            <div class="input-div"><input placeholder="请输入商品后台名称" name="goods.goodsBackName"/></div>
        </div>

        <div class="line">
            <div class="lable">参考价值：</div>
            <div class="input-div"><input placeholder="请输入参考价值" name="goods.value"/></div>
        </div>

        <div class="line">
            <div class="lable">单价：</div>
            <div class="input-div"><input placeholder="请输入单价" name="goods.price"/></div>
        </div>

        <div class="line">
            <div class="lable">长cm：</div>
            <div class="input-div"><input placeholder="请输入长cm" name="goods.length"/></div>
        </div>

        <div class="line">
            <div class="lable">宽cm：</div>
            <div class="input-div"><input placeholder="请输入宽cm"  name="goods.wide"/></div>
        </div>

        <div class="line">
            <div class="lable">高cm：</div>
            <div class="input-div"><input placeholder="请输入高cm" name="goods.tall"/></div>
        </div>

        <div class="line">
            <div class="lable">毛重kg：</div>
            <div class="input-div"><input placeholder="请输入毛重kg" name="goods.mweight"/></div>
        </div>

        <div class="line">
            <div class="lable">体积m*m*m：</div>
            <div class="input-div"><input placeholder="请输入体积m*m*m" name="goods.volume"/></div>
        </div>

        <div class="line">
            <div class="lable">体积重量kg：</div>
            <div class="input-div"><input placeholder="请输入体积重量kg" name="goods.vweight"/></div>
        </div>

        <div class="line">
            <div class="lable">装箱规格：</div>
            <div class="input-div"><input placeholder="请输入装箱规格" name="goods.standard"/></div>
        </div>

        <div class="line">
            <div class="lable">单位：</div>
            <div class="input-div"><input placeholder="请输入单位" name="goods.unit"/></div>
        </div>

        <div class="line">
            <div class="input-div">
                <div class="lable-left">
                    <input type="radio" name="goods.service" value="服务" id="radio_service" />
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
            <div class="input-div"><input placeholder="请输入生产日期" name="goods.creationDate" type="date"/></div>
        </div>

        <div class="line">
            <div class="lable">保质期：</div>
            <div class="input-div"><input placeholder="请输入保质期" name="goods.baozhiqi"/></div>
        </div>

        <div class="line">
            <div class="lable">保质期截止日期：</div>
            <div class="input-div"><input placeholder="请输入保质期截止日期" name="goods.expirationDate" type="date"/></div>
        </div>
        <input type="submit" value="提交" class="btn-submit"/>
    </form>
</div>
</body>
</html>