<%@page import="data.dao.ItemDao"%>
<%@page import="data.dto.ItemDto"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.CartDto"%>
<%@page import="data.dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
//값 받아오기
String cart_num=request.getParameter("cart_num");
int cart_cnt=Integer.parseInt(request.getParameter("cart_cnt"));

//Cart dao
CartDao dao=new CartDao();

//카트 수량 변경
dao.updateCartCnt(cart_num, cart_cnt);


%>