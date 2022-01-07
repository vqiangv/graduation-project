<%@page import="cn.edu.ujn.wq.dao.TeaCourse"%>
<%@page import="cn.edu.ujn.wq.dao.Forum"%>
<%@page import="cn.edu.ujn.wq.dao.Forumt"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>任课老师管理教学班级的界面</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<%
List<TeaCourse>teaFindCourselist=(List<TeaCourse>)session.getAttribute("teaManageClass");
%>
<body>
<form action="<%=request.getContextPath()%>/teaTOFindAddCourseXiaoguo.action"  method="post" >
	<table class="table table-bordered" id="tab" >
		<thead>
			<tr>
				<th>学院</th>
				<th>专业</th>
				<th>班级</th>
				<th>课程号</th>
				<th>课程名</th>
				<th width="200px">操作</th>
			</tr>
		</thead>
		<tbody>
			<%
		for (int i = 0; i < teaFindCourselist.size(); i++) {
		%>
			<tr>
				<td><%=teaFindCourselist.get(i).getCourse_college()%></td>
				<td><%=teaFindCourselist.get(i).getCourse_major()%></td>
				<td><%=teaFindCourselist.get(i).getCourse_class()%></td>
				<td><%=teaFindCourselist.get(i).getCourse_number()%></td>
				<td><%=teaFindCourselist.get(i).getCourse_name()%></td>
				<td><button type="submit" class="btn btn-primary" onclick="setValue('<%=teaFindCourselist.get(i).getCourse_college()%>','<%=teaFindCourselist.get(i).getCourse_major()%>','<%=teaFindCourselist.get(i).getCourse_class()%>','<%=teaFindCourselist.get(i).getCourse_number()%>','<%=teaFindCourselist.get(i).getCourse_name()%>')">教学效果</button>
				</td>
			</tr>
			<%
			}
			;
			%>
		</tbody>
		
	</table>
	<input type="hidden" name="course_college" id="course_college"/>
<input type="hidden" name="course_major" id="course_major"/>
<input type="hidden" name="course_class" id="course_class"/>
<input type="hidden" name="course_number" id="course_number"/>
<input type="hidden" name="course_name" id="course_name"/>
	<script type="text/javascript">
function setValue(course_college,course_major,course_class,course_number,course_name){
document.getElementById("course_college").value=course_college;
document.getElementById("course_major").value=course_major;
document.getElementById("course_class").value=course_class;
document.getElementById("course_number").value=course_number;
document.getElementById("course_name").value=course_name;
}
</script>

</form>
</body>
</html>