<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="data.dao.JjimDao" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    
    String id=(String)session.getAttribute("myid");
    MemberDao mdao=new MemberDao();

    String item_num=request.getParameter("item_num");
    String member_num=mdao.getMemberNum(id);
    JjimDao dao=new JjimDao();
    //System.out.println("상품: "+item_num+",멤버: "+member_num);

    dao.deleteJjim(item_num,member_num);

    response.sendRedirect("../index.jsp?main=jjim/jjimList.jsp?member_num="+member_num);
%>
    