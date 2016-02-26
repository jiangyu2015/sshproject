<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>菜单</title>

    <link rel="stylesheet" type="text/css" href="../resources/jquery-easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../resources/jquery-easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../resources/jquery-easyui/demo/demo.css">
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.min.js"></script>
    <style>
        a {
            text-decoration: none;
        }
    </style>
    <script type="text/javascript" src="../resources/jquery-easyui/jquery.easyui.min.js"></script>

    <script>

        /*  var a = setInterval(function(){
         $.ajax({
         type : "POST",
         url :  "checkStorageAppCountJsonAction",
         data : {

         },
         success : function(data, xhrTxt) {
         var d = eval("(" + data + ")");
         var count = d.count;
         alert(count);
         },
         dataType : "json"
         });
         },3*60*1000);*/


        $(function () {
            var url = "";
            if (document.getElementById("sess").value == 1) {
                url = "tree_data1.json";
                getCount();
                var a = setInterval(function () {
                    getCount();
                }, 0.5 * 60 * 1000);
            } else if (document.getElementById("sess").value == 2) {
                url = "tree_data2.json";
            } else {
                alert("操作失败，登录超时，请重新登录");
            }
            $('#mytree').tree({
                url: url
            });
        });

        function getCount() {
            $.ajax({
                type: "POST",
                url: "checkStorageAppCountJsonAction",
                data: {},
                success: function (data) {
                    var d = eval("(" + data + ")");
                    if (d.count1 != 0){
                        $("#count1").html(d.count1).addClass('tip-num');
                    }else{
                        $("#count1").html('').removeClass('tip-num');
                    }
                    if (d.count2 != 0){
                        $("#count2").html(d.count2).addClass('tip-num');
                    }else{
                        $("#count2").html('').removeClass('tip-num');
                    }
                    if (d.count3 != 0){
                        $("#count3").html(d.count3).addClass('tip-num');
                    }else{
                        $("#count3").html('').removeClass('tip-num');
                    }
                    if (d.count4 != 0){
                        $("#count4").html(d.count4).addClass('tip-num');
                    }else{
                        $("#count4").html('').removeClass('tip-num');
                    }
                    if (d.count5 != 0){
                        $("#count5").html(d.count5).addClass('tip-num');
                    }else{
                        $("#coun5").html('').removeClass('tip-num');
                    }

                },
                dataType: "json"
            });
        }

        function nodeClick(node) {        //获得节点id并链接
            if (node.id != undefined) {
                $("#t", parent.document).attr("src", node.id);
            } else {
                return;
            }
        }
    </script>
    <style>
        html {
            margin: 0;
            padding: 0;
            height: 100%;
        }

        body {
            margin: 0;
            padding: 0;
            height: 100%;
            background-color: #0a5c8e;
        }

        .my-panel {
            padding: 5px;
            background-color: #E6F4FD;
            border-radius: 5px;
        }

        .tree-title {
            line-height: 30px;
            color: #0CB2F5;
            margin-left: -6px;
        }

        .tree-folder + .tree-title {
            font-weight: bold;
            font-size: 14px;
        }

        .tree-file {
            background: none;
            width: 0;
        }

        .tree-folder-open {
            background: none;
            width: 0;
        }

        .tree-folder {
            background: none;
            width: 0;
        }

        .tree-node {
            height: 30px;
            white-space: nowrap;
            cursor: pointer;
            border-radius: 5px;
            background-color: #ccc;
            /*background: -webkit-linear-gradient(top, #FDFDFD ,#F5F5F5);*/
            background-color: #F5F5F5;
            border: 1px solid #ccc;
            margin: 2px 0px;
        }

        .tree-node + ul {
            padding: 5px !important;
            /*  padding: 5px 10px !important;*/
            border: 1px solid #ccc;
            background: #fff;
            margin-top: -5px !important;
        }

        .tree-node-selected {
            background: -webkit-linear-gradient(top, #9BD2F3, #268AF1);
        }

        .tree-node-selected > .tree-title {
            color: #fff;
        }

        .tree-collapsed {
            margin: 8px;
            margin-left: 4px;
            background: url('img/icon_right.png') no-repeat;
            background-size: contain;
        }

        .tree-collapsed-hover {
            background: url('img/icon_right_hover.png') no-repeat !important;
            background-size: contain !important;
        }

        .tree-node-selected > .tree-collapsed {
            background: url('img/icon_right_select.png') no-repeat;
            background-size: contain;
        }

        .tree-expanded {
            margin: 8px;
            margin-left: 4px;
            background: url('img/icon_down.png') no-repeat;
            background-size: contain;
        }

        .tree-expanded-hover {
            background: url('img/icon_down_hover.png') no-repeat !important;
            background-size: contain !important;
        }

        .tree-node-selected > .tree-expanded {
            background: url('img/icon_down_select.png') no-repeat;
            background-size: contain;
        }

        .tree-indent {
            width: 5px;
        }

        .tip-num {
            width: 20px;
            height: 20px;
            background-color: red;
            display: inline-block;
            text-align: center;
            line-height: 20px;
            border-radius: 10px;
            margin-left: 10px;
            color: #fff;
            font-weight: 100;
        }
    </style>
</head>

<body>
<input type="hidden" id="sess" name="hiddenField" value=<%=session.getAttribute("role")%>>
<div class="easyui-panel my-panel" style="width: 100%; height: 100%;">
    <ul id="mytree" class="easyui-tree" data-options="onClick: nodeClick"></ul>
</div>
</body>
</html>