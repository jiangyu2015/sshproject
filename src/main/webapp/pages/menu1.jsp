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
        $(function () {

           /*  alert(document.getElementById("sess").value);*/
            var url = "";

            if (document.getElementById("sess").value == 1) {
                url = "tree_data1.json";
            } else if (document.getElementById("sess").value  == 2) {
                url = "tree_data2.json";
            } else {
                alert("操作失败，登录超时，请重新登录");
            }
            $('#mytree').tree({
                url: url
            });
        });

        function nodeClick(node) {
            if (node.id != undefined) {
                //if	(node.id != undefined){
                $("#t", parent.document).attr("src", node.id);
            } else {
                //$("#t", parent.document).attr("src", "index.html");
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
    </style>
</head>

<body>
<input type="hidden" id="sess" name="hiddenField" value=<%=session.getAttribute("role")%>>
<div class="easyui-panel my-panel" style="width: 100%; height: 100%;">
    <ul id="mytree" class="easyui-tree" data-options="onClick: nodeClick"></ul>
</div>
</body>
</html>