<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.mysql.cj.xdevapi.JsonArray"%>
<%@page import="data.dto.ItemDto"%>
<%@page import="data.dao.ItemDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	Cookie[] cookies = request.getCookies();
	Cookie cookie;
	
	
	String result = "";
	
	if(cookies!=null)
	{
		for(int i =0; i<cookies.length; i++)
		{
			if(cookies[i].getName().equals("recent_item"))
			{
				if(!cookies[i].getValue().equals(""))
				{
					result = cookies[i].getValue();
				}
			}
		}
	}
	
	
	String[] resultArr = result.split("&");
	
	ItemDao dao = new ItemDao();
	
	JSONArray jArr = new JSONArray();
	
	
	
	for(String r : resultArr)
	{
		JSONObject ob = new JSONObject();
		ob.put("item_num", r);
		jArr.add(ob);
	}
%>

<%=jArr.toString()%>