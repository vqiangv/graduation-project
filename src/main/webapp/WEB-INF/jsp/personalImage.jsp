<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>完善个人头像的界面</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<form action="<%=request.getContextPath()%>/addUserImage.action">
<input type="file" name="image" class="projectfile" />
<button type="submit" id="myButton" class="btn btn-primary">提交</button>
</form>
<a href="findImageByNumber.action">实验</a>
</body>
</html>