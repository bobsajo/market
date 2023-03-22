<%@page import="data.dto.CartDto"%>
<%@page import="data.dao.CartDao"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String id = (String)session.getAttribute("myid");

	CartDao cdao = new CartDao();
	
	MemberDao mdao = new MemberDao();
	
	String item_num = request.getParameter("item_num");
	
	String member_num = mdao.getMemberNum(id);
	
	String cart_num = cdao.cartSearchItem(member_num, item_num);
	
	int cart_cnt = Integer.parseInt(request.getParameter("cart_cnt"));
	
	if(cart_num.equals("")) //중복된 아이템이 없음
	{
		CartDto dto = new CartDto();
		dto.setCart_cnt(cart_cnt);
		dto.setItem_num(item_num);
		dto.setMember_num(member_num);
		cdao.insertCart(dto);
	}else
	{
		CartDto dto = cdao.getCart(cart_num);
		int total = dto.getCart_cnt() + cart_cnt;
		dto.setCart_cnt(total);
		dto.setCart_num(cart_num);
		cdao.cartPlus(dto);
		
	}

%>