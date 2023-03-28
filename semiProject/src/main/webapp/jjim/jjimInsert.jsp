<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="data.dao.JjimDao" %>
<%@ page import="data.dto.JjimDto" %>
<%@ page import="data.dao.MemberDao" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    String myid=(String)session.getAttribute("myid");
    MemberDao mdao=new MemberDao();

    String member_num=mdao.getMemberNum(myid);
    String item_num=request.getParameter("item_num");
    System.out.println(member_num+" "+item_num);

    JjimDao dao=new JjimDao();
    JjimDto dto=new JjimDto();

    dto.setItem_num(item_num);
    dto.setMember_num(member_num);

    dao.insertJjim(member_num,item_num);

    response.sendRedirect("../index.jsp?main=detail/detailView.jsp?item_num="+item_num);
%>

<%--    response.sendRedirect("../index.jsp?main=detail/detailView.jsp?item_num="+item_num);--%>