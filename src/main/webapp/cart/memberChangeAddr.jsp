<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

MemberDao mdao=new MemberDao();

String id=(String)session.getAttribute("myid");

String member_num=mdao.getMemberById(id).getMember_num();
String member_addr=request.getParameter("member_addr");

mdao.updateAddr(member_num, member_addr);

%>