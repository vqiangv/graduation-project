<%@page import="cn.edu.ujn.wq.dao.User"%>
<%@page import="java.util.List"%>
<%@page import="cn.edu.ujn.wq.dao.TeaCourse"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>个人课表界面</title>
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
List<TeaCourse> findPersonCourseList = (List<TeaCourse>) session.getAttribute("findPersonCourse");
List teaNamesList=(List)session.getAttribute("findTeaNameByNumber");
//System.out.print(stuList);
%>
<div class="stuClass">
<!-- 页面标题 --> 
 <div class="stuClass_head">
<span>个人课表</span> <br>
<span><h5><%=findPersonCourseList.get(0).getCourse_college()+"-"+findPersonCourseList.get(0).getCourse_major()+"-"+findPersonCourseList.get(0).getCourse_class()%></h5></span>
</div>
<span class="back"><a  href="stuMain.jsp">《《返回上一页</a></span>
<table class="table table-bordered" id="tab">
		<thead>
			<tr>
				<th>课程号</th>
				<th>课程名</th>
				<th>上课时间</th>
				<th>上课地点</th>
				<th>任课老师</th>
			</tr>
		</thead>
		<tbody>
			<%
		   //查的是一个学生的课表，所以为get（0）
			for(int i=0;i<findPersonCourseList.size();i++)
	    	{
			%>
			<tr>
				<td><%=findPersonCourseList.get(i).getCourse_number()%></td>
				<td><%=findPersonCourseList.get(i).getCourse_name()%></td>
				<td><%=findPersonCourseList.get(i).getCourse_time()%></td>
				<td><%=findPersonCourseList.get(i).getCourse_address()%></td>
				 <td><%=teaNamesList.get(i)%></td>
			</tr>
			<%
			}
			;
			%>
		</tbody>
	</table>
</body>
</html>