<%@page import="cn.edu.ujn.wq.dao.Forumt"%>
<%@page import="cn.edu.ujn.wq.dao.Forum"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>论坛界面</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
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
	height: 40px;
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
	height: 50px;
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
   height:500px;
	clear: both;
	border: 1px solid #efefef;
	border-top: none;
}

.tab {
	padding: 30px;
}

.dvques {
	height: 155px;
	border-bottom: 1px dashed #cdcdcd;
	margin-bottom: 23px;
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

<%
List<Forum> forums=(List<Forum>)session.getAttribute("findOneClassForums");
List<Forum> findOneStuAllForum=(List<Forum>)session.getAttribute("findOneStuAllForum");
List<Forumt> findOneStuAllForumt=(List<Forumt>)session.getAttribute("findOneStuAllForumt");
%>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
				发布帖子
				</h4>
			</div>
			<div class="modal-body">
			
		   <form action="<%=request.getContextPath()%>/formAdd.action">
				<center>
					<table style="margin: auto">
						<tr>
							<td>标题：</td>
							<td><input type="text" class="form-control" id="forum_name"
								name="forum_name"  placeholder="请输入标题">
							</td>

						</tr>
						<tr>
							<td>用户：</td>
							<td><input type="text" class="form-control"
								name="forum_number" id="forum_number"
								placeholder="请输入用户名"></td>

						</tr>
						<tr>
							<td>内容：</td>
							<td> <textarea class="form-control" rows="5" name="forum_text"></textarea></textarea></td>

						</tr>
					</table>
			</fieldset>
	</div>
	</table>
	</center>	
				
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="submit" class="btn btn-primary" >
					提交
				</button>
			</div>
			</div>
			
		</div><!-- /.modal-content -->
		</form>
	</div><!-- /.modal -->
	
<!-- 帖子展示区域 -->
<div class="dvContent">
	<div class="dvquesleft">

		<div class="dvqstitle">
		
			<span class="back"><a  href="stuMain.jsp">《《返回上一页</a></span>
		</div>
		<div class="dvtabhead">
			<div class="tabheads tabcurrent">全部帖子</div>
		</div>
		<div class="tabContent">
		
			<div class="tab ">
	<form action="<%=request.getContextPath()%>/findOneForums.action" id="form1">
			<%
for(int i=forums.size()-1;i>=0;i--)
{
%>
				<div class="dvques">
					<div class="quesCount">
					<img src="<%=request.getContextPath()%>/img/头像1.png">
					</div>
					<div class="quesContent">
						<div class="quesTitle">
						<a onclick="setValue(<%=forums.get(i).getId()%>)">
						<span
								class="spanques"><%=forums.get(i).getForum_name() %></span>
						</a>
						</div>
						<div class="qContent"><%=forums.get(i).getForum_text()%></div>
						<div class="tags">
						</div>
						<div class="quesUser">
							<div class="userName">
								<%=forums.get(i).getForum_number()%>
								<div class="liulan"><%=forums.get(i).getForum_date() %></div>
							</div>
						</div>
					</div>
				</div>
	<%}; %>
			<input type="hidden" name="ID" id="test" />
</form>	
						</div>

<!-- 我的发帖-->
			<div class="tab hidden">
					3
			</div>
<!-- 我的留言 -->
			<div class="tab hidden">
			2
			</div>
		</div>
	</div>
	
	<div class="dvquesright">
		<div>
			
			
			   <form action="<%=request.getContextPath()%>/formAdd.action">
				<center>
					<table style="margin: auto">
						<tr>
							<td>标题：</td>
							<td><input type="text" class="form-control" id="forum_name"
								name="forum_name"  placeholder="请输入标题">
							</td>

						</tr>
						<tr>
							<td>内容：</td>
							<td> <textarea class="form-control" rows="5" name="forum_text"></textarea></textarea></td>

						</tr>
					</table>
			</fieldset>
	</div>
	</table>
	</center>	
				
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary" >发布帖子</button>
			</div>
			</div>
			
		</div><!-- /.modal-content -->
		</form>
			
		</div>
		</div>

	</div>

</div>
<script type="text/javascript" src=" js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	$(function()
	{

		$(".tabheads").click(function()
		{
			
			$(".tabheads").removeClass("tabcurrent").eq($(this).index()).addClass("tabcurrent");
			$(".tab").hide().eq($(this).index()).show();
		});
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
	url:"findOneForums.action",
	data:{ID:newsID},
	dataType:"json",
	}		
	)
	}
function setValue(value){
　　newsID=document.getElementById("test").value=value;
      //requestParm();
     $('#form1').submit();
}
</script>
</body>
</html>