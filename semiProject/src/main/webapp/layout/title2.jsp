<%@page import="data.dao.CartDao"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dao.ItemDao"%>

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
	.title2{
		width: 100%;
	}

	.title2_container{
		margin: 0 auto;
		width: 1200px;
	}

	.header-login{
		width: 100%;
		margin-right: 10px;
		text-align: right;
	}
	
	.search-wrap{
		width: 100%;
		display: flex;
		flex-wrap: nowrap;
		justify-content: space-between;
	}
	
	.search-wrap form{
		width: 70%;
	}
	
	.header-search{
		display: flex;
		flex-wrap: nowrap;
		width: 70%;
		margin-left: 13%;
	}
	
	.logo{
		width: 200px;
		min-width: 200px;
	}
	
	.logo>img{
		width: 100%;
	}
	
	.search{
		border: 2px solid #4B62D3;
		border-radius: 5px;
		display: flex;
		flex-wrap: nowrap;
		width: 80%;
		height: 80%;
		margin: 7px 0px 0px 20px;
	}
	
	.search input{
		width: 70%;
		border: 0px solid gray;
		padding-left: 10px;
		font-size: 10pt;
	}
	
	.search>input:focus {
		outline: none;
	}
	
	.icon-wrap{
      flex:none;
      flex-wrap: nowrap;
      width: 100px;
      margin-right: 1%;
   }

	
	.icon-wrap img{
		width: 30px;
		height: 30px;
	}
	
	.title2_inner{
		margin: 0 auto;
	}
</style>

</head>
<%
 //프로젝트 경로구하기
 String root=request.getContextPath();
%>
<body>
<div class="title2">
<div class="title2_container">
<div class="title2_inner">
	<div class="header-login">

	<%
     //로그인세션얻기
     String loginok=(String)session.getAttribute("loginok");
     //아이디얻기
     String myid=(String)session.getAttribute("myid");
     MemberDao dao=new MemberDao();
     String name=dao.getName(myid);
     String member_num=dao.getMemberNum(myid);
     System.out.println(name);
     
     if(loginok==null){%>

			<button type="button" style="font-size: 10pt; background-color: white; border: 0px; color: black;" onclick="location.href='index.jsp?main=login/joinForm.jsp'">회원가입</button>
			<b class='v-line' style="  border-left : 2px solid gray;  font-size: 13px;   margin-right: 10px; "></b>
			<button type="button" style="font-size: 10pt; background-color: white; border: 0px; color: black;"
				onclick="location.href='login/loginMain.jsp'">로그인</button>
				
			<%}else{%>

			<b style="font-size: 10pt; margin-right: 10px; " ><%=name %> 님 </b>
			<b class='v-line' style="  border-left : 2px solid gray;  font-size: 13px;    margin-right: 10px; "></b>
			<!-- 로그아웃 잘못되면 수정할 곳 -->
			<button type="button" style="font-size: 10pt; background-color: white; border: 0px; color: black;"
				onclick="location.href='login/loginMain.jsp?'">로그아웃</button>
			<%}
   	%>

	</div>
	
<div class="search-wrap">
	<div class="header-search">
		<a class="logo" onclick="location.href='index.jsp'"> <img alt="" src="image/uselogo.png"></a>
		<form action="index.jsp?main=search/searchItem.jsp" method="post" name="search">
			<div class="search">
				<input type="text" placeholder="검색어 입력" name="searchText">
				<button type="submit" style="border: 0px; background-color: white; width: 30%">
					<img src="image/searchicon.png" style="width: 20%; margin-right: 10px;" align="right">
				</button>
			</div>
		</form>
	</div>

	<div class="icon-wrap">
			<%
			String id=(String)session.getAttribute("myid");
			CartDao cdao=new CartDao();
			
			if(loginok!=null && cdao.getSumcnt(member_num)!=0){
			%>
			<div style="width: 25px; height: 25px; background-color:#4B62D3; position:relative; z-index: 5; 
			border-radius: 100px; top: 40%; right: -70%; border: 1px solid white; text-align: center; line-height: 25px">
			<p style="color: white; font-size: 10pt">
				<%=cdao.getSumcnt(member_num) %>
			</p>
			</div>
			<%} %>
			
			<img class="heart" alt="" src="image/heart.png"
				style="margin-top: 10px; margin-right: 10px;">

			<!-- 카트 -->
			<%
     		ItemDao sdao=new ItemDao();
    		/*  int cartSize=sdao.getCartList(myid).size(); */
     		%>
				<img alt="장바구니 " src="image/cartlogo1.png" class="cart" 
				style="margin-top: 10px; margin-right: 10px;">


	</div>
	</div>
</div>
</div>

</div>
<script type="text/javascript">
	$(".heart").click(function() {
		<% 
			if(loginok!=null) { %>
			location.href='index.jsp?main=jjim/jjimList.jsp';
		<% } else{ %>
			alert("회원 전용 서비스입니다. 로그인 해주세요.");
			location.href='index.jsp?main=login/loginForm.jsp';
		<% } %>
	});
	$(".cart").click(function() {
		<% if(loginok!=null) { %>
		location.href='index.jsp?main=cart/cartPage.jsp';
		<% } else{ %>
		alert("회원 전용 서비스입니다. 로그인 해주세요.");
		location.href='index.jsp?main=login/loginForm.jsp';
		<% } %>
	});
</script>
</body>
</html>