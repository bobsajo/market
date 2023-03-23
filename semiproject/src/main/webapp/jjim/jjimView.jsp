<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
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
String item_num = request.getParameter("member_num");
itemDao dao = new itemDao();
itemDto dto = dao.getItemData(item_num);
NumberFormat nf = NumberFormat.getInstance(Locale.KOREA);
%>
<body>




	<div id="jjim-main">
		<h4 class="jtitle">찜한 상품</h4>
		<hr class="jbold">
		<br>


		<div class="jjim-view">
			<div class="jjim-img">
				<img src="../save-info-img/<%=dto.getItem_img()%>"
					style="width: 150px;">
			</div>
			<div class="jitem">
				<strong class="jname"><%=dto.getItem_name()%></strong> <br> 
				<strong class="jprice"><%=nf.format(dto.getItem_price())%>원</strong> <br>

				<strong class="junit"><%=dto.getItem_sell_unit()%></strong> <br>
				<strong class="jorigin"><%=dto.getItem_origin()%></strong> <br>

			</div>
			<span class="jbtn">
				<button class="jdel" type="button">삭제</button> <br>

				<button class="jcart">장바구니 담기</button>
			</span>

		</div>
		<br>
		<hr class="jhr">


	</div>
</body>
</html>