<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

//회원정보 받아오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String email=request.getParameter("email");
String hp=request.getParameter("hp");
String addr=request.getParameter("addr1")+request.getParameter("addr2");
String birth=request.getParameter("year")+"/"+request.getParameter("month")+"/"+request.getParameter("day");

//dto
MemberDto dto=new MemberDto();

dto.setMember_id(id);
dto.setMember_pass(pass);
dto.setMember_name(name);
dto.setMember_email(email);
dto.setMember_hp(hp);
dto.setMember_addr(addr);
dto.setMember_birth(birth);

//dao
MemberDao dao=new MemberDao();

//insert
dao.insertMember(dto);

%>