<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.CartDao"%>
<%@page import="data.dto.CartDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>cart</title>

<%

//로그인 상태확인
String loginok=(String)session.getAttribute("loginok");

String myid="";
CartDto cdto=new CartDto();
CartDao cdao=new CartDao();
//로그인 상태라면 아이디 가져오기
if(loginok!=null){
	myid=(String)session.getAttribute("myid");
	
	//사용자 member_dto 가져오기
	MemberDao mdao=new MemberDao();
	MemberDto mdto=mdao.getMemberById(myid);
	System.out.print(mdto.getMember_name()+"님의 메일은 "+mdto.getMember_email()+"입니다.");
}

%>

<script>

function cartList(){
	
}

</script>

</head>
<body>
	
</body>
</html>