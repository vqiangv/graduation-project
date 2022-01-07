<%@page import="cn.edu.ujn.wq.dao.Course"%>
<%@page import="java.util.List"%>
<%@page import="cn.edu.ujn.wq.dao.TeaCourse"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>任课老师查询自己的课表</title>
<!-- bootstrap需要引入的外部文件 -->
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
	.tab
	{
	margin-top: 4%;
	}
	.head
	{
	margin-top: 2%
	}
	</style>
</head>
<body>
<%
List<Course>teaFindCourselist=(List<Course>)session.getAttribute("teaFindCourse");
List<TeaCourse>teaFindTimeAddress =(List<TeaCourse>)session.getAttribute("teaFindTimeAddress");
%>
<!--条件查询区域-->
<div class="head">
<form action="<%=request.getContextPath()%>/teaFindCourseYearTerm.action">
<table> 
<tr>
<td>学年：</td>
							<td><select class="form-control" name="course_year">
								<optgroup>
									<option>--请选择年份--</option>
									<%for(int i=22;i>13;i--){ %>
									<option><%="20"+Integer.toString(i)+"-"+"20"+Integer.toString(i+1) %></option>
							       <%}; %>
								</optgroup>
						</select>
							</td>
<td>&nbsp;&nbsp;&nbsp;</td>
<td>学期：</td>
							<td><select class="form-control" name="course_term">
								<optgroup>
									<option>--请选择学期--</option>
									<option>1</option>
									<option>2</option>
								</optgroup>
						</select></td>
<td><button type="submit" class="btn btn-primary">查&nbsp;询</button></td>
</tr>
</table>
</form>
</div>
<!--课表展示区域 -->
<div class="tab">
<table class="table table-bordered" id="tab">
		<thead>
			<tr>
				<th>学年</th>
				<th>学期</th>
				<th>课程号</th>
				<th>课程名</th>
				<th>时间</th>
				<th>地点</th>
			<!-- 	<th>班级成员</th> -->
			</tr>
		</thead>
		<tbody>
			<%
			for(int i=0;i<teaFindCourselist.size();i++)
			{
			%>
			<tr>
				<td><%=teaFindCourselist.get(i).getCourse_year()%></td>
				<td><%=teaFindCourselist.get(i).getCourse_term()%></td>
				<td><%=teaFindCourselist.get(i).getCourse_number()%></td>
				<td><%=teaFindCourselist.get(i).getCourse_name()%></td>
				<td><%=teaFindTimeAddress.get(i).getCourse_time()%></td>
	<td><%=teaFindTimeAddress.get(i).getCourse_address()%></td>
				
			</tr>
		<%
			};
		%>

		</tbody>
	</table>

</div>
</body>
</html>