<%@page import="cn.edu.ujn.wq.dao.ClassIntroduction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>班级介绍的界面</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<link href="<%=request.getContextPath()%>/css/bxslider.css"  rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/style1.css"  rel="stylesheet">
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bxslider.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/common2.js"></script>
	<style type="text/css">
	.about_box{background:url(../images/title_line.jpg) left 30px no-repeat; margin:30px 0px 0px 0px;}
.about_h1{ float: left; font-size: 22px; font-family: 'Microsoft YaHei'; color: rgb(67, 67, 67); margin:0px;}
.about_span{float: left; padding-top: 10px;  text-indent: 12px; font-size: 12px; font-family: Arial, Helvetica, sans-serif; color: rgb(125, 125, 125);}
.about_box section{clear: both; padding: 10px 0px 0px 0px;}
.about_box section img{margin: 10px 25px 0px 0px; max-width: 350px;}
a.about_more{color:#1260aa; display:inline-block; font-size: 12px; padding: 3px 6px;  border:1px solid #1260aa;border-radius:4px;font-family: 'Microsoft YaHei';}
a.about_more:hover{color: #fff; background-color: #1260aa; text-decoration: none;}
.about_contents{color:#898989; line-height:31px; padding:8px 0px 10px 0px;font-family: 'Microsoft YaHei';}
	</style>
	<%
	ClassIntroduction classIntroduction=(ClassIntroduction)session.getAttribute("findClassIntroduction");
	%>
</head>
<body>
   <!-- main -->
    <div class="container">    
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="about_box">
                    <h1 class="about_h1">班级介绍</h1><span class="about_span">ABOUT</span>
                    <section>
                        <img align="left" src="<%=request.getContextPath()%>/img/bk3.jpg">
                        <p class="about_contents">
                        <%=classIntroduction.getIntroduction() %>
	</p>                       
                    <section>
                </div>
            </div>
        </div>
    </div> 
</body>
</html>