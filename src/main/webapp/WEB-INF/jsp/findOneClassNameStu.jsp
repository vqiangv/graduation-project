<%@page import="cn.edu.ujn.wq.dao.Hostel"%>
<%@page import="cn.edu.ujn.wq.dao.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!--这里是班主任进入他所管理的班级后，显示该班级全体成员的界面 -->
<head>
<meta charset="UTF-8">
<title></title>
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
	List<User> findstuList = (List<User>) session.getAttribute("bossManageOneClass");
	List<Hostel> findHoteList = (List<Hostel>) session.getAttribute("findHotel");
	%>
	<div class="stuClass">
		<!-- 页面标题 -->
		<div class="stuClass_head">
		
     <form action="<%=request.getContextPath()%>/deleteStu.action" method="post">
			<center>
			<table>
			<tr>
			<td>学院:</td>
			<td><%=findstuList.get(0).getStu_college()%></td>
			<td>专业:</td>
			<td><%=findstuList.get(0).getStu_major()%></td>
			<td>班级:</td>
			<td><%=findstuList.get(0).getStu_class()%></td>
			</tr>
			</table>
			</center>
		</div>
		<input type="button" class="btn btn-primary" value="返回"
			onclick="javascript:history.go(-1);" />
		<table class="table table-bordered" id="tab">
			<thead>
				<tr>
					<th>姓名</th>
					<th>学号</th>
					<th>性别</th>
					<th>楼栋</th>
					<th>宿舍号</th>
					<th>职位</th>
					<th width="150px">操作</th>
				</tr>
			</thead>
			<tbody>
				<%
				int j=0;
				for (int i = 0; i < findstuList.size(); i++) {
					j++;
				%>
				<tr>
				<!--可以加一行，在前端输出int型变量 -->
					<td><%=findstuList.get(i).getStu_name()%></td>
					<td><%=findstuList.get(i).getStu_number()%></td>
					<td><%=findstuList.get(i).getStu_gender()%></td>
					<td><%=findstuList.get(i).getStu_house()%></td>
					<td><%=findstuList.get(i).getStu_housenum()%></td>
					<td ><%=findstuList.get(i).getStu_job()%></td>
					<td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick= "editInfo(<%=i+1%>,<%=findstuList.get(i).getStu_id()%>)">修改</button>
					<button type="submit" class="btn btn-danger" onclick="deletesetValue(<%=findstuList.get(i).getStu_id()%>)" >删除</button>	
					</td>
				</tr>
				<%
				}
				;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
				%>

			</tbody>
		</table>
		<input type="hidden" name="stu_id" id="test"/>
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
				修改学生的信息
				</h4>
			</div>
			<div class="modal-body">
		<form name="myForm" action="<%=request.getContextPath()%>/updateStu1.action">
				<center>
					<table style="margin: auto">
						<tr>
							<td></td>
							<td><input type="hidden" class="form-control"
								name="stu_id" id="stu_id" >
							</td>
						</tr>
						<tr>
							<td>姓名：</td>
							<td><input type="text" class="form-control" id="stu_name"
								name="stu_name"  placeholder="请输入姓名">
							</td>

						</tr>
						<tr>
							<td>学号：</td>
							<td><input type="text" class="form-control"
								name="stu_number" id="stu_number"
								placeholder="请输入教师编号"></td>

						</tr>
						<tr>
							<td>性别：</td>
							<td><select class="form-control" name="stu_gender" id="stu_gender">
									<optgroup>
										<option>男</option>
										<option>女</option>
									</optgroup>
							</select></td>
						</tr>
						<tr>
						<tr>
						<td>楼栋：</td>
						<td><select class="form-control" name="Hotel" id="stu_house"
							onChange="changeHotel()">
								<optgroup>
									<!--可以在学院前面加上对应的编号，方便好找 -->
									<option value="0">--请选择楼栋--</option>
									<%
									for (int i = 0; i < findHoteList.size(); i++) {
									%>
									<option value="<%=findHoteList.get(i).getHostel_number()%>"><%=findHoteList.get(i).getHostel_number()%></option>
									<%
									} ;
									%>
								</optgroup>
						</select></td>
					</tr>
					<tr>
						<td>宿舍号：</td>
						<td><select class="form-control" name="HotelNum" id="stu_hotelnum">
								<optgroup>
									<option>--请选择宿舍--</option>
								</optgroup>
						</select></td>
					</tr>
						<tr>
							<td>身份证号：</td>
							<td><input type="text" class="form-control"
								name="stu_card" id="stu_card" placeholder="请输入身份证号">
							</td>
						</tr>
								<tr>
							<td>职位：</td>
							<td><select class="form-control" name="stu_job" id="stu_job">
									<optgroup>
										<option>班长</option>
										<option>团支书</option>
										<option>学习委员</option>
										<option>体育委员</option>
										<option>心灵使者</option>
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
		</from>
	</div><!-- /.modal -->
