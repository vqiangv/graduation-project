<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>班级相册的展示界面</title>
</head>
<%
String url=(String) session.getAttribute("findImageByNumber");
%>
<body>
<div class="container px-0">
  <div class="pp-gallery">
    <div class="card-columns">

      <div class="card" data-groups="[&quot;nature&quot;]"><a href="image-detail.html">
          <figure class="pp-effect"><img class="img-fluid" src="images/1-nature.jpg" alt="Nature"/>
            <figcaption>
              <div class="h4">Forest</div>
              <p>Nature</p>
            </figcaption>
          </figure></a></div>
      
    </div>
  </div>
</div>
</body>
</html>