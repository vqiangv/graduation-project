<%@page import="cn.edu.ujn.wq.dao.teaUser"%>
<%@page import="cn.edu.ujn.wq.dao.Stu_TeaUser"%>
<%@page import="java.util.List"%>
<%@page import="cn.edu.ujn.wq.dao.College"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>展示某院某专业某班级由某班主任管理</title>
<!-- bootstrap需要引入的外部文件 -->
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%List<Stu_TeaUser>stu_TeaUsers=(List<Stu_TeaUser>)session.getAttribute("findadminCMClassTea"); 
List<College> findCollegeMajorClass = (List<College>) session.getAttribute("allCollege");
List teaNamesList=(List)session.getAttribute("findadminCMClassTeaByNumber");
%>
<div class="context">
<table class="table table-bordered" id="tab" >
		<thead>
			<tr>
			<th>ID</th>
				<th>学院</th>
				<th>专业</th>
				<th>班级</th>
				<th>班主任编号</th>
				<th>姓名</th>
				<th width="100px">管理</th>
			</tr>
		</thead>
		<tbody>
			<%
			int j=0;
			for(int i=0;i<stu_TeaUsers.size();i++){
				j=i;
			%>
			<tr>
			   <td><%=j+1 %></td>
			    <td><%=stu_TeaUsers.get(i).getStu_college()%></td>
			     <td><%=stu_TeaUsers.get(i).getStu_major()%></td>
			      <td><%=stu_TeaUsers.get(i).getStu_class()%></td>
			       <td><%=stu_TeaUsers.get(i).getTea_number()%></td>
			       <td><%=teaNamesList.get(i)%></td>	
				<td>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick= "editInfo(<%=i+1%>,<%=stu_TeaUsers.get(i).getId()%>)">修改</button>		
				</td>
			</tr>
			<%
			};
			%>
		</tbody>
	</table>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
				修改班级负责人的信息
				</h4>
			</div>
			<div class="modal-body">
			
		   <form action="<%=request.getContextPath()%>/updateadminCMClassTea.action" name="myForm">
				<center>
					<table style="margin: auto">
						<tr>
							<td></td>
							<td><input type="hidden" class="form-control"
								name="id" id="id" >
							</td>
						</tr>
						<tr>
						<td>学院：</td>
						<td><select class="form-control" name="College"
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
						<td><select class="form-control" name="Major">
								<optgroup>
									<option>--请选择专业--</option>
								</optgroup>
						</select></td>
					</tr>
						<tr>
						<td>班级：</td>
						<td><input type="text" class="form-control" name="stu_class"
							id="stu_class" /></td>
					</tr>
						<tr>
							<td>教师编号：</td>
							<td><input type="text" class="form-control"
								name="tea_number" id="tea_number">
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
				<button type="submit" class="btn btn-primary" >
					提交
				</button>
			</div>
			</div>
			
		</div><!-- /.modal-content -->
		</form>
	</div><!-- /.modal -->
	<!--实现学院和专业的二级联动  --> 
	<script language="javascript">
  function changeMajor(){
   with(document.myForm){
    var Colleges = new Array();
Colleges["0"] = ["--请选择所在专业--"];
    	<%for (int i = 0; i < findCollegeMajorClass.size(); i++) {
	for ( j = 1; j < findCollegeMajorClass.get(i).getMajors().size(); j++) {%>
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
 </script>


	<!-- 给模态框里面赋值  -->
	<script type="text/javascript">
	 function editInfo(id,ID) {	 
			//获取表格中的一行数据
			var stu_college = document.getElementById("tab").rows[id].cells[1].innerText;
			var stu_major = document.getElementById("tab").rows[id].cells[2].innerText;
			var stu_class = document.getElementById("tab").rows[id].cells[3].innerText;
			var tea_number = document.getElementById("tab").rows[id].cells[4].innerText;
			//向模态框中传值
			$('#id').val(ID);
		    $('#stu_college').val(stu_college);
			$('#stu_major').val(stu_major);
			$('#stu_class').val(stu_class);
			$('#tea_number').val(tea_number); 
			} 
	</script>
</body>
</html>