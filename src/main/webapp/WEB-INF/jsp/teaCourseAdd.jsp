<%@page import="cn.edu.ujn.wq.dao.College"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>任课老师发布课程信息</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.person {
	margin-top: 1%;
}

.btn {
	width: 200px;
}

.head {
	font-size: 22px;
	text-align: center;
	color: #6666ff;
	margin-top: 2%;
}
.person tr td:first-child() {
	text-align: right;
}
</style>
<%List<College> findCollegeMajorClass = (List<College>) session.getAttribute("allCollege"); %>

</head>
<body onload="fun()">
	<div class="head">
		<span>任课老师课程添加</span>
	</div>
	<div class="person">
		<form method="post"  name="myForm" action="<%=request.getContextPath()%>/teaCourseAdd.action">
				<center>
					<table style="margin: auto">
				<%-- 	<tr>
							<td>年份：</td>
							<td><select class="form-control" name="course_year">
								<optgroup>
									<option>--请选择年份--</option>
									<%for(int i=22;i>13;i--){ %>
									<option><%="20"+Integer.toString(i)+"--"+"20"+Integer.toString(i+1) %></option>
							       <%}; %>
								</optgroup>
						</select>
							</td>
						</tr>
						<tr>
							<td>学期：</td>
							<td><select class="form-control" name="course_term">
								<optgroup>
									<option>--请选择学期--</option>
									<option>1</option>
									<option>2</option>
								</optgroup>
						</select></td>
						</tr>
					<tr> --%>
						<tr>
							<td>课程号：</td>
							<td><input type="text" class="form-control"
								name="course_number" id="course_number" placeholder="请输入课程号">
							</td>
						</tr>
					<tr>
							<td>课程名：</td>
							<td><input type="text" class="form-control"
								name="course_name" id="course_name" placeholder="请输入课程名">
							</td>
						</tr>
						<tr>
						<td>学院：</td>
						<td><select class="form-control" name="College"
							onChange="changeMajor()">
								<optgroup>
									<!--可以在学院前面加上对应的编号，方便好找 -->
									<option value="0">--请选择学院--</option>
									<%
									for (int i = 0; i < findCollegeMajorClass.size(); i++) {
									%>
									<option
										value="<%=findCollegeMajorClass.get(i).getCollege_name()%>"><%=findCollegeMajorClass.get(i).getCollege_name()%></option>
									<%
									} ;
									%>
								</optgroup>
						</select></td>
					</tr>
					<tr>
						<td>专业：</td>
						<td><select class="form-control" name="Major">
								<optgroup>
									<option>--请选择专业--</option>
								</optgroup>
						</select></td>
					</tr>
					<tr>
						<td>班级：</td>
						<td><input type="text" class="form-control" name="course_class"
							id="course_class" /></td>
					</tr>
					<tr>
							<td>教师编号：</td>
							<td><input type="text" class="form-control"
								name="tea_number" id="tea_number">
							</td>
						</tr>
							<tr>
							<td>上课时间：</td>
							<td><input type="text" class="form-control"
								name="course_time" id="course_time" placeholder="请输入上课时间">
							</td>
						</tr>
							<tr>
							<td>上课地点：</td>
							<td><input type="text" class="form-control"
								name="course_address" id="course_address" placeholder="请输入上课地点">
							</td>
						</tr>	
						<tr>
							<td></td>
							<td><button type="submit" class="btn btn-primary">提&nbsp;交</button></td>
						</tr>
					</table>
					</center>
					</form>
	</div>
	<!--实现学院和专业的二级联动  -->
	 
	<script language="javascript">
  function changeMajor(){
   with(document.myForm){
    var Colleges = new Array();
Colleges["0"] = ["--请选择所在专业--"];
    	<%for (int i = 0; i < findCollegeMajorClass.size(); i++) {
	for (int j = 1; j < findCollegeMajorClass.get(i).getMajors().size(); j++) {%>
	Colleges["<%=findCollegeMajorClass.get(i).getCollege_name()%>"]=["<%=findCollegeMajorClass.get(i).getMajors().get(0).getMajor_name()%>"];
    Colleges["<%=findCollegeMajorClass.get(i).getCollege_name()%>"].push("<%=findCollegeMajorClass.get(i).getMajors().get(j).getMajor_name()%>");
<%} ;
} ;%>
    var value = College.value;
    Major.options.length = 0;
    var option;
    for(i = 0;i < Colleges[value].length;i++){
     option = new Option(Colleges[value][i],Colleges[value][i]);
     Major.options.add(option);
	 
    }
    if(College.value == "0")
     Major.disabled = true;
    else
     Major.disabled = false;
   }
  }
 </script>
<!-- 自动读取教师的编号 -->
	<script type="text/javascript">
	function fun(){
		<%String values=(String)session.getAttribute("tea_number");%>
	      var value="<%=values%>"
	　　document.getElementById("tea_number").value=value;
	}
</script>
</body>
</html>