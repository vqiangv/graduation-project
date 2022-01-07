<%@page import="cn.edu.ujn.wq.dao.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>班级管理界面</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>
<%
List<User> stuList = (List<User>) session.getAttribute("findAllClassPerson");
//System.out.print(stuList);
%>
<body>
	<table class="table table-bordered" id="tab">
		<thead>
			<tr>
				<th>ID</th>
				<th>姓名</th>
				<th>学号</th>
				<th>性别</th>
				<th>楼号</th>
				<th>宿舍号</th>
				<th>职位</th>
			</tr>
		</thead>
		<tbody>
			<%
			for(int i=0;i<stuList.size();i++)
			{
			%>
			<tr>
				<td><%=stuList.get(i).getStu_id()%></td>
				<td><%=stuList.get(i).getStu_name()%></td>
				<td><%=stuList.get(i).getStu_number()%></td>
				<td><%=stuList.get(i).getStu_gender()%></td>
				<td><%=stuList.get(i).getStu_house()%></td>
				<td><%=stuList.get(i).getStu_housenum()%></td>
				<td><%=stuList.get(i).getStu_job()%></td>
			</tr>
			<%
			}
			;
			%>

		</tbody>
	</table>


</body>
</html>