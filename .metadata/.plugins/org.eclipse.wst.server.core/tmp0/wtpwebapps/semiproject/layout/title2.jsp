<%@page import="data.Dao.MemberDao"%>
<%@page import="data.Dao.itemDao"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
div.cart {
	float: right;
	cursor: pointer;
	margin-top: 5px;
}

div.count {
	color: white;
	width: 15px;
	height: 15px;
	float: right;
	border-radius: 100px;
	line-height: 15px;
	text-align: center;
	background-color: #4B62D3;
	font-weight: bold;
	z-index: 10;
	position: relative;
	left: -10px;
	top: 10px;
	font-size: 0.7em;
	margin-top: 3px;
}

div.heart {
	float: right;
	cursor: pointer;
	margin-right: -200px;
	margin-top: 3px;
}

div.search-wrap {
	
}
</style>

</head>
<%
 //프로젝트 경로구하기
 String root=request.getContextPath();
%>
<body>
	<div class="search-wrap">
		<a class="logo" onclick="#"> <img alt="" src="image/uselogo.png"
			style="width: 200px; margin: 0 auto; margin-top: 60px; text-align: center; float: left; margin-left: 20%; cursor: pointer;"></a>
	</div>


	<form action="../search/searchItem.jsp" method="post" name="search">
		<div class="search" >
			<input type="text" placeholder="검색어 입력" name="searchText"
			style= "width: 600px; float: left; position: relative; border: 1.5px solid; border-radius: 8px; font-size: 15px; margin-left: 30px; height: 50px; margin-top: 60px; padding-left: 20px;">
			<button type="submit" style="border: 0px; background-color: white;">
				<img src="image/searchicon.png"
					style="position: absolute; width: 20px; margin-top: 60px; left: 61%;">
			</button>
		</div>
	</form>


	<div style="margin-right: 25%; margin-top: 50px; color: black;">
		<div style="float: right; top: 50px;">

			<%
     //로그인세션얻기
     String loginok=(String)session.getAttribute("loginok");
     //아이디얻기
     String myid=(String)session.getAttribute("myid");
     MemberDao dao=new MemberDao();
     String name=dao.getName(myid);
     
     if(loginok==null){%>

			<button type="button" class="btn btn-primary btn-link"
				style="width: 30px; color: black;"
				onclick="location.href='index.jsp?main=login/loginmain.jsp'">로그인</button>
			<%}else{%>

			<b style="font-size: 12pt;"><%=name %>님 로그인중...</b>
			<!-- 로그아웃 잘못되면 수정할 곳 -->
			<button type="button" class="btn btn-primary btn-link"
				style="width: 30px; color: black;"
				onclick="location.href='login/logoutaction.jsp?id=<%=myid%>'">로그아웃</button>
			<%}
   %>
			&nbsp;&nbsp;&nbsp;&nbsp;

			<button type="button" class="btn btn-primary btn-link" onclick="#"
				style="color: black;">회원가입</button>



			<img class="heart" alt="" src="image/heart.png" style="width: 20px;"
				onclick="#">


			<!-- 카트 -->
			<div class="cart">
				<%
     itemDao sdao=new itemDao();
    /*  int cartSize=sdao.getCartList(myid).size(); */
     %>

				&nbsp;&nbsp;&nbsp;&nbsp; <img alt="장바구니 " src="image/cartlogo.png"
					style="width: 20px;" onclick="#">
				<%--  <div class="count"><%=cartSize %></div> --%>

			</div>
		</div>



	</div>






</body>
</html>