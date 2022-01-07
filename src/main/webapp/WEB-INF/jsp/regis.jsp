<%@page import="cn.edu.ujn.wq.dao.Hostel"%>
<%@page import="cn.edu.ujn.wq.dao.College"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>

<meta charset="utf-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/register.css"
	type=text/css rel=stylesheet />
<script type="text/javascript"
	src=" <%=request.getContextPath()%>/js/regis.js"></script>
<!-- bootstrap需要引入的外部文件 -->
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.btn {
	width: 200px;
}
#login_yanzhengma {
	text-align: center;
}
</style>
<%
List<College> findCollegeMajorClass = (List<College>) session.getAttribute("allCollege");
List<Hostel> findHoteList = (List<Hostel>) session.getAttribute("findHotel");
%>
</head>
<body>
	<span class="back"><a  href="logint.jsp">《《返回首页</a></span>
	<div class="head">
		<p>欢迎来到注册界面</p>
		<div class="head-hr"></div>
	</div>
	<div class="person">
		<form action="<%=request.getContextPath()%>/userCreate" method="post"
			name="myForm"  id="myForm">
			<fieldset>
				<table style="margin: auto">
					<tr>
						<td>姓名：</td>
						<td><input type="text" name="stu_name" id="stu_name"
							placeholder="请输入姓名" /></td>

					</tr>
					<tr>
						<td>学号：</td>
						<td><input type="text" name="stu_number" id="stu_number"
							placeholder="请输入学号" /></td>

					</tr>
					<tr>
						<td>性别：</td>
						<td><select class="form-control" name="stu_gender">
								<optgroup>
									<option>--请选择性别--</option>
									<option>男</option>
									<option>女</option>
								</optgroup>
						</select></td>
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
						<td>楼栋：</td>
						<td><select class="form-control" name="Hotel"
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
						<td><select class="form-control" name="HotelNum">
								<optgroup>
									<option>--请选择宿舍--</option>
								</optgroup>
						</select></td>
					</tr>
					<tr>
						<td>密码：</td>
						<td><input type="password" name="stu_password"
							placeholder="请输入密码" /></td>
					</tr>
				<!-- 	<tr>
						<td>确认密码：</td>
						<td><input type="password" name="regis_passwordt"
							placeholder="请再次输入密码" /></td>
					</tr> -->
				<!-- 	<tr>
						<td>验证码：</td>
						<td width="100px">
						
						<input type="text" id="yanzheng"
							colspan="2" name="regis_yanzm" placeholder="请输入验证码">
							
							<div class="input-group mb-1">
								<input type="text" class="form-control" name="login_yanzhengma" id="login_yanzhengma">
							</div>
							</td>
					</tr> -->
					
					<!-- <tr>
						<td></td>
						<td><div id="code"></div></td>
					</tr> -->
					
					<tr>
						<td></td>
						<td><button type="submit" class="btn btn-primary" >提&nbsp;交</button></td>
					</tr>
				</table>
			</fieldset>
	</div>
	<!-- 随机生成验证码 -->
	<script>
		var codeStr = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
		var oDiv = document.getElementById('code');
		var panduanstr;
		// 用来生成随机整数
		function getRandom(n, m) { // param: (Number, Number)
			n = Number(n);
			m = Number(m);
			// 确保 m 始终大于 n
			if (n > m) {
				var temp = n;
				n = m;
				m = temp;
			}
			return Math.floor(Math.random() * (m - n) + n);
		}
		// 将随机生成的整数下标对应的字母放入div中
		function getCode() {
			var str = '';
			// 验证码有几位就循环几次
			for (var i = 0; i < 5; i++) {
				var ran = getRandom(0, 62);
				str += codeStr.charAt(ran);
			}
			oDiv.innerHTML = str;
		}
		getCode();// 调用函数，页面刷新也会刷新验证码
		// 点击刷新验证码
		oDiv.onclick = function() {
			getCode();
		}
		
		function panduan()
		{
			//获取验证码输入框里面的内容
			var value = document.getElementById("login_yanzhengma").value;
			alert(value);
			if(value==panduanstr)
				{
				//控制表单的提交
				document.getElementById("myForm").submit();
				}
			else
				{
				alert("验证码错误！");
				getCode();
				}
		}
	</script>
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
 </script>

	<!-- 实现楼栋和宿舍号的二级联动 -->
	<script language="javascript">
	 function changeHotel(){
		   with(document.myForm){
		    var Hotels = new Array();
		Hotels["0"] = ["--请选择所在楼栋--"];
		//下面开始给每个楼栋赋下属的宿舍号
		    	<%for (int i = 0; i < findHoteList.size(); i++) {%>
			Hotels["<%=findHoteList.get(i).getHostel_number()%>"]=["请从下面选择宿舍号"];
			<%for (int j = 0; j < Integer.parseInt(findHoteList.get(i).getHostel_num()); j++) {
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
	</form>
	</div>
</body>
</html>