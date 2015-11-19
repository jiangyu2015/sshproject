<%@ page language="java" contentType="text/html; charset=utf-8"
	import="java.sql.*,com.hibtest1.entity.*,java.util.*"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
  <%
					List<Goods> list = (List<Goods>) session.getAttribute("goodsList");
					for (int i = 0; i < list.size(); i++) {
						Goods good = list.get(i);
						String url = java.net.URLEncoder.encode(good.getRtitle(),
								"UTF-8");
				%>

				<li><a href="read/readList?read.rtitle=<%=url%>"><%=read.getRtitle()%></a></li>
				<%
					}
				%>
</body>
</html>