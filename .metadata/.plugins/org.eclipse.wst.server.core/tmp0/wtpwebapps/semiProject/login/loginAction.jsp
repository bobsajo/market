<%@page import="data.dao.MemberDao"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<script>
<%

//아이디와 비밀번호 받아오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String item_num=request.getParameter("item_num");
System.out.println(item_num);

//dao
MemberDao dao=new MemberDao();

//아이디,비밀번호 일치 검사
boolean check=dao.checkLogin(id, pass);

//일치한다면
if(check){
	//session 설정
	session.setAttribute("myid", id);
	session.setAttribute("loginok", "yes");

	//만약 상품을 보고 있던 게 아니라면(즉, 메인 페이지에서 로그인 했을 때) 메인페이지로 이동
	if(item_num.equals("null")) { 
		response.sendRedirect("../index.jsp?");
	} else {
		//상품을 보고 있었다면(즉,item_num이 있다면 상품 페이지로 다시 돌아가도록)
		response.sendRedirect("../index.jsp?main=detail/detailView.jsp?item_num="+item_num);
	}
	
}else{%>
	alert("회원정보가 일치하지 않습니다.");
	location.href='../index.jsp?main=login/loginForm.jsp';
	<%
	//response.sendRedirect("../index.jsp?main=login/loginForm.jsp");
}

%>
</script>