
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>宿舍信息的创建界面</title>
<!-- bootstrap外部文件 -->
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
	.context
	{
	margin-top: 15%;
	}
	</style>
</head>
<body>
<div class="context">
<form action="<%=request.getContextPath()%>/hostelAdd.action" method="post">
<center>
<table>
<tr> <td>楼栋号：</td><td><input type="text" name="hostel_number"  class="form-control"
							placeholder="请输入楼栋号" /></td></tr>
<tr><td>楼层数：</td><td><select class="form-control" name="hostel_num" >
								<optgroup>
								<option >--请选择楼层数--</option>
								<%
								for(int i=1;i<12;i++)
								{
									Integer.toString(i);
								%>
									<option><%=Integer.toString(i)%></option>
									<%}; %>
								</optgroup>
						</select></td></tr>
<tr><td>房间数：</td><td><input type="text" name="hostelHome_num"  class="form-control"
							placeholder="请输入房间数/层" /></td></tr>
<tr><td>宿舍容量：</td><td><select class="form-control" name="hostelPerson_num" >
								<optgroup>
								<option >--请选择宿舍容量--</option>
									<%
								for(int i=2;i<9;i=i+2)
								{
									Integer.toString(i);
								%>
									<option><%=Integer.toString(i)%></option>
									<%}; %>
								</optgroup>
						</select></td></tr>
<tr><td></td><td><button type="submit" class="btn btn-primary" >提&nbsp;交</button></td></tr>
</table>
</center>
</form>
</div>
</body>
</html>