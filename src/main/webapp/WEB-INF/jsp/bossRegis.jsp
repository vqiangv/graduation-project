<%@page import="cn.edu.ujn.wq.dao.College"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<meta charset="utf-8">
<title>班主任账号添加界面</title>
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
<%List<College> findCollegeMajorClass = (List<College>) session.getAttribute("allCollege"); %>
</head>
<body>
	<div class="head">
		<span>班主任账号添加</span>
	</div>
	<div class="person">

		<form action="<%=request.getContextPath()%>/bossUserCreate.action"
			method="post" name="myForm">
			<fieldset>
				<center>
					<table style="margin: auto">
						<tr>
							<td>姓名：</td>
							<td><input type="text" class="form-control"
								name="tea_name" id="login_password" placeholder="请输入姓名">
							</td>

						</tr>
						<tr>
							<td>教师编号：</td>
							<td><input type="text" class="form-control"
								name="tea_number" id="login_password"
								placeholder="请输入教师编号"></td>

						</tr>
						<tr>
							<td>性别：</td>
							<td><select class="form-control" name="tea_gender">
									<optgroup>
										<option>男</option>
										<option>女</option>
									</optgroup>
							</select></td>
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
							<td>管理班级：</td>
							<td><input type="text" class="form-control"
								name="tea_class" id="tea_class"
								placeholder="管理班级的名称"></td>
						</tr>
						<tr>
							<td>身份证号：</td>
							<td><input type="text" class="form-control"
								name="tea_card" id="stu_number" placeholder="请输入身份证号">
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
</body>
</html>