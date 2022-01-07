<%@page import="cn.edu.ujn.wq.dao.College"%>
<%@page import="java.util.List"%>
<%@page import="cn.edu.ujn.wq.dao.teaUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台界面任课老师账号的管理</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<%
List<College> findCollegeMajorClass = (List<College>) session.getAttribute("allCollege");
List<teaUser>findAllTeaList=(List<teaUser>)session.getAttribute("findAllTea");
%>
<body>
<script type="text/javascript">

</script>
	<table class="table table-bordered" id="tab" >
		<thead>
			<tr>
			<th></th>
				<th>姓名</th>
				<th>编号</th>
				<th>性别</th>
				<th>学院</th>
				<th>专业</th>
				<th>身份证号</th>
				<th width="150px">管理</th>
			</tr>
		</thead>
		<tbody>
			<%
		for(int i=0;i<findAllTeaList.size();i++)
		{
			%>
			<tr>
			<td></td>
			   <td><%=findAllTeaList.get(i).getTea_name() %></td>
				<td><%=findAllTeaList.get(i).getTea_number() %></td>
				<td><%=findAllTeaList.get(i).getTea_gender()%></td>
				<td><%=findAllTeaList.get(i).getTea_college()%></td>
				<td><%=findAllTeaList.get(i).getTea_major()%></td>
				<td><%=findAllTeaList.get(i).getTea_card()%></td>
				
				<td>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick= "editInfo(<%=i+1%>,<%=findAllTeaList.get(i).getTea_id()%>)">修改</button>		
				<button type="submit" class="btn btn-danger" >删除</button>	
				</td>
			</tr>
			<%
		     };
			%>
		</tbody>
		<
	</table>
	<input type="hidden" name="BossId" id="test"/>
	
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
				修改任课老师的信息
				</h4>
			</div>
			<div class="modal-body">
		    <form name="myForm" action="<%=request.getContextPath()%>/updateTeacher.action">
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
						<td>学院：</td>
						<td><select class="form-control" name="College" id="tea_college"
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
						<td><select class="form-control" name="Major" id="tea_major">
								<optgroup>
									<option>--请选择专业--</option>
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
				<button type="submit" class="btn btn-primary">
					提交
				</button>
			</div>
			</div>
		</div><!-- /.modal-content -->
		</form>
	</div><!-- /.modal -->
</div>
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

function editInfo(id,ID) {
	 
	//获取表格中的一行数据
	var tea_name = document.getElementById("tab").rows[id].cells[1].innerText;
	var tea_number = document.getElementById("tab").rows[id].cells[2].innerText;
	var tea_gender = document.getElementById("tab").rows[id].cells[3].innerText;
	var tea_college = document.getElementById("tab").rows[id].cells[4].innerText;
	var tea_major = document.getElementById("tab").rows[id].cells[5].innerText;
	var tea_card = document.getElementById("tab").rows[id].cells[6].innerText;
	//向模态框中传值
	$('#tea_id').val(ID);
    $('#tea_name').val(tea_name);
	$('#tea_number').val(tea_number);
	$('#tea_gender').val(tea_gender);
	$('#tea_college').val(tea_college);
	$('#tea_major').val(tea_major);
	$('#tea_card').val(tea_card); 
	} 
 </script>

</body>
</html>