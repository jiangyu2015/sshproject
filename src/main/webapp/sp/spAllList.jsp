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

                    if (i == 0) {
                        $line.find('.input-div').html($tds.eq(i).text());
                    } else if (i == 13) {
                        $('input:radio[name="goods.service"]').prop('checked', false);
                        $('input:radio[name="goods.service"][value="' + $tds.eq(i).text() + '"]').prop('checked', true);
                    } else {
                        $line.find('input').val($tds.eq(i).text());
                    }
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
            $(".dialog-content .title").click(function(){
            }).mousedown(function(e){
                _move=true;
                _x=e.pageX-parseInt($(".dialog-content").css("left"));
                _y=e.pageY-parseInt($(".dialog-content").css("top"));
            });
            $(document).mousemove(function(e){
                if(_move){
                    var x=e.pageX-_x;//移动时根据鼠标位置计算控件左上角的绝对位置
                    var y=e.pageY-_y;

                    if(x <= 0){
                        x = 0;
                    }else if(x >= 0.2*width){
                        x = 0.2*width;
                    }

                    if(y <= 0){
                        y = 0;
                    }else if( y >= (0.2*height)){
                        y = 0.2*height;
                    }

                    $(".dialog-content").css({top:y,left:x});//控件新位置
                }
            }).mouseup(function(){
                _move=false;
            });
        });
    </script>
</head>

<body>
<div class="table-div">
    <div class="title">商品信息</div>
    <div class="btn-div">
        <input type="button" class="btn-eidt" value="修改" onclick="edit();">
        <input type="button" class="btn-remove" value="删除" onclick="alert('删除');">
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
                <td><s:property value="#goods.creationDate"/></td>
                <td><s:property value="#goods.baozhiqi"/></td>
                <td><s:property value="#goods.expirationDate"/></td>
            </tr>
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
                <form method="post" action="editGoods" target="_parent">
                    <div class="line">
                        <div class="lable">商品id：</div>
                        <div class="input-div"></div>
                    </div>
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
                        <div class="input-div"><input placeholder="请输入宽cm" name="goods.wide"/></div>
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
                                <input type="radio" name="goods.service" value="服务" id="radio_service"/>
                                <label for="radio_service">服务</lable>
                            </div>
                            <div class="lable-right">
                                <input type="radio" name="goods.service" value="实物" id="radio_object"
                                       checked="checked"/>
                                <label for="radio_object">实物</lable>
                            </div>
                        </div>
                    </div>

                    <div class="line">
                        <div class="lable">生产日期：</div>
                        <div class="input-div"><input placeholder="请输入生产日期" name="goods.creationDate"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">保质期：</div>
                        <div class="input-div"><input placeholder="请输入保质期" name="goods.baozhiqi"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">保质期截止日期：</div>
                        <div class="input-div"><input placeholder="请输入保质期截止日期" name="goods.expirationDate"/></div>
                    </div>

                    <input type="submit" value="确定" class="btn-submit" onclick="$('#dialog_edit').hide();"/>
                    <input type="button" value="取消" class="btn-cancle" onclick="$('#dialog_edit').hide();"/>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>