<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

//아이디와 비밀번호 받아오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");

//dao
MemberDao dao=new MemberDao();

//아이디,비밀번호 일치 검사
boolean check=dao.checkLogin(id, pass);

//일치한다면
if(check){
	//session 설정
	session.setAttribute("myid", id);
	session.setAttribute("loginok", "yes");
	//로그인 성공 시 바로 메인화면으로 이동
	response.sendRedirect("../login/_mainTest.jsp");
}else{
	
}

%>