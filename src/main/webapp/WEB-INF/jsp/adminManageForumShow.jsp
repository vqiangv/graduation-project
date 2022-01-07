<%@page import="cn.edu.ujn.wq.dao.Forum"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员查看某学院某专业某班级的论坛帖子界面</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<%
List<Forum>forums=(List<Forum>)session.getAttribute("adminFindOneClassForum");
%>
<body>

<form  method="post"action="<%=request.getContextPath()%>/findAllHuiFu.action">
	<table class="table table-bordered" id="tab" >
		<thead>
			<tr>
				<th>标题</th>
				<th>发布者</th>
				<th width="100px">内容</th>
				<th>时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<%
		for (int i = 0; i < forums.size(); i++) {
		%>
			<tr>
				<td><%=forums.get(i).getForum_name()%></td>
				<td><%=forums.get(i).getForum_number()%></td>
				<td><%=forums.get(i).getForum_text()%></td>
				<td><%=forums.get(i).getForum_date()%></td>
				<td><button type="submit" class="btn btn-danger" onclick="setValue(<%=forums.get(i).getId()%>)" formaction="<%=request.getContextPath()%>/adminDeleteOneForum.action">删除</button>
				<button type="submit" class="btn btn-primary" onclick="setValue(<%=forums.get(i).getId()%>)">查看</button>
				</td>
			</tr>
			<%
			}
			;
			%>
		</tbody>
		
	</table>
	<script type="text/javascript">

function setValue(value){

　　document.getElementById("test").value=value;

}
//利用ajax传值
function requestParm()
{
	$.ajax(
	{
	type:"POST",
	url:"adminDeleteOneForum.action",
	data:{ID:document.getElementById("test").value},
	dataType:"json",
	}		
	)
	}
function setValuet(value){
	　　document.getElementById("test").value=value;
	       requestParm()
	}

</script>
<input type="hidden" name="ID" id="test"/>
</form>
</body>
</html>