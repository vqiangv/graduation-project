<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<!-- 这是班主任和任课老师登录系统后共同的界面，由此根据不同的身份进入不同的界面 -->
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.btn-primary {
	margin-left: 200px;
}
.row
{
margin-top: 15%;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-sm-6 col-md-4 col-md-offset-2">
			<div class="thumbnail">
				<div class="caption">
					<h3>班主任</h3>
					<p>班主任身份</p>
					<p>
						<a href="bossManageClass.action" class="btn btn-primary" role="button">进入</a> <a
							href="outLogin.action" class="btn btn-default" role="button">退出</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>