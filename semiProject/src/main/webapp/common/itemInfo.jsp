<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="data.dto.ItemDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ItemDao"%>
<%
	String item_num = request.getParameter("item_num");
	ItemDao dao = new ItemDao();
	ItemDto dto = dao.getItemData(item_num);
	
	JSONObject ob = new JSONObject();
	ob.put("item_num", dto.getItem_num());
	ob.put("item_name", dto.getItem_name());
	ob.put("item_price", dto.getItem_price());
	
%>
<%=ob.toString()%>