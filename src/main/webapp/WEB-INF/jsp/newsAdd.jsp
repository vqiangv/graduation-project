<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻发布界面</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.form-control{	
	width: 400px;
}
.context
{
margin-top:5%;
margin-left: 5%;
}
</style>
</head>
<body>
<div class="context">
<form method="post">
	<center>
	<span>校内新闻的发布</span>
		<table style="margin: auto">
			<tr>
				<td>标题：</td>
				<td><input type="text" class="form-control" name="new_home"
					id="new_home" placeholder="请输入标题"></td>

			</tr>
			<tr>
				<td>作者：</td>
				<td><input type="text" class="form-control" name="new_author"
					id="new_author" placeholder="请输入作者"></td>

			</tr>

			<tr>
				<td>内容：</td>
				<td>
					
						<textarea class="form-control" rows="10" name="new_context" id="new_context"></textarea>
				</td>
			</tr>

			<tr>
				<td></td>
				<td><button type="submit" class="btn btn-primary" onclick="requestParm()">提&nbsp;交</button></td>
			</tr>
		</table>
		</fieldset>
		</div>
		</table>
	</center>
	</form>
	</div>
	<script type="text/javascript">
	//利用ajax传值
	function requestParm()
	{
		$.ajax(
		{
		type:"POST",
		url:"newsAdd.action",
		data:{new_home:document.getElementById("new_home").value,new_author:document.getElementById("new_author").value,new_context:document.getElementById("new_context").value,new_major:"all",new_class:"all",
			new_flag:"0"},
		dataType:"json",
		}		
		)
		}
	</script>
</body>
</html>