<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="data.dao.ReviewDao" %>
<%@ page import="org.json.simple.JSONObject" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");

    String member_num=request.getParameter("member_num");
    String item_num=request.getParameter("item_num");
//    String review_num=request.getParameter("review_num");

    ReviewDao dao=new ReviewDao();
//    boolean has=dao.hasReviewLike(member_num,item_num,review_num);

    JSONObject obj=new JSONObject();
//    obj.put("has",has);
%>
<%=obj.toString()%>

