<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="data.dao.MemberDao" %>
<%@ page import="data.dao.JjimDao" %>
<%@ page import="org.json.simple.JSONObject" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");

    String myid=(String)session.getAttribute("myid");
    MemberDao mdao=new MemberDao();
    String member_num=mdao.getMemberNum(myid);
    String item_num=request.getParameter("item_num");

    JjimDao dao=new JjimDao();
    boolean has=dao.hasJjim(member_num,item_num);

    JSONObject obj=new JSONObject();
    obj.put("has",has);
%>
<%=obj.toString()%>