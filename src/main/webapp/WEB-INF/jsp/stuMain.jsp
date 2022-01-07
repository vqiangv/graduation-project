<%@page import="cn.edu.ujn.wq.dao.News"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="X-UA-Compatible" content="IE=edge" />
<meta name="keywords" content="班级信息" />
<meta name="description" content="无" />
<title>学生首页</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
	<!-- bootstrap需要引入的外部文件 -->
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">

body
{
height:700px;
background-image: url("<%=request.getContextPath()%>/img/111.jpeg");
background-repeat:no-repeat; 
    background-size:100% 100%;
}

.newsShow {
	margin-left: 30%;
	margin-top: 10%;
	width: 400px;
	height: 400px;

}
.classGongGao
{
position:absolute;
width:300px;
height:200px;
margin-left: 10%;
margin-top: -29.5%;

}
.classNewsShow
{
position:relative;
width:300px;
height:200px;
margin-left: 65%;
margin-top: -30%;

}
.hotelNewsShow
{
position:relative;
width:300px;
height:200px;
margin-left: 65%;
margin-top: 0%;
}
.nav_list
{
margin-top: 30px;
}
p
{
text-indent:2em;
}
</style>
</head>
<%
List <News> classNewsFindList=(List <News>)session.getAttribute("user_classNewsFindList");
List <News> hotelNewsFindList=(List <News>)session.getAttribute("user_hotelNewsFindList");
List <News> gonggaoFindList=(List <News>)session.getAttribute("findClassGongGao");
%>
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
			<%-- <a href="stuMain.jsp" class="logo"><img
				src="<%=request.getContextPath()%>/img/图标/我的班级.png" /></a>  --%>
			<div class="nav_list">
				<ul id="nav" class="nav clearfix">
					<!-- <li class="nLi" style="display: none;"></li> -->
					<!-- <li class="nLi">
						<h3>
							<a href="about.html">班级信息</a>
						</h3>
						<ul class="sub">
							<li><a href="findAllClassPreson.action">所在班级</a></li>
							<li><a href="">班级相册</a></li>
							<li><a href="">班级公告</a></li>
						</ul>
					</li> -->
					<li class="nLi">
						<h3>
							<a href="findAllClassPreson.action">班级成员</a>
						</h3>
					</li>
					<li class="nLi">
						<h3>
							<a href="findPersonCourse.action">个人课表</a>
						</h3>
					</li>
					<li class="nLi">
						<h3>
							<a href="findAllHotelPreson.action">宿舍信息</a>
						</h3>
					</li>
					<li class="nLi">
						<h3>
							<a href="findOneClassForums.action">班级论坛</a>
						</h3>
						<ul class="sub">
						</ul>
					</li>

				</ul>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!--展示校内新闻 -->
	<div class="newsShow">
		<%@ include file="NewFile.jsp"%>
	</div>
	<!-- 展示班级新闻 -->
	<div class="classGongGao">
	<h4><span class="label label-primary" >班级公告</span></p></h4>
		<%
		for (int i = 0; i <gonggaoFindList.size()&&i<5; i++) {
		%>
		<!-- <table class="table" border="0px solid">
			<tr> -->
				<a href="newsShow.jsp" target="_blank"
					onclick="setValue(<%=gonggaoFindList.get(i).getNew_id()%>)"><%=gonggaoFindList.get(i).getNew_home()%></a></p>
		
		<%
		} ;
		%>
	</div>
	<div class="classNewsShow" >
	<h4><span class="label label-primary" >班级新闻</span></p></h4>
		<%
		for (int i = 0; i <classNewsFindList.size()&&i<5; i++) {
		%>
		<!-- <table class="table" border="0px solid">
			<tr> -->
				<a href="newsShow.jsp" target="_blank"
					onclick="setValue(<%=classNewsFindList.get(i).getNew_id()%>)"><%=classNewsFindList.get(i).getNew_home()%></a></p>
		
		<%
		} ;
		%>
	</div>
	
	<!-- 展示宿舍新闻 -->
	<div class="hotelNewsShow">
	<h4><span class="label label-primary">宿舍新闻</span></p></h4>
			<%
		for ( int j = 0;j<hotelNewsFindList.size()&&j<5; j++) {
		%>
		<a href="newsShow.jsp" target="_blank"
					onclick="setValue(<%=hotelNewsFindList.get(j).getNew_id()%>)"><%=hotelNewsFindList.get(j).getNew_home()%></a></p>
	
		<%
		} ;
		%>
	</div>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery-1.11.0.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery.SuperSlide.2.1.js"></script>
<%-- 	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/common.js"></script> --%>
	<script type="text/javascript">
		//banner滚动效果
		jQuery(".banner").slide({
			titCell : ".hd ul",
			mainCell : ".bd ul",
			effect : "fold",
			autoPlay : true,
			autoPage : true,
			trigger : "click"
		});
		//tab切换效果
		jQuery(".left_tab").slide();
		//news滚动效果
		jQuery(".notice").slide({
			mainCell : ".bd ul",
			autoPage : true,
			effect : "top",
			autoPlay : true,
			vis : 3
		});
	</script>
	<script type="text/javascript">
var newsID;
//利用ajax传值
function requestParm()
{
	$.ajax(
	{
	type:"POST",
	url:"actionid.action",
	data:{newsID:newsID},
	dataType:"json",
	}		
	)
	}
function setValue(value){
　　newsID=document.getElementById("test").value=value;
       requestParm();
}
</script>
		<input type="hidden" name="newsID" id="test" />
</body>
</html>