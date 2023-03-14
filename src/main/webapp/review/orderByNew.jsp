<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="dto.ReviewDto" %>
<%@ page import="dao.ReviewDao" %>
<%@ page import="org.json.simple.JSONObject" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");

    ReviewDao db=new ReviewDao();

    String item_num=request.getParameter("item_num");
    int start=Integer.parseInt(request.getParameter("start"));
    int perPage=Integer.parseInt(request.getParameter("perPage"));

    System.out.println(item_num+" "+start+" "+perPage);

    List<ReviewDto> list=db.getListNew(item_num,start,perPage);

    JSONObject obj=new JSONObject();
    obj.put("list",list);
%>
<%=obj.toString()%>

    