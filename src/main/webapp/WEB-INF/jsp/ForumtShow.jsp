<%@page import="java.util.List"%>
<%@page import="cn.edu.ujn.wq.dao.Forum"%>
<%@page import="cn.edu.ujn.wq.dao.Forumt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>帖子留言展示区域</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
	@CHARSET "UTF-8";
.dvContent {
	width: 1200px;
	margin: 0px auto;
	margin-top: 30px;
}

.dvquesleft {
	float: left;
	width: 800px;
}

.dvqstitle {
	height: 20px;
	line-height: 30px;
	margin-left: 40px;
	font-weight: bold;
}

.imgbean {
	float: left;
}

.qsTitle {
	float: left;
	margin-left: 15px;
}

.back {
	float: right;
	color: #4D47A0;
	font-size: 12px;
	margin-right: 20px;
}

.dvtabhead {
	height: 20px;
	line-height: 40px;
	padding: 10px 0px 0px 30px;
	border: 1px solid #efefef;
	font-size: 13px;
}

.dvtags {
	height: 40px;
	line-height: 65px;
	margin-left: 50px;
	font-size: 14px;
}

.line {
	width: 1px;
	height: 40px;
	border: 1px dashed #cdcdcd;
	border: 1px dashed #cdcdcd;
}

.hidden {
	display: none;
}

.dvtags a {
	margin: 0px 15px 0px 15px;
}

.curenttag {
	font-weight: bold;
}

.tabheads {
	float: left;
	padding: 0px 20px 0px 20px;
	text-align: center;
	color: white;
	cursor: pointer;
	font-size: 14px;
	color: black;
}

.tabcurrent {
	background-color: white;
	z-index: 3;
	color: black;
	font-weight: bold;
	border-top: 1px solid #efefef;
	border-left: 1px solid #efefef;
	border-right: 1px solid #efefef;
}

.tabContent {
   overflow-y:scroll;
   height:300px;
	clear: both;
	border: 1px solid #efefef;
	border-top: none;
}

.tab {
	padding: 30px;
}

.dvques {
	height: 90px;
	border-bottom: 1px dashed #cdcdcd;
	margin-bottom: 23px;
}
.dvques1{
	height: 155px;
	border-bottom: 1px dashed #cdcdcd;
	margin-bottom: 23px;
	margin-left: 50px;
	margin-top: 10px;
}

.dvques1 img
{
width:60px;
height:60px;
}

.quesCount {
	width: 60px;
	height: 60px;
	border: 1px solid #cdcdcd;
	text-align: center;
	float: left;
}
.quesCount img {
	width: 60px;
	height: 60px;
}
.count {
	height: 35px;
	line-height: 35px;
	background-color: #efefef;
	font-weight: bold;
	color: #f60;
	font-size: 26px;
}

.ques {
	line-height: 25px;
	color: #cdcdcd;
	font-size: 13px;
}

.quesContent {
	float: left;
	margin-left: 20px;
	width: 630px;
}

.bean {
	margin-left: 5px;
	width: 15px;
	height: 15px;
	line-height: 30px;
	width: 15px;
}

.spanques {
	margin-left: 40px;
	font-weight: bold;
	color: #4D47A0;
}

.qContent {
	margin-top: 10px;
	float: left;
	line-height: 20px;
	font-size: 13px;
}

.tags {
	float: left;
	margin-top: 20px;
}

.tags .tag {
	padding: 6px 5px 6px 5px;
	margin-right: 10px;
	background-color: #efefef;
	font-size: 13px;
}

.quesUser {
	float: right;
	margin-right: 40px;
}

.imguser {
	width: 55px;
	height: 55px;
	float: left;
}

.userName {
	float: left;
	margin-left: 10px;
	margin-top: 10px;
	font-size: 15px;
	color: #4D47A0;
	font-weight: bold;
}

.liulan {
	font-weight: normal;
	margin-top: 10px;
	color: #cdcdcd;
	margin-top: 10px;
}

.dvquesright {
	float: left;
	margin-left: 50px;
	padding-top: 30px;
}

.btnques {
	background-color: #3A71D0;
	padding: 10px 10px 10px 10px;
	font-size: 13px;
	color: white;
	cursor: pointer;
	transition: all 2s;
}
.btnques:hover {
	background-color: #6FD8A1;
}

.dvorder {
	width: 250px;
	margin-top: 30px;
	height: 620px;
	border: 1px solid #efefef;
}

.orderTitle {
	height: 40px;
	line-height: 40px;
	background-color: #efefef;
	text-indent: 30px;
	font-size: 13px;
	font-weight: bold;
}

.users {
	height: 60px;
	margin-top: 20px;
}

.userface {
	float: left;
	margin-left: 30px;
	width: 57px;
	height: 57px;
	float: left;
}

.dvuser {
	float: left;
	margin-left: 10px;
}

.userTitle {
	color: #4D47A0;
	font-weight: bold;
	font-size: 13px;
	margin-top: 5px;
}

.userdeital {
	margin-top: 15px;
	font-size: 12px;
	color: #cdcdcd;
}
	</style>
</head>
<body>
<%Forum forum=(Forum)session.getAttribute("findOneForums"); 
List<Forumt> Forums=(List<Forumt>)session.getAttribute("findOneAllHuiForums");
%>
<div class="dvqstitle">
			<span class="back"><a  href="shiyan.jsp">《《返回上一页</a></span>
		</div>
<!-- 主帖子的展示区域 -->
<div class="dvques1">
					<div class="quesCount">
					<img src="<%=request.getContextPath()%>/img/头像1.png">
					</div>
					<div class="quesContent">
						<div class="quesTitle">
						<span
								class="spanques"><%=forum.getForum_name()%></span>
						</div>
						<div class="qContent"><%=forum.getForum_text()%></div>
						<div class="tags">
						</div>
						<div class="quesUser">
							<div class="userName">
							<%=forum.getForum_number()%>
								<div class="liulan"><%=forum.getForum_date() %></div>
							</div>
						</div>
					</div>
				</div>
				
<!-- 留言的展示区域-->
<div class="dvContent">
	<div class="dvquesleft">

		<div class="dvtabhead">
			<div class="tabheads tabcurrent">全部留言</div>
		</div>
		<div class="tabContent">
		
			<div class="tab">
<%
for(int i=Forums.size()-1;i>=0;i--)
{
%>
				<div class="dvques">
					<div class="quesCount">
					<img src="<%=request.getContextPath()%>/img/头像1.png">
					</div>
					<div class="quesContent">
						<div class="qContent"><%=Forums.get(i).getForumt_text()%></div>
						<div class="tags">
						</div>
						<div class="quesUser">
							<div class="userName">
							<%=Forums.get(i).getForumt_number()%>
								<div class="liulan"><%=Forums.get(i).getForumt_date()%></div>
							</div>
						</div>
					</div>
				</div>
	<%}; %>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--发布留言区域  -->
	<div class="dvquesright">
	<form action="<%=request.getContextPath()%>/LiuYanAdd.action"  method="get" id="form1">
      <table>
						<tr>
							<td>内容：</td>
							<td> <textarea class="form-control" rows="5" name="forumt_text"></textarea></textarea></td>
						</tr>
						<tr>
						<td></td>
						<td><button type="submit" class="btn btn-primary" >发布留言</button></td>
						</tr>
</table>
</form>
		
	</div>
</div>

</script>
</body>
</html>