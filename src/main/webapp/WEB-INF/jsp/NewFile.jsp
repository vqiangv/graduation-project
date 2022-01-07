<%@page import="org.aspectj.weaver.ast.Var"%>
<%@page import="cn.edu.ujn.wq.dao.News"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%
List<News> newsFindList = (List<News>) session.getAttribute("newsFindList");
%>
<style type="text/css">
</style>
</head>
<body>
	<form method="post">
	<h4><span class="label label-primary">校内新闻</span></p></h4>
		<%
		for (int i = 0; i < newsFindList.size()&&i<7; i++) {
		%>
		<a href="newsShow.jsp" target="_blank"
					onclick="setValue(<%=newsFindList.get(i).getNew_id()%>)"><%=newsFindList.get(i).getNew_home()%></a></p>
		<%
		} ;
		%>
		
<script type="text/javascript">

var newsID;
//利用ajax传值
function requestParm()
{
	$.ajax(
	{
	type:"POST",
	url:"actionid.action",
	data:{newsID:newsID},
	dataType:"json",
	}		
	)
	}
function setValue(value){
　　newsID=document.getElementById("test").value=value;
       requestParm();
}
</script>
		<input type="hidden" name="newsID" id="test" />
	</form>
</body>
</html>