<%@page import="cn.edu.ujn.wq.dao.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>所在班级信息界面</title>
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
	.context
	{
	  overflow-y:scroll;
   height:400px;
	}
	</style>
</head>
<body>

<%
List<User> stuList = (List<User>) session.getAttribute("findAllClassPerson");
//System.out.print(stuList);
%>
<div class="stuClass">
<!-- 页面标题 --> 
 <div class="stuClass_head">
<span>班级成员信息</span> <br>
<span><h5><%=stuList.get(0).getStu_college()+"-"+stuList.get(0).getStu_major()+"-"+stuList.get(0).getStu_class()%></h5></span>
</div>
<span class="back"><a  href="stuMain.jsp">《《返回上一页</a></span>
<div class="context">
<table class="table table-bordered" id="tab">
		<thead>
			<tr>
				<th>姓名</th>
				<th>学号</th>
				<th>性别</th>
			<!-- 	<th>楼号</th>
				<th>宿舍号</th> -->
				<th>职位</th>
			</tr>
		</thead>
		<tbody>
			<%
			for(int i=0;i<stuList.size();i++)
			{
			%>
			<tr>
				<td><%=stuList.get(i).getStu_name()%></td>
				<td><%=stuList.get(i).getStu_number()%></td>
				<td><%=stuList.get(i).getStu_gender()%></td>
			<%-- 	<td><%=stuList.get(i).getStu_house()%></td>
				<td><%=stuList.get(i).getStu_housenum()%></td> --%>
				<td><%=stuList.get(i).getStu_job()%></td>
			</tr>
			<%
			}
			;
			%>

		</tbody>
	</table>
	</div>
</body>
</html>