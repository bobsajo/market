<%@page import="data.dto.ItemDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ItemDao"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<table>
	<tr>
<%
					
					NumberFormat nf=NumberFormat.getCurrencyInstance();
					ItemDao dao = new ItemDao();
					List<ItemDto> list = dao.getAllCategory("fruit");
					int i=0;
					
					for(ItemDto dto:list)
					{
						String item_img = dto.getItem_img();
						
						System.out.println(dto.getItem_img());
						
						%>
	                	<td>
	                      <a item_num="<%=dto.getItem_num()%>" style="cursor: pointer;" 
	                      class="godetail"><img src="../itemImg/<%=dto.getItem_img() %> class="">
	                      <br>
	                      <%=dto.getItem_name() %>
	                      
	                      <span style="float: right;">
	                        
	                        <div style="color: black; font-size: 16px;">
	                          <%=nf.format(dto.getItem_price()) %>
	                        </div>
	                      </span>
	                      
	                      </a>
	                   </td>
	                   
	                   <%
	                   if((i+1)%4==0)
	                   {%>
	                	   </tr>
	                	   <tr>
	                   <%}
	                   i++;
	                            
					}
					
					%>	
	</tr>
</table>
</body>
</html>