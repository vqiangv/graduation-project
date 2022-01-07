<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>班主任管理一个班级的界面</title>
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

<style type="text/css">

</style>

</head>
<body>
	<!--顶部-->
	<div class="layout_top_header">
		<div style="float: left">
			<span
				style="font-size: 16px; line-height: 45px; padding-left: 20px; color: #8d8d8d">
				</h1>
			</span>
		</div>
		<div id="ad_setting" class="ad_setting">
			<a class="ad_setting_a" href="javascript:; "> <input type="button" class="btn btn-primary" value="返回"
			onclick="javascript:history.go(-1);" />
				
			</a>
		</div>
	</div>
	<!--顶部结束-->
	<!--菜单-->
	<div class="layout_left_menu">
		<ul id="menu">
			<li class="childUlLi"><a href="findClassIntroduction.action" target="menuFrame"><i
					class="glyph-icon icon-home"></i>班级介绍</a>
			</li>
			<li class="childUlLi"><a href="findOneClassNameStu.jsp" target="menuFrame">
					<i class="glyphicon glyphicon-user"></i>班级成员
			</a>
			</li>
					<li class="childUlLi"><a href="#"> <i
					class="glyph-icon  icon-location-arrow"></i>新闻管理
			</a>
				<ul>
					<li><a href="boosClassNewsAdd.jsp" target="menuFrame"><i
							class="glyph-icon icon-chevron-right"></i>班级新闻的发布</a></li>
					<li><a href="classNewsFind.action" target="menuFrame"><i
							class="glyph-icon icon-chevron-right"></i>班级新闻的管理</a></li>
					<li><a href="boosHotelNewsAdd.jsp" target="menuFrame"><i
							class="glyph-icon icon-chevron-right"></i>宿舍新闻的发布</a></li>
					<li><a href="hotelNewsFind.action" target="menuFrame"><i
							class="glyph-icon icon-chevron-right"></i>宿舍新闻的管理</a></li>
				</ul></li>
		<li class="childUlLi"><a href="role.html" target="menuFrame">
					<i class="glyph-icon icon-reorder"></i>班级公告
			</a>
			<ul>
					<li><a href="bossNoticeAdd.jsp" target="menuFrame"><i
							class="glyph-icon icon-chevron-right"></i>班级公告的发布</a></li>
					<li><a href="classNoticesFind.action" target="menuFrame"><i
							class="glyph-icon icon-chevron-right"></i>班级公告的管理</a></li>
				</ul>
				</li>
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
				<iframe id="menuFrame" name="menuFrame" src=" "
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