<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/11/25
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>仓库信息</title>
    <link type="text/css" rel="stylesheet" href="../common.css"/>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>

    <script>
        function edit(){
            if($(".active").length == 0){
                alert('请选择要修改的行');
            }else{
                var $tds = $("tr.active").children();
                var $lines = $("#dialog_edit").find('form').children();
                for(var i = 0, len = $tds.length; i < len; i++) {
                    var $line = $lines.eq(i);

                    if(i == 0){
                        $line.find('.input-div').html($tds.eq(i).text());
                    }else {
                        $line.find('input').val($tds.eq(i).text());
                    }
                }

                $("#dialog_edit").show();
            }
        }

        $(function () {
            $("tbody tr").bind('click', function () {
                $('table tr').removeClass('active');
                $(this).addClass('active');
            });
        });
    </script>
</head>

<body>
<div class="table-div">
    <div class="title">仓库信息</div>
    <div class="btn-div">
    <%--    <input type="button" class="btn-eidt" value="修改" onclick="edit();">
        <input type="button" class="btn-remove" value="删除" onclick="alert('删除');">--%>
    </div>
    <table id="advSearch" class="table">
        <thead>
        <tr>
            <th>仓库id</th>
            <th>仓库名称</th>
            <th>仓库状态</th>

        </tr>
        </thead>
        <tbody>
        <s:iterator value="%{#session.placelistall}" var="place">
            <tr>
                <td><s:property value="#place.placeId"/></td>
                <td><s:property value="#place.placeName"/></td>
                <td><s:property value="#place.state"/></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>

<div id="dialog_edit" class="dialog-div">
    <div class="dialog-masking"></div>
    <div class="dialog-content">
        <div class="title">修改仓库</div>
        <div class="overflow-div">
            <div class="content">
                <form method="post" action="editPlace" target="_parent">
                    <div class="line">
                        <div class="lable">仓库id：</div>
                        <div class="input-div"></div>
                    </div>
                    <div class="line">
                        <div class="lable">仓库名称：</div>
                        <div class="input-div"><input placeholder="请输入仓库名称" name="place.placeName"/></div>
                    </div>

                    <div class="line">
                        <div class="lable">仓库状态：</div>
                        <div class="input-div"><input placeholder="请输入仓库状态" name="place.state"/></div>
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
