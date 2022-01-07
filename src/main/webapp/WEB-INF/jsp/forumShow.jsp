<%@page import="java.util.List"%>
<%@page import="cn.edu.ujn.wq.dao.Forum"%>
<%@page import="cn.edu.ujn.wq.dao.Forumt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主帖子的展示界面</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.text
{
border:1px solid #000;
width:800px;
	height: 200px;
	margin-left: 15%;
}
.texttwo
{
border:1px solid #000;
width:800px;
	height: 400px;
	margin-left: 15%;
}
.forumAdd
{
border:1px solid #000;
width:800px;
	height: 200px;
	margin-left: 15%;
}
</style>
<!-- <script type="text/javascript">
	function myrefresh() {
		window.location.reload();
	}
	//指定1秒刷新一次
	setTimeout('myrefresh()',);
</script> -->
</head>
<body>
<a href="forum.jsp">返回</a>
<%Forum forum=(Forum)session.getAttribute("findOneForums"); 
List<Forumt> Forums=(List<Forumt>)session.getAttribute("findOneAllHuiForums");
%>
<!-- 主帖子的展示区域 -->
<div class="text">
<h3><%=forum.getForum_name()%></h3>
<h6><%=forum.getForum_date() %></h6>
<%-- <h5><%=forum.getForum_text() %></h5> --%>
</div>
<!-- 留言的展示区域-->
<div class="texttwo">
<%
for(int i=0;i<Forums.size();i++)
{
%>

<table>
<tr><td></td><td><%=Forums.get(i).getForumt_text()%></td><td></td></tr>
<tr><td></td><td></td><td><h6><%=Forums.get(i).getForumt_date()%></h6></td></tr>
</table>

<%}; %>
</div>
<!--发布留言的功能  -->
<div class="forumAdd">
<form action="<%=request.getContextPath()%>/LiuYanAdd.action"  method="get" id="form1">
<table>
						<tr>
							<td>内容：</td>
							<td> <textarea class="form-control" rows="5" name="forumt_text"></textarea></textarea></td>
						</tr>
						<tr>
						<td></td>
						<td><button type="submit" class="btn btn-primary" >
					提交
				</button></td>
						</tr>
</table>
</form>
</div>
</body>
</html>