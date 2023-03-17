<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
div.includewrap{
	width:100%;
	/* margin:0 auto; */
	
}

div.menu{
	z-index:100;
}

div.main{
	z-index:-1;
}


/* div.mainbanner{
/* 	text-align:center; 
	position:absolute;
	top:20%;
}*/


/* div.layout{
	border: 0px solid gray;
	position: absolute;
	display:inline-flex;
} */


</style>
</head>
<%
	String mainPage = "layout/main.jsp";

	if(request.getParameter("main")!=null)
	{
		mainPage = request.getParameter("main");
	}
	String root = request.getContextPath();
%>
<body>
<div class = "includewrap">

	<div class="layout title">
  	<jsp:include page="layout/title2.jsp"/>
	</div>

	<div class="layout menu">
  	<jsp:include page="layout/menu.jsp"/>
	</div> 

	<div class="layout main">
  	<jsp:include page = "layout/main.jsp"/>
	</div>

	<div class="layout footer">
    <jsp:include page = "layout/footer.jsp"/>
	</div>
	

</div>
</body>
</html>