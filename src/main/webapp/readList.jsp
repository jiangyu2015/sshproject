<%@ page language="java" contentType="text/html; charset=utf-8"
	import="java.sql.*,com.hibtest1.entity.*,java.util.*"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>分类阅读</title>
<link rel="icon" href="../picture/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="../picture/favicon.ico"
	type="image/x-icon">
<link rel="stylesheet" href="../style.css" type="text/css" />
<style type="text/css">
body {
	margin: 0;
	font-size: 12px;
	background: #f0bbff;
}

#box {
	width: 500px;
	height: 300px;
	margin: 100px auto 0;
}

#tab_nav {
	margin: 0;
	padding: 0;
	height: 25px;
	line-height: 24px;
}

#tab_nav li {
	float: left;
	margin: 0 3px;
	list-style: none;
	border: 1px solid #999;
	border-bottom: none;
	height: 30px;
	width: 75px;
	text-align: center;
	background: #FFF;
}

a {
	font: bold 14px/24px "微软雅黑", Verdana, Arial, Helvetica, sans-serif;
	color: green;
	text-decoration: none;
}

a:hover {
	color: #0000ff;
}

#tab_mrc {
	width: 500px;
	height: 400px;
	border: 1px solid #999;
	font: bold "微软雅黑", Verdana, Arial, Helvetica, sans-serif;
	text-align: center;
	background: #ccff99;
	font-size: 2.0em;
	overflow: auto;
}

#nav2 {
	width: 65%;
	margin: 0px auto;
	height: 55px;
	background: #ffffff;
	border: 1px solid #FFFF77;
}

#nav2 ul {
	margin-left: 30px;
}

#nav2 ul li {
	float: left;
}

#nav2 ul a {
	display: block;
	width: 100%;
	height: 25px;
	padding-top: 10px;
	text-decoration: none;
	letter-spacing: 15px;
	text-align: center;
	color: #000;
	font-size: 20px;
	font-weight: bold;
}

#nav2 ul a:visited {
	color: #000;
}

#nav2 ul a:hover {
	color: #FFFFE0;
	background: #000;
}

#nav2 ul li.bar {
	width: 10px;
	padding-top: 12px;
}
</style>
</head>
<body onload="load()">
	<div id="nav2">
		<ul>
			<li><a href="../index.html" target="_self">首页</a></li>
			<li class="bar">|</li>
			<li><a href="../words/wordsChoice.jsp" target="_self">背单词</a></li>
			<li class="bar">|</li>
			<li><a href="../read/readTab.jsp" target="_self">阅读</a></li>
			<li class="bar">|</li>
			<li><a href="../test/stateChoice.jsp" target="_self">做练习</a></li>
			<li class="bar">|</li>
			<li><a href="../phrase/phraseChoice.jsp" target="_self">炼句</a></li>
			<li class="bar">|</li>
			<li><a href="chatRoom/chat" target="_self">交流区</a></li>
			<li class="bar">|</li>
			<li><a href="../download.jsp" target="_self">资料共享区</a></li>
		</ul>
	</div>
	<div id="box">
		<ul id="tab_nav">
			<li><a href="readShow/readShowList?rstate=poetry" target="_self">poetry</a></li>
			<li><a href="readShow/readShowList?rstate=beautiful">beautiful</a></li>
			<li><a href="readShow/readShowList?rstate=story">story</a></li>
			<li><a href="readShow/readShowList?rstate=joke">joke</a></li>
			<li><a href="readShow/readShowList?rstate=amusement">amusement</a></li>
			<li><a href="readShow/readShowList?rstate=science">science</a></li>
		</ul>
		<div id="tab_mrc">
			<div id="t_1">
				<%
					List<Read> list = (List<Read>) session.getAttribute("readlist");
					for (int i = 0; i < list.size(); i++) {
						Read read = list.get(i);
						String url = java.net.URLEncoder.encode(read.getRtitle(),
								"UTF-8");
				%>

				<li><a href="read/readList?read.rtitle=<%=url%>"><%=read.getRtitle()%></a></li>
				<%
					}
				%>
			</div>
		</div>
	</div>
</body>
</html>