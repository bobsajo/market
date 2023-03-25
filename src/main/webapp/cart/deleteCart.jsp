<%@page import="data.dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
//cart_num 받아오기
String cart_num=request.getParameter("cart_num");

//cartDao
CartDao dao=new CartDao();

//delete(해당 num의 카트 삭제)
dao.deleteCart(cart_num);

%>