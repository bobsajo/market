<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

//email받기
String email=request.getParameter("email");

//dao
MemberDao dao=new MemberDao();

//email 중복체크
int emailok=dao.checkId(email);

//json
JSONObject ob=new JSONObject();
ob.put("emailok", emailok);

%>

<%=ob.toString() %>