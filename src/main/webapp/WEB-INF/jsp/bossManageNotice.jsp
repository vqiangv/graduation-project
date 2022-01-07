<%@page import="cn.edu.ujn.wq.dao.News"%>
<%@page import="cn.edu.ujn.wq.dao.Hostel"%>
<%@page import="cn.edu.ujn.wq.dao.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>班主任管理班级公告的界面</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/stuClass.css">
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.stuClass_head {
	margin-top: 2%;
	margin-bottom: 2%;
}
.stuClass_head
{
font-size: 14px;
}
</style>
</head>
<body>
	<%
	List<News> classNoticesFindList = (List<News>) session.getAttribute("classNoticesFind");
	%>
	<div class="stuClass">
		<!-- 页面标题 -->
		<div class="stuClass_head">
		
     <form action="<%=request.getContextPath()%>/deleteClassNotice.action" method="post">
		</div>
		<table class="table table-bordered" id="tab">
			<thead>
				<tr>
					<th width="150px">公告标题</th>
					<th>撰稿人</th>
					<th>内容</th>
					<th>发布时间</th>
					<th width="150px">管理</th>
				</tr>
			</thead>
			<tbody>
				<%
				int j=0;
				for (int i = 0; i < classNoticesFindList.size(); i++) {
					j++;
				%>
				<tr>
				<!--可以加一行，在前端输出int型变量 -->
					<td><%=classNoticesFindList.get(i).getNew_home()%></td>
					<td><%=classNoticesFindList.get(i).getNew_author()%></td>
					<td><%=classNoticesFindList.get(i).getNew_context()%></td>
					<td><%=classNoticesFindList.get(i).getNew_date()%></td>
					<td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick= "editInfo(<%=i+1%>,<%=classNoticesFindList.get(i).getNew_id()%>)">修改</button>
					<button type="submit" class="btn btn-danger" onclick="deletesetValue(<%=classNoticesFindList.get(i).getNew_id()%>)" >删除</button>	
					</td>
				</tr>
				<%
				}
				;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
				%>

			</tbody>
		</table>
		<input type="hidden" name="new_id" id="test"/>
		</form>
			
		<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
				修改班级公告的信息
				</h4>
			</div>
			<div class="modal-body">
		<form name="myForm" action="<%=request.getContextPath()%>/updateClassNotice.action">
				<center>
					<table style="margin: auto">
						<tr>
							<td></td>
							<td><input type="hidden" class="form-control"
								name="new_id" id="new_id" >
							</td>
						</tr>
						<tr>
							<td>标题：</td>
							<td><input type="text" class="form-control" id="new_home"
								name="new_home"  placeholder="请输入姓名">
							</td>

						</tr>
						<tr>
							<td>撰稿人：</td>
							<td><input type="text" class="form-control"
								name="new_author" id="new_author"
								placeholder="请输入教师编号"></td>

						</tr>
						<tr>
							<td>内容：</td>
							<td>
					       <textarea class="form-control" rows="8" name="new_context" id="new_context"></textarea>
								</td>
						</tr>
						<tr>
							<td>时间：</td>
							<td><input type="text" class="form-control"
								name="new_date" id="new_date"
								placeholder="请输入教师编号"></td>
						</tr>
					</table>
			</fieldset>
	</div>
	</table>
	</center>	
				
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="submit" class="btn btn-primary">
					提交
				</button>
			</div>
			</div>
		</div><!-- /.modal-content -->
		</from>
	</div><!-- /.modal -->
</div>

    <!--给模态框中添加内容 -->
	<script type="text/javascript">
	 function editInfo(id,ID) {	 
			//获取表格中的一行数据
			var new_home = document.getElementById("tab").rows[id].cells[0].innerText;
			var new_author = document.getElementById("tab").rows[id].cells[1].innerText;
			var new_context = document.getElementById("tab").rows[id].cells[2].innerText;
			var new_date = document.getElementById("tab").rows[id].cells[3].innerText;
			//向模态框中传值
			$('#new_id').val(ID);
		    $('#new_home').val(new_home);
			$('#new_author').val(new_author);
			$('#new_context').val(new_context);
			$('#new_date').val(new_date);
			} 
	 
	 /* 执行删除的操作 */
	 function deletesetValue(value){
	 　　document.getElementById("test").value=value;
	       // requestPar();
	 }
	</script>
</body>
</html>