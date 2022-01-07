<%@page import="cn.edu.ujn.wq.dao.News"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>班主任管理宿舍新闻</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<%
List<News> newsFindList = (List<News>) session.getAttribute("hotelNewsFindList");
%>
<body>

<form action="<%=request.getContextPath()%>/deleteHotelNews.action" method="post" >
	<table class="table table-bordered" id="tab" >
		<thead>
			<tr>
				<th>新闻标题</th>
				<th>新闻作者</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<%
		for (int i = 0; i < newsFindList.size(); i++) {
		%>
			<tr>
				<td><%=newsFindList.get(i).getNew_home()%></td>
				<td><%=newsFindList.get(i).getNew_author()%></td>
				<td><button type="submit" class="btn btn-danger" onclick="setValue(<%=newsFindList.get(i).getNew_id()%>)">删除</button></td>
			</tr>
			<%
			}
			;
			%>
		</tbody>
		
	</table>
	<script type="text/javascript">

function setValue(value){

　　document.getElementById("test").value=value;

}
</script>
<input type="hidden" name="newsID" id="test"/>
</form>
</body>
</html>