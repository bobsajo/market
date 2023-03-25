<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="data.dao.MemberDao" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");

    String member_name=request.getParameter("searchIdName");
    String member_email=request.getParameter("searchIdEmail");
//    System.out.println(member_name);
//    System.out.println(member_email);

    MemberDao dao=new MemberDao();
    String member_id="";

    if(dao.searchId(member_name,member_email)!=null) {
         member_id= dao.searchId(member_name, member_email);
//        System.out.println(member_id);
    }

    response.sendRedirect("../index.jsp?main=login/searchIdGet.jsp?member_id="+member_id);
%>
    