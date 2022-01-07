<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!--管理员课程的添加，添加的是培养方案的课程  -->
<head>
<meta charset="UTF-8">
<title>管理员课程添加界面</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.person {
	margin-top: 5%;
}

.btn {
	width: 200px;
}

.head {
	font-size: 22px;
	text-align: center;
	color: #6666ff;
	margin-top: 5%;
}
</style>
</head>
<body>
	<div class="head">
		<span>管理员课程添加</span>
	</div>
	<div class="person">
		<form 
			method="post" action="<%=request.getContextPath()%>/adminCourseAdd.action">
			<fieldset>
				<center>
					<table style="margin: auto">
						<tr>
							<td>年份：</td>
							<td><select class="form-control" name="course_year">
								<optgroup>
									<option>--请选择年份--</option>
									<%for(int i=22;i>13;i--){ %>
									<option><%="20"+Integer.toString(i)+"-"+"20"+Integer.toString(i+1) %></option>
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
							<td>学分：</td>
							<td><input type="text" class="form-control"
								name="course_score" id="course_score" placeholder="请输入课程学分">
							</td>
						</tr>
						<tr>
							<td></td>
							<td><button type="submit" class="btn btn-primary">提&nbsp;交</button></td>
						</tr>
					</table>
			</fieldset>
	</div>
	</table>
	</center>
	</fieldset>
	<div class="last">
		<center></center>
	</div>
	</form>
	</div>
</body>
</html>