<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/register.css"
	type=text/css rel=stylesheet />
<script type="text/javascript"
	src=" <%=request.getContextPath()%>/js/regis.js"></script>
<!-- bootstrap需要引入的外部文件 -->
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.btn
{
width:200px;
}
</style>
</head>
<body>
	<div class="person">
		<form action="<%=request.getContextPath()%>/userCreate"
			method="post">
			<fieldset>
				<table style="margin: auto">
					<tr>
						<td>姓名：</td>
						<td><input type="text" name="stu_name" id="stu_name" class="form-control" 
							placeholder="请输入姓名" /></td>

					</tr>
					<tr>
						<td>学号：</td>
						<td><input type="text" name="stu_number"  id="stu_number" class="form-control" 
							placeholder="请输入学号" /></td>

					</tr>
					<tr>
					<td>性别：</td>
					<td><select class="form-control" name="stu_gender" >
								<optgroup>
									<option>男</option>
									<option>女</option>
								</optgroup>
						</select></td>
					</tr>
					<tr>
						<td>学院：</td>
						<td><select class="form-control" name="stu_college" >
								<optgroup>
									<!--可以在学院前面加上对应的编号，方便好找 -->
									<option>信息科学与工程学院</option>
									<option>马克思主义学院</option>
									<option>数学科学学院</option>
									<option>外国语学院</option>
									<option>政法学院</option>
									<option>音乐学院</option>
									<option>体育学院</option>
									<option>创业学院</option>
									<option>化学化工学院</option>
									<option>土木建筑学院</option>
								</optgroup>
						</select></td>
					</tr>
					<tr>
						<td>专业：</td>
						<td><input type="text" class="form-control"
							name="stu_major"  id="stu_major" / ></td>
					</tr>
					<tr>
						<td>班级：</td>
						<td><input type="text" class="form-control"
							name="stu_class" id="stu_class" /></td>
					</tr>
					<tr>
					<td>楼栋：</td>
						<td><input type="text" class="form-control"
							name="stu_house" id="stu_house"></td>
					</tr>
					<tr>
					<td>宿舍号：</td>
						<td><input type="text" class="form-control"
							name="stu_housenum" id="stu_housenum" /></td>
					</tr>
					<tr>
						<td>密码：</td>
						<td><input type="password" name="stu_password" class="form-control" 
							/></td>
					</tr>
						<tr>
					<td></td>
					<td><button type="submit" class="btn btn-primary" >提&nbsp;交</button></td>
					</tr>
				</table>
			</fieldset>
	</div>
	</form>
	</div>

</body>
</html>