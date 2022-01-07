<%@page import="cn.edu.ujn.wq.dao.Stu_TeaUser"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>班主任管理班级的名单</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
.btn-primary {
	margin-left: 200px;
}
.thumbnail
{
margin-top: 20%;
}

</style>
<%
List<Stu_TeaUser> bossManageList = (List<Stu_TeaUser>) session.getAttribute("bossManageClass");
%>
</head>
<body>
<form action="<%=request.getContextPath()%>/bossManageOneClass.action" method="post" >
<%
	 for(int i=0;i<bossManageList.size();i++)
	   {
%>

<div class="col-sm-4 col-md-4 ">
			<div class="thumbnail">
				<div class="caption">
					<%=bossManageList.get(i).getStu_college()%><br>
					<%=bossManageList.get(i).getStu_major()%> <br>
					<%=bossManageList.get(i).getStu_class()%> <br>
					<p>
						<input type="submit" class="btn btn-primary" role="button" value="进入" onclick="setValue(<%=bossManageList.get(i).getId()%>)"/>
					</p>
				</div>
			</div>
		</div>

	<%
}; %>
<input type="hidden" name="stu_id" id="stu_id"/>
</form>
<script type="text/javascript">
function setValue(value){
　document.getElementById("stu_id").value=value;
}

</script>
</body>
</html>