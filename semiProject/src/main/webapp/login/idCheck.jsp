<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

//id받기
String id=request.getParameter("id");

//dao
MemberDao dao=new MemberDao();

//아이디 중복체크
int idok=dao.checkId(id);

//json
JSONObject ob=new JSONObject();
ob.put("idok", idok);

%>

<%=ob.toString() %>