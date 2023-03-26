<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="login/loginForm.css">
<title>loginForm</title>
<link rel="stylesheet" href="/login/loginForm.css">

	<style type="text/css">
		/*div.login_container{
			width: 100%;
			margin-top: 10px;
		}

		form.login_form{
			width: 340px;
			margin: 0 auto;
		}

		#input_div{
			text-align: center;
		}

		#input_div>h4{
			margin-bottom: 30px;
		}

		input.login_input{
			width: 100%;
			font-size: 10pt;
			height: 54px;
			border: 1px solid lightgray;
			margin-bottom: 10px;
		}

		input.login_input:active{
			border: 1px solid gray;
		}

		#login_search{
			text-align: right;
			display: inline-block;
			float: left;
			width: 100%;
		}

		span.search:hover{
			cursor: pointer;
		}

		button.login_btn{
			width: 100%;
			height: 55px;
			margin-top: 10px;
			border-radius: 5px;
			font-size: 12pt;
			font-weight: bold;
		}

		.search {
			border: 0px;
			padding: 0px;
			display: inline-block;
		}

		#submit_btn{
			color: white;
			background-color: #4B62D3;
			border: 1px solid #4B62D3;
		}

		#join_btn{
			color: #4B62D3;
			background: white;
			border: 1px solid #4B62D3;
		}
*/
	</style>

</head>
<%
	String item_num=request.getParameter("item_num");
%>
<body>
	<div class="login_container">	
		<form action="../login/loginAction.jsp" method="post" class="login_form">
		<input type="hidden" name="item_num" value="<%=item_num %>">
			<div id="input_div">
				<h4><b>로그인</b></h4>
				<input type="text" name="id" placeholder="아이디를 입력해주세요" 
				class="input-lg login_input" required="required">
				<input type="password" name="pass" placeholder="비밀번호를 입력해주세요" 
				class="input-lg login_input" required="required">
			</div>
			<div id="login_search">
				<a href="index.jsp?main=login/searchIdForm.jsp"><span class="searchLogin search_id">아이디 찾기</span></a> | <a href="index.jsp?main=login/searchPassForm.jsp"><span class="searchLogin search_pass">비밀번호 찾기</span></a></h6>
			</div>
			<div id="btn_div">
				<button type="submit" class="login_btn" id="submit_btn">로그인</button><br>
				<button type="button" class="login_btn" id="join_btn" 
				onclick="location.href='joinForm.jsp'">회원가입</button>
			</div>
		</form>
	</div>
</body>
</html>
















