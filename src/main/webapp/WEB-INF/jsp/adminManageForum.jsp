<%@page import="cn.edu.ujn.wq.dao.teaUser"%>
<%@page import="java.util.List"%>
<%@page import="cn.edu.ujn.wq.dao.College"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--管理员选择学院专业班级去管理它的班级论坛帖子 -->
<title></title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.context
{
margin-top:15%;
}
</style>
<style type="text/css">
.btn {
	width: 200px;
}
</style>
<%List<College> findCollegeMajorClass = (List<College>) session.getAttribute("allCollege"); %>
</head>
<body>
<div class="context">
	<form
		action="<%=request.getContextPath()%>/adminFindOneClassForum.action"
		method="post" name="myForm">
		<center>
		<table>
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
						<td><input type="text" class="form-control" name="forum_class"
							id="forum_class" /></td>
					</tr>
			<tr>
				<td></td>
				<td><button type="submit" class="btn btn-primary">进&nbsp;入</button></td>
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
</body>
</html>