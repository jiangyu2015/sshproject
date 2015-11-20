<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2015/11/20
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
    <title>请输入要查询的商品名称</title>
</head>
<body>
<s:form action="spSelect" validate="true">
    <table id="advSearch" width="380" height="66">
        <div class="my-form-head">
            <h1>请输入查找的商品名称</h1>
        </div>
        <tr>
            <td><s:textfield label="商品名称" name="goods.goodsName" /></td>
        </tr>
        <tr>
            <td><s:submit align="left" value="查找" /></td>

        </tr>
    </table>

</s:form>
</body>
</html>
