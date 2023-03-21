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
	<div class = "container">
		<div class = "tab-content">
			<div id = "tabs-1" class = "tab-pane fade in active">
			<p>
				<table class = "tb1">
					<caption><b>베스트 상품 목록</b></caption>
					<tr>
						<tr>
					<%
					
					String category=request.getParameter("category");
					
					NumberFormat nf=NumberFormat.getCurrencyInstance();
					ItemDao dao = new ItemDao();
					List<ItemDto> list = dao.getAllBest();
					
					int i=0;
					
					for(ItemDto dto:list)
					{
						String item_img = dto.getItem_img();
						
						%>
	                	<td>
	                	<div style="margin:0px 30px 30px 0px; height: 500px;">
	                      <a href ="index.jsp?main=detail/detailView.jsp?item_num=<%=dto.getItem_num() %>" style="cursor: pointer;" class="godetail">
	                      <img src="itemImg/<%=dto.getItem_img()%>" class="photo" style="width: 300px;">
	                      <br>
	                    
	                        <div style="color: black; font-size: 16px; text-align: left;">
	                        
	                          <%=dto.getItem_name() %><br>
	                          <%=nf.format(dto.getItem_price()) %>
	                        </div>
	                      </a> 
	                      </div>
	                   </td>  
	                   <!-- <td>
	                   	<div style="width:30px;">
	                   	</div> -->
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
	</div>
</body>
</html>