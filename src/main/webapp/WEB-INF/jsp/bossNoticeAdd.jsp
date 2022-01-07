<%@page import="cn.edu.ujn.wq.dao.College"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>班主任发布班级公告的界面</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.form-control{	
	width: 400px;
}
.context
{
margin-top:1%;
margin-left: 5%;
}
</style>
<%List<College> findCollegeMajorClass = (List<College>) session.getAttribute("allCollege"); %>
</head>
<body>
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
<div class="context">
<form name="myForm" method="post">
	<center>
	<span>班级公告的发布</span>
		<table style="margin: auto">
			<tr>
				<td>标题：</td>
				<td><input type="text" class="form-control" name="new_home"
					id="new_home" placeholder="请输入公告的标题"></td>

			</tr>
			<tr>
				<td>作者：</td>
				<td><input type="text" class="form-control" name="new_author"
					id="new_author" placeholder="请输入公告的撰稿人"></td>
			</tr>
			<tr>
				<td>内容：</td>
				<td>
					
						<textarea class="form-control" rows="10" name="new_context" id="new_context"></textarea>
				</td>
			</tr>
			<tr>
						<td>学院：</td>
						<td><select class="form-control" name="College" id="new_college"
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
						<td><select class="form-control" name="Major" id="new_major">
								<optgroup>
									<option>--请选择专业--</option>
								</optgroup>
						</select></td>
					</tr>
					<tr>
						<td>班级：</td>
						<td><input type="text" class="form-control" name="new_class"
							id="new_class" /></td>
					</tr>
			<tr>
				<td></td>
				<td><button type="submit" class="btn btn-primary" onclick="requestParm()">提&nbsp;交</button></td>
			</tr>
		</table>
		</fieldset>
		</div>
		</table>
	</center>
	</form>
	</div>
		<script type="text/javascript">
	//利用ajax传值
	function requestParm()
	{
		$.ajax(
		{
		type:"POST",
		url:"bossNoticesAdd.action",
		data:{new_home:document.getElementById("new_home").value,new_author:document.getElementById("new_author").value,new_context:document.getElementById("new_context").value,new_college:document.getElementById("new_college").value,new_major:document.getElementById("new_major").value,new_class:document.getElementById("new_class").value,new_flag:"1"},
		dataType:"json",
		}		
		)
		}
	</script>
</body>
</html>