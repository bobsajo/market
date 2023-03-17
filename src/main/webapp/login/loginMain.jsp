<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>loginMain</title>
</head>
<body>

<!-- 로그인/로그아웃 상태 관리  -->
<%
//로그인 상태 확인
String loginok=(String)session.getAttribute("loginok");

//만약 로그인 상태라면
if(loginok!=null){
	//이미 로그인한 상태라면 메인페이지로
}else{
	//loginForm을 include%>
	<jsp:include page="loginForm.jsp"></jsp:include>
<%	
}

%>

</body>
</html>