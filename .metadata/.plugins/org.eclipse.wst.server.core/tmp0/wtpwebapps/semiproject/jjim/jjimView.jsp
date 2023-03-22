<%@page import="data.Dao.itemDao"%>
<%@page import="data.Dto.itemDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/jjim.css">

<link
	href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>


</head>
<%
String item_num = request.getParameter("item_num");
itemDao dao = new itemDao();
itemDto dto = dao.getItemData(item_num);
%>
<body>




	<div id="jjim-main">
		<h4 class="jtitle">찜한 상품</h4>
		<hr>
		<br>



		<div class="jjim-img">
			<img src="../save-info-img/<%=dto.getItem_img()%>"
				style="width: 150px;">
		</div>
		<div class="jitem">
			<strong class="jname"><%=dto.getItem_name()%></strong> <br> 
			<strong class="jprice"><%=dto.getItem_price()%>원</strong>
		</div>
		<div class="jbtn">
			<button class="jdel" type="button">삭제</button>
			<br>

			<button class="jcart">
				담기 <img alt="" src="/image/cartlogo.png" style="width: 20px;">
			</button>
		</div>
	</div>
</body>
</html>