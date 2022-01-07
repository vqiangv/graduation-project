<%@page import="cn.edu.ujn.wq.dao.teaUser"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台界面班主任账号的管理</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<%
List<teaUser> bossList = (List<teaUser>) session.getAttribute("findAllBoss");
%>
<body>
<script type="text/javascript">
function fun1()
{
	var value = document.getElementById("tab").cells[0];
	console.log(value);
	}
</script>
<form action="<%=request.getContextPath()%>/deleteBoss.action" method="post">
	<table class="table table-bordered" id="tab" >
		<thead>
			<tr>
			<th></th>
				<th>姓名</th>
				<th>编号</th>
				<th>性别</th>
				<th>身份证号</th>
				<th width="300px">管理</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (int i = 0; i < bossList.size(); i++) {
			%>
			<tr>
			   <td><%=bossList.get(i).getTea_id()%></td>
				<td><%=bossList.get(i).getTea_name()%></td>
				<td><%=bossList.get(i).getTea_number()%></td>
				<td><%=bossList.get(i).getTea_gender()%></td>
				<td><%=bossList.get(i).getTea_card()%></td>
				<td>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick= "editInfo(<%=i+1%>,<%=bossList.get(i).getTea_id()%>)">修改</button>		
				<button type="submit" class="btn btn-danger" onclick="deletesetValue(<%=bossList.get(i).getTea_id()%>)">删除</button>	
				</td>
			</tr>
			<%
			}
			;
			%>
		</tbody>
		<
	</table>
	<input type="hidden" name="BossId" id="test"/>
	</form>
	<script type="text/javascript">
	
	//利用ajax传值，更新数据库中的数据
	function requestParm()
	{
		$.ajax(
		{
		type:"POST",
		url:"updateBoss.action",
		data:{tea_id:document.getElementById("tea_id").value,tea_name:document.getElementById("tea_name").value,tea_number:document.getElementById("tea_number").value,
			tea_gender:document.getElementById("gender").value,tea_card:document.getElementById("tea_card").value,
			tea_flag:document.getElementById("tea_flag").value},
		dataType:"json",
		}		
		)
		}
	/*
	function requestPar()
	{
		$.ajax(
		{
		type:"POST",
		url:"deleteBoss.action",
		data:{hiddenBossId:document.getElementById("test").value},
		dataType:"json",
		success:function(data)
		{
			alert(data);
		}
		}		
		)
		}*/
/* 执行删除的操作 */
function deletesetValue(value){
　　document.getElementById("test").value=value;
      // requestPar();
}
/* 执行修改的操作 */
 function setValueID(value){
　　document.getElementById("BossId").value=value;
       requestParm();
       <%teaUser teaUser= (teaUser)session.getAttribute("findTeacherById");%>
       editInfo();
}
 function editInfo(id,ID) {
	 
		//获取表格中的一行数据
		var tea_name = document.getElementById("tab").rows[id].cells[1].innerText;
		var tea_number = document.getElementById("tab").rows[id].cells[2].innerText;
		var tea_gender = document.getElementById("tab").rows[id].cells[3].innerText;
		var tea_card = document.getElementById("tab").rows[id].cells[4].innerText;
		//向模态框中传值
		$('#tea_id').val(ID);
	    $('#tea_name').val(tea_name);
		$('#tea_number').val(tea_number);
		$('#tea_gender').val(tea_gender);
		$('#tea_card').val(tea_card); 
		} 
</script>
<input type="hidden" name="hiddenBossId" id="test"/>
<input type="hidden" name="hiddenBossId" id="BossId"/>
<!-- </form> -->
<!--  -->
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
				修改班主任的信息
				</h4>
			</div>
			<div class="modal-body">
			
		   <form action="<%=request.getContextPath()%>/updateBoss.action">
				<center>
					<table style="margin: auto">
						<tr>
							<td></td>
							<td><input type="hidden" class="form-control"
								name="tea_id" id="tea_id" >
							</td>
						</tr>
						<tr>
							<td>姓名：</td>
							<td><input type="text" class="form-control" id="tea_name"
								name="tea_name"  placeholder="请输入姓名">
							</td>

						</tr>
						<tr>
							<td>教师编号：</td>
							<td><input type="text" class="form-control"
								name="tea_number" id="tea_number"
								placeholder="请输入教师编号"></td>

						</tr>
						<tr>
							<td>性别：</td>
							<td><select class="form-control" name="tea_gender" id="tea_gender">
									<optgroup>
										<option>男</option>
										<option>女</option>
									</optgroup>
							</select></td>
						</tr>
						<tr>
							<td>身份证号：</td>
							<td><input type="text" class="form-control"
								name="tea_card" id="tea_card" placeholder="请输入身份证号">
							</td>
						</tr>
								<tr>
							<td>标志：</td>
							<td><select class="form-control" name="tea_flag" id="tea_flag">
									<optgroup>
										<option>1</option>
										<option>2</option>
									</optgroup>
							</select></td>
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


</body>
</html>