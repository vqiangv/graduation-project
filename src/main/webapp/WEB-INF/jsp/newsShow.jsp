<%@page import="cn.edu.ujn.wq.dao.News"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻展示界面</title>
<%
int newsID=(int)session.getAttribute("intnewsID");
News newsFindList=(News)session.getAttribute("newsIDListNews");
%>
<style type="text/css">
.newsContext h2,h5
{
text-align: center;
}
</style>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<a href="stuMain.jsp"><input type="button" class="btn btn-primary" value="返回"
			/></a>
<div class="newsContext">
<center>
<table>
<tr><td><h2><%=newsFindList.getNew_home()%></h2></td></tr>
<tr><td><h5><%=newsFindList.getNew_author()%></h5></td></tr>
<tr><td><%=newsFindList.getNew_context()%></td></tr>
</table>
</center>
</div>
</body>
</html>