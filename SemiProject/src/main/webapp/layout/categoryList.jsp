<%@page import="java.util.List"%>
<%@page import="data.dao.ItemDao"%>
<%@page import="data.dto.ItemDto"%>
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
	<div class = "container">
		<ul class="">
    	<li class=""><a>전체보기</a></li>
    	<li><a href="categoryList.jsp?category=fruit" id="fruit">과일</a></li>
    	<li><a href="categoryList.jsp?category=bakery" id="bakery">빵</a></li>
    	<li><a href="categoryList.jsp?category=seafood" id="seafood">해산물</a></li>
    	<li><a href="categoryList.jsp?category=meat" id="meat">육류</a></li>
    <div class = "tab-content">
     	<div id = "tabs-1" class = "tab-pane fade in active">
		<p>
			<table class = "table table-bordered" style="width: 200px; ">
			<caption><b>전체상품목록</b></caption>
				<tr>
					<%
					
					String category=request.getParameter("category");
					
					NumberFormat nf=NumberFormat.getCurrencyInstance();
					ItemDao dao = new ItemDao();
					List<ItemDto> list = dao.getAllCategory(category);
					int i=0;
					
					for(ItemDto dto:list)
					{
						String item_img = dto.getItem_img();
						
						%>
	                	<td>
	                      <a item_num="<%=dto.getItem_num()%>" style="cursor: pointer;" 
	                      class="godetail"><img src="../itemImg/<%=dto.getItem_img()%>" class="photo" style="width: 300px;">
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
     	</p>
     	</div>
    </div>	
    	
  </ul>
	</div>
</body>
</html>