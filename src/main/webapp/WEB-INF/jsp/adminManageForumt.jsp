<%@page import="cn.edu.ujn.wq.dao.Forum"%>
<%@page import="cn.edu.ujn.wq.dao.Forumt"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员管理某个帖子的留言的界面</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<%
List<Forumt>forums=(List<Forumt>)session.getAttribute("findAllHuiFut");
%>
<body>
<span class="back"><a  href="adminManageForumShow.jsp">《《返回上一页</a></span>
<form action="<%=request.getContextPath()%>/adminDeleteOneForumt.action"  method="post" >
	<table class="table table-bordered" id="tab" >
		<thead>
			<tr>
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
				<td><%=forums.get(i).getForumt_number()%></td>
				<td><%=forums.get(i).getForumt_text()%></td>
				<td><%=forums.get(i).getForumt_date()%></td>
				<td><button type="submit" class="btn btn-danger" onclick="setValue(<%=forums.get(i).getUni_id()%>)">删除</button>
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
</script>
<input type="hidden" name="id" id="test"/>
</form>
</body>
</html>