</div>

	<!-- 实现楼栋和宿舍号的二级联动 -->
	<script language="javascript">
	 function changeHotel(){
		   with(document.myForm){
		    var Hotels = new Array();
		Hotels["0"] = ["--请选择所在楼栋--"];
		
		//下面开始给每个楼栋赋下属的宿舍号
		    <%for (int i = 0; i < findHoteList.size(); i++) {%>
			Hotels["<%=findHoteList.get(i).getHostel_number()%>"]=["请从下面选择宿舍号"];
			<%for ( j = 0;j < Integer.parseInt(findHoteList.get(i).getHostel_num()); j++) {
	for (int k = 0; k < Integer.parseInt(findHoteList.get(i).getHostelHome_num()); k++) {%>		
			<%if (k > 8) {%>
			Hotels["<%=findHoteList.get(i).getHostel_number()%>"].push("<%=Integer.toString(j + 1) + Integer.toString(k + 1)%>");
			<%continue;
} ;%>
			Hotels["<%=findHoteList.get(i).getHostel_number()%>"].push("<%=Integer.toString(j + 1) + Integer.toString(0) + Integer.toString(k + 1)%>");
	<%} ;
} ;
} ;%>
		var value = Hotel.value;
				HotelNum.options.length = 0;
				var option;
				for (i = 0; i < Hotels[value].length; i++) {
					option = new Option(Hotels[value][i], Hotels[value][i]);
					HotelNum.options.add(option);

				}
				if (Hotel.value == "0")
					HotelNum.disabled = true;
				else
					HotelNum.disabled = false;
			}
		}
	</script>

	<script type="text/javascript">
	 function editInfo(id,ID) {	 
			//获取表格中的一行数据
			var stu_name = document.getElementById("tab").rows[id].cells[0].innerText;
			var stu_number = document.getElementById("tab").rows[id].cells[1].innerText;
			var stu_gender = document.getElementById("tab").rows[id].cells[2].innerText;
			var stu_house = document.getElementById("tab").rows[id].cells[3].innerText;
			var stu_housenum = document.getElementById("tab").rows[id].cells[4].innerText;
			var stu_card = document.getElementById("tab").rows[id].cells[5].innerText;
			var stu_job = document.getElementById("tab").rows[id].cells[6].innerText;
			//向模态框中传值
			$('#stu_id').val(ID);
		    $('#stu_name').val(stu_name);
			$('#stu_number').val(stu_number);
			$('#stu_gender').val(stu_gender);
			$('#stu_house').val(stu_number);
			$('#stu_housenum').val(stu_gender);
			$('#stu_card').val(stu_card); 
			$('#stu_job').val(stu_job); 
			} 
	 
	 /* 执行删除的操作 */
	 function deletesetValue(value){
	 　　document.getElementById("test").value=value;
	       // requestPar();
	 }
	</script>
</body>
</html>