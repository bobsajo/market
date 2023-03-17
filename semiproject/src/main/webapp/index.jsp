<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=East+Sea+Dokdo&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
div.layout{
	border: 0px solid gray;
	position: absolute;
	
}



div.title{
	 width: 100%;
	 height: 180px;


 
}

div.menu{

	width: 100%;
	height: 70px;
	font-size: 18px;
	top: 120px;
	 display: flex;
  justify-content: center;
	padding-top: 0px;
	margin-left: 60px;
	
}




</style>
</head>
<%
	String mainPage="layout/main.jsp";
    //url을 통해서 main값을 읽어서 메인페이지에 출력을한다
    if(request.getParameter("main")!=null)
    {
    	mainPage=request.getParameter("main");
    }
 String root=request.getContextPath();
%>
<body>


 

<div class="layout title">
  <jsp:include page="layout/title2.jsp"/>
</div>

<div class="layout menu">
  <jsp:include page="layout/menu.jsp"/>
</div>



 
 
</body>
</html>