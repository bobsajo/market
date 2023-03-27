<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.CartDto"%>
<%@page import="data.dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

String id=(String)session.getAttribute("myid");
MemberDao mdao=new MemberDao();

String member_num=mdao.getMemberNum(id);
String item_num=request.getParameter("item_num");
int cart_cnt=Integer.parseInt(request.getParameter("cart_cnt"));

CartDao dao=new CartDao();

CartDto dto=new CartDto();
dto.setMember_num(member_num);
dto.setItem_num(item_num);
dto.setCart_cnt(cart_cnt);

dao.insertCart(dto);

%>