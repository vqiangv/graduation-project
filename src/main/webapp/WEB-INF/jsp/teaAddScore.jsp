<%@page import="cn.edu.ujn.wq.dao.User"%>
<%@page import="cn.edu.ujn.wq.dao.Forum"%>
<%@page import="cn.edu.ujn.wq.dao.Forumt"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>任课老师管理教学班级的界面</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<%
List<User>findAllClassList=(List<User>)session.getAttribute("teaTOFindAddCourseXiaoguoList");
List numberNameList=(List)session.getAttribute("teaTOFindAddCourseXiaoguoNNList");
%>
<body>
	<center>
			<table>
			<tr>
			<td><%=findAllClassList.get(0).getStu_college()+"-"+findAllClassList.get(0).getStu_major()+"-"+findAllClassList.get(0).getStu_class()%></td>
			</tr>
			</table>
			</center>
<form action="<%=request.getContextPath()%>/"  method="post" >
	<table class="table table-bordered" id="tab" >
		<thead>
			<tr>
				<th>课程号</th>
				<th>课程名</th>
				<th>姓名</th>
				<th>学号</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<%
		for (int i = 0; i < findAllClassList.size(); i++) {
		%>
			<tr>
				<td><%=numberNameList.get(0)%></td>
				<td><%=numberNameList.get(1)%></td>
				<td><%=findAllClassList.get(i).getStu_name()%></td>
				<td><%=findAllClassList.get(i).getStu_number()%></td>
				<td><button type="button" 
				class="btn btn-info" data-toggle="modal" data-target="#myModal" onclick="editInfo(<%=i+1%>,'<%=findAllClassList.get(0).getStu_college()%>','<%=findAllClassList.get(0).getStu_major()%>' ,'<%=findAllClassList.get(0).getStu_class()%>' )">录入成绩</button>
				</td>
			</tr>
			<%
			}
			;
			%>
		</tbody>
		
	</table>
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
				录入成绩
				</h4>
			</div>
			<div class="modal-body">
		<form name="myForm" action="<%=request.getContextPath()%>/teaFindAddCourseXiaoguo.action">
				<center>
					<table style="margin: auto">
						<tr>
							<td>学院：</td>
							<td><input type="text" class="form-control" id="course_college"
								name="course_college"  placeholder="请输入姓名">
							</td>
						</tr>
						<tr>
							<td>专业：</td>
							<td><input type="text" class="form-control" id="course_major"
								name="course_major"  placeholder="请输入姓名">
							</td>
						</tr>
						<tr>
							<td>班级：</td>
							<td><input type="text" class="form-control" id="course_class"
								name="course_class"  placeholder="请输入姓名">
							</td>
						</tr>
						<tr>
							<td>课程号：</td>
							<td><input type="text" class="form-control" id="course_number"
								name="course_number"  >
							</td>
						</tr>
						<tr>
							<td>课程名：</td>
							<td><input type="text" class="form-control" id="course_name"
								name="course_name"  >
							</td>
						</tr>
						<tr>
							<td>姓名：</td>
							<td><input type="text" class="form-control" id="stu_name"
								name="stu_name" >
							</td>
						</tr>
						<tr>
							<td>学号：</td>
							<td><input type="text" class="form-control" id="stu_number"
								name="stu_number"  >
							</td>
						</tr>
						<tr>
							<td>分数：</td>
							<td><input type="text" class="form-control" id="score"
								name="score" >
							</td>
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

	<script type="text/javascript">
	 function editInfo(id,course_college,course_major,course_class) {	 
		   console.log(id);
			//获取表格中的一行数据
			var course_number = document.getElementById("tab").rows[id].cells[0].innerText;
			var course_name = document.getElementById("tab").rows[id].cells[1].innerText;
			var stu_name = document.getElementById("tab").rows[id].cells[2].innerText;
			var stu_number = document.getElementById("tab").rows[id].cells[3].innerText;
			//向模态框中传值
		    $('#stu_name').val(stu_name);
			$('#stu_number').val(stu_number);
			$('#course_number').val(course_number);
			$('#course_name').val(course_name);
			
			$('#course_college').val(course_college);
			$('#course_major').val(course_major);
			$('#course_class').val(course_class);
			
	 }
	</script>
</body>
</html>