<%@page import="cn.edu.ujn.wq.dao.Forum"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>班级论坛的界面</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
	.context
	{
	/* border:1px solid #000; */
	width:800px;
	margin-left: 20%;
	}
	.text
	{
	border:1px solid #000;
	width:400px;
	height: 80px;
   padding-top: 10px;
   padding-left: 3%;
	}
	</style>


</head>
<body >
<a href="stuMain.jsp">返回</a>
<%
List<Forum> forums=(List<Forum>)session.getAttribute("findOneClassForums");
%>
<!-- 顶部区域 -->
<div class="head">
<!-- 模态框（Modal） -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" >发布帖子</button>		
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
				发布帖子
				</h4>
			</div>
			<div class="modal-body">
			
		   <form action="<%=request.getContextPath()%>/formAdd.action">
				<center>
					<table style="margin: auto">
						<tr>
							<td>标题：</td>
							<td><input type="text" class="form-control" id="forum_name"
								name="forum_name"  placeholder="请输入姓名">
							</td>

						</tr>
						<tr>
							<td>用户：</td>
							<td><input type="text" class="form-control"
								name="forum_number" id="forum_number"
								placeholder="请输入教师编号"></td>

						</tr>
						<tr>
							<td>内容：</td>
							<td> <textarea class="form-control" rows="5" name="forum_text"></textarea></textarea></td>

						</tr>
					</table>
			</fieldset>
	</div>
	</table>
	</center>	
				
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="submit" class="btn btn-primary" >
					提交
				</button>
			</div>
			</div>
			
		</div><!-- /.modal-content -->
		</form>
	</div><!-- /.modal -->
</div>
</div><!-- head -->

<!-- 帖子展示区域 -->
<div class="context">
<form action="<%=request.getContextPath()%>/findOneForums.action" id="form1">
<%
for(int i=0;i<forums.size();i++)
{
%>
<div class="text">
<table>
<tr><td></td><td><h4><a onclick="setValue(<%=forums.get(i).getId()%>)"><%=forums.get(i).getForum_name() %></a></h4></td><td></td></tr>
<tr><td></td><td></td><td><h6><%=forums.get(i).getForum_date() %></h6></td></tr>
</table>
</div>
<%}; %>
<input type="hidden" name="ID" id="test" />
</form>
</div>
<script type="text/javascript">
var newsID;
//利用ajax传值
function requestParm()
{
	$.ajax(
	{
	type:"POST",
	url:"findOneForums.action",
	data:{ID:newsID},
	dataType:"json",
	}		
	)
	}
function setValue(value){
　　newsID=document.getElementById("test").value=value;
      //requestParm();
     $('#form1').submit();
}
</script>
		
</body>
</html>