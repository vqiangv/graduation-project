<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员界面</title>
<!-- bootstrap需要引入的外部文件 -->
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/tendina.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/common1.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/index.css" type="text/css"
	media="screen" />



</head>
<body>
	<!--顶部-->
	<div class="layout_top_header">
		<div style="float: left">
			<span
				style="font-size: 16px; line-height: 45px; padding-left: 20px; color: #8d8d8d">班级学生信息管理后台
				</h1>
			</span>
		</div>
		<div id="ad_setting" class="ad_setting">
			<a class="ad_setting_a" href="#"> <i
				class="icon-user glyph-icon" style="font-size: 20px"></i> <span>管理员</span>
				<i class="icon-chevron-down glyph-icon"></i>
			</a>
			<ul class="dropdown-menu-uu" style="display: none" id="ad_setting_ul">
				<li class="ad_setting_ul_li"><a href="outLogin.action"><i
						class="icon-signout glyph-icon"></i> <span class="font-bold">退出</span>
				</a></li>
			</ul>
		</div>
	</div>
	<!--顶部结束-->
	<!--菜单-->
	<div class="layout_left_menu">
		<ul id="menu">
			<li class="childUlLi"><a href="user.html" target="menuFrame">
					<i class="glyphicon glyphicon-user"></i>成员管理
			</a>
				<ul id="menu">
					<!-- target="menuFrame" 使结果展示在右侧的主要界面里面 
                 class="childUlLi" 用来进行图标的缩进
                 -->
					<li class="childUlLi"><a href="regis.jsp" target="menuFrame"><i
							class="glyphicon glyphicon-triangle-right"></i>学生管理</a>
						<ul id="menu">
							<li><a href="adminSturegis.jsp" target="menuFrame"><i
									class="glyphicon glyphicon-menu-right"></i>学生账号添加</a></li>
							<li><a href="findAllClassName.action" target="menuFrame"><i
									class="glyphicon glyphicon-menu-right"></i>学生账号管理</a></li>
						</ul></li>
					<li><a href="#"><i
							class="glyphicon glyphicon-triangle-right"></i>班主任管理</a>
						<ul id="menu">
							<li><a href="bossRegis.jsp" target="menuFrame"><i
									class="glyphicon glyphicon-menu-right" ></i>班主任账号添加</a></li>
							<li><a href="findAllBoss.action" target="menuFrame"><i
									class="glyphicon glyphicon-menu-right"></i>班主任账号管理</a></li>
						</ul></li>
					<li><a href="#"><i
							class="glyphicon glyphicon-triangle-right"></i>任课老师管理</a>
						<ul id="menu">
							<li><a href="teacherRegis.jsp" target="menuFrame"><i
									class="glyphicon glyphicon-menu-right"></i>任课老师账号添加</a></li>
							<li><a href="findAlltea.action" target="menuFrame"><i
									class="glyphicon glyphicon-menu-right" target="menuFrame"></i>任课老师账号管理</a></li>
						</ul></li>
				
				</ul></li>
			<li class="childUlLi"><a href="role.html" target="menuFrame">
					<i class="glyph-icon icon-reorder"></i>班级信息管理
			</a>
				<ul>
					<li><a href="adminClassAdd.jsp" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>创建班级</a></li>
					<!-- 展示某院某专业某班级由某班主任管理-->
					<li><a href="findadminCMClassTea.action" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>班级管理</a></li>
				</ul></li>
			<li class="childUlLi"><a href="#"> <i
					class="glyph-icon  icon-location-arrow"></i>新闻管理
			</a>
				<ul>
					<li><a href="newsAdd.jsp" target="menuFrame"><i
							class="glyph-icon icon-chevron-right"></i>新闻发布</a></li>
					<li><a href="newsFindTwo.action" target="menuFrame"><i
							class="glyph-icon icon-chevron-right"></i>新闻删除</a></li>
				</ul></li>
			<li class="childUlLi"><a href="role.html" target="menuFrame">
					<i class="glyph-icon icon-reorder"></i>课程信息管理
			</a>
				<ul>
					<li><a href="adminCourseAdd.jsp" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>创建课程</a></li>
				</ul></li>
			<li class="childUlLi"><a href="role.html" target="menuFrame">
					<i class="glyph-icon icon-reorder"></i>宿舍信息管理
			</a>
				<ul>
					<li><a href="adminHostelAdd.jsp" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>宿舍的创建</a></li>
					<li><a href="findHotel.action" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>宿舍的管理</a></li>
				</ul></li>
			<li class="childUlLi"><a href="#" target="menuFrame">
					<i class="glyphicon glyphicon-edit"></i>论坛管理
			</a>
				<ul>
					<li><a href="adminManageForum.jsp" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>班级论坛管理</a></li>
				</ul></li>
		</ul>
	</div>
	<!--菜单-->
	<div id="layout_right_content" class="layout_right_content">

		<div class="route_bg">
			<a href="#">主页</a><i class="glyph-icon icon-chevron-right"></i> <a
				href="#">菜单管理</a>
		</div>
		<div class="mian_content">
			<div id="page_content">
				<iframe id="menuFrame" name="menuFrame" src=""
					style="overflow: visible;" scrolling="yes" frameborder="no"
					width="100%" height="100%"></iframe>
			</div>
		</div>
	</div>
	<div class="layout_footer"></div>
	<style>
.copyrights {
	text-indent: -9999px;
	height: 0;
	line-height: 0;
	font-size: 0;
	overflow: hidden;
}
</style>

</body>
</html>