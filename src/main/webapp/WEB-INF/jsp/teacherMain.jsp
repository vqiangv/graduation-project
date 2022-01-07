<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="X-UA-Compatible" content="IE=edge"/>
		<meta name="keywords" content="班级信息"/>
		<meta name="description" content="无"/>
		<title>教师首页</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"/>
		<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	</head>
	<body>
		<!--header-->
		<div class="top_wrap">
			<!--top index-->
			<div class="top">
				<span class="welcome">欢迎您访问班级学生信息管理系统！</span>
				<div class="clear"></div>
			</div>
		</div>
		<!--logo and nav-->
		<div class="header_wrap">
			<div class="header">
				<a href="studentone.jsp" class="logo"><img src="<%=request.getContextPath()%>/img/图标/我的班级.png" /></a> 
				 <div class="nav_list">
					<ul id="nav" class="nav clearfix">
						<li class="nLi" style="display: none;"></li>
						<li class="nLi">
							<h3><a href="bossManageClass.action">班级管理</a></h3>
						</li>
						<li class="nLi">
							<h3><a href="#">宿舍信息</a></h3>
						</li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.0.min.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.SuperSlide.2.1.js" ></script>
		<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js" ></script> --%>
		<script type="text/javascript">
			//banner滚动效果
			jQuery(".banner").slide({ titCell:".hd ul", mainCell:".bd ul", effect:"fold",  autoPlay:true, autoPage:true, trigger:"click" });
			//tab切换效果
			jQuery(".left_tab").slide();
			//news滚动效果
			jQuery(".notice").slide({mainCell:".bd ul",autoPage:true,effect:"top",autoPlay:true,vis:3});
		</script>
	</body>
</html>