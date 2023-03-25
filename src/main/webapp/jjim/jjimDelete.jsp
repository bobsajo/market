<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="data.dao.JjimDao" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");

    String jjim_num=request.getParameter("jjim_num");
    String member_num=request.getParameter("member_num");
    JjimDao dao=new JjimDao();

    dao.deleteJjim(jjim_num);

    response.sendRedirect("../index.jsp?main=jjim/jjimList.jsp?member_num="+member_num);
%>

    