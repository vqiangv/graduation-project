<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录界面</title>
<link type="text/css" rel="stylesheet "
	href=" <%=request.getContextPath()%>/css/main.css" />
<script src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet "
	href=" <%=request.getContextPath()%>/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- css样式 -->
<style type="text/css">
.context1 tr td:first-child {
	text-align: right;
	font-size: 18px;
}

#login_yanzhengma {
	text-align: center;
}

#message {
	padding-left: 50px;
}

#myButton {
	width: 180px;
}

.input-group {
	margin-top: 5px;
	margin-bottom: 5px';
}

.input-group input {
	height: 25px;
}

.regis {
	margin-left: -17px;
}
</style>
</head>
<body>
	<script>
		// 判断是登录账号和密码是否为空
		function check() {
			var usercode = $("#login_number").val();
			var password = $("#login_password").val();
			if (usercode == "" || password == "") {
				$("#message").text("账号或密码不能为空！");
				return false;
			}
			return true;
		}
	</script>
	<div class="home">
		<img src="<%=request.getContextPath()%>/img/图标/我的班级.png" width="80px"
			height="80px"> <span>班级学生信息管理系统</span>
	</div>
	<div class="context">
		<div class="context1">

			<font color="red"> <%-- 提示信息--%> <span id="message"></span>
			</font>
			<form action="<%=request.getContextPath()%>/login.action"
				method="post" onsubmit="return check()" id="myForm">
				<table style="margin: auto">
					<tr>
						<td>账号：</td>
						<td><div class="input-group mb-1">
								<input type="text" class="form-control" name="login_number"
									id="login_number">
							</div></td>
					</tr>
					<tr>
						<td>密码：</td>
						<td><div class="input-group mb-1">
								<input type="password" class="form-control"
									name="login_password" id="login_password">
							</div></td>
					</tr>
					<tr>
						<td>验证码：</td>
						<td><div class="input-group mb-1">
								<input type="text" class="form-control" name="login_yanzhengma" id="login_yanzhengma" autocomplete="off">
							</div></td>
					</tr>
					<tr>
						<td></td>
						<td><div id="code"></div></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<button type="button" id="myButton" class="btn btn-primary" onclick="panduan()">登录</button>
						</td>
					</tr>
				</table>
				
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
						panduanstr=str;
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

			</form>
			<div class="regis">
				<a href="College-major-class.action">
					<button type="submit" id="myButton" class="btn btn-default">注册</button>
				</a>
			</div>
		</div>
	</div>
	<!-- <center>
			<div class="last">
				<a href="http://beian.miit.gov.cn/">鲁ICP备2021012643号</a>
			</div>
		</center> -->
</body>
</html>