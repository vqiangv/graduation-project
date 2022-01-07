<%@page import="cn.edu.ujn.wq.dao.Hostel"%>
<%@page import="cn.edu.ujn.wq.dao.User"%>
<%@page import="java.util.List"%>
<%@page import="cn.edu.ujn.wq.dao.TeaCourse"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>管理员对宿舍信息的管理</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/stuClass.css">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
	.stuClass_head
	{
	margin-top: 2%;
	margin-bottom: 2%;
	}
	</style>
</head>
<body>

<%
List<Hostel>findHostels=(List<Hostel>)session.getAttribute("findHotel");
%>
<div class="stuClass">
<!-- 页面标题 --> 
 <div class="stuClass_head">
<span>宿舍楼栋信息</span> <br>
</div>
<table class="table table-bordered" id="tab">
		<thead>
			<tr>
				<th>楼栋号</th>
				<th>层数</th>
				<th>单层房间数</th>
				<th>宿舍容量(人)</th>
			</tr>
		</thead>
		<tbody>
			<%
			for(int i=0;i<findHostels.size();i++)
	    	{
			%>
			<tr>
				<td>学<%=findHostels.get(i).getHostel_number()%></td>
			    <td><%=findHostels.get(i).getHostel_num()%>层</td>
			    <td><%=findHostels.get(i).getHostelHome_num()%></td>
			    <td><%=findHostels.get(i).getHostelPerson_num()%>人间</td>
			</tr>
			<%
			}
			;
			%>
		</tbody>
	</table>
</body>
</html>