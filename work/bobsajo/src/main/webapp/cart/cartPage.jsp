<%@page import="java.util.Random"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.CartDao"%>
<%@page import="data.dto.CartDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://unpkg.com/tailwindcss@1.2.0/dist/tailwind.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="../iconsource/all.min.css">
<script src="../iconsource/all.min.js"></script>

<title>cart</title>

<%

//로그인 상태확인
String loginok=(String)session.getAttribute("loginok");

String myid="";
CartDto cdto=new CartDto();
CartDao cdao=new CartDao();
//로그인 상태라면 아이디 가져오기
if(loginok!=null){
	myid=(String)session.getAttribute("myid");
	
	//사용자 member_dto 가져오기
	MemberDao mdao=new MemberDao();
	MemberDto mdto=mdao.getMemberById(myid);
	System.out.print(mdto.getMember_name()+"님의 메일은 "+mdto.getMember_email()+"입니다.");
}

%>

<style type="text/css">
	/*체크박스모양 바꾸기*/
	input[type="checkbox"] {
	
	
	    display:none;
	    appearance: none;
	
	
	}
	
	
	input[type="checkbox"] {
	
	
	    display: inline-block;
	
	
	    width: 25px;
	    height: 25px;
	
		margin: -2px 10px 0 0;
	
	    vertical-align: middle;
	
	    background-size: cover;
	    
	    background: url(../imgsource/checkbox_default.png) no-repeat;
	
	
	}
	
	input[type="checkbox"]:checked {
	
	
	     background-size: cover;
	     
	     background: url(../imgsource/checkbox_checked.png) no-repeat;
	     
	}
	
	input[type="checkbox"]:focus {
		outline:none;
	}
	
	
	div.container{
		width: 100%;
		margin: 10px;
	}
	
	div.cartwrapper{
		margin: 0 auto;
		width: 1000px;
		height: 100%;
	}
	
	div.cartwrapper>div{
		float: left;
	}
	
	div.cartlist_div{
		width: 70%;
	}
	
	div.cartlist_header{
		border-bottom: 1px solid black;
		padding-bottom: 10px;
		margin-left: 10px;
	}
	
	span.line{
		color: lightgray;
		padding: 0px 20px 0px 20px;
	}
	
	.content{
		margin-top: 15px;
	}
	
	.title{
		margin-left: 10px;
		height: 35px;
		line-height: 35px;
		margin-bottom: 25px;
	}
	
	.title>span{
		float: left;
		margin-right: 10px;
	}
	
	.icon{
		padding: 0px 3px 6px 5px;
		height: 30px;
	}
	
	.nextline{
		clear: both;
	}
	
	.categoryTitle{
		font-size: 13pt;
	}
	
	.list_content{
		margin-left: 10px;
		width: 100%;
	}
	
	.list_content>div{
		float: left;
	}
	
	.item_check{
		width: 5%;
	}
	
	.item_img{
		width: 10%;
	}
	
	.item_name{
		width: 45%;
	}
	
	.item_cnt{
		width: 14%;
		text-align: right;
	}
	
	.item_price{
		width: 19%;
		height: 50px;
		text-align: right;
	}
	
	.itemDel{
		width: 7%;
		text-align: right;
	}
	
	.cnt_btn_wrapper{
		width: 100%;
		height: 30px;
		line-height: 30px;
		float: left;
		text-align: center;
		border: 1px solid lightgray;
		border-radius: 5px;
	}
	
	button.cart_cnt{
		width: 20%;
		cursor: default;
	}
	
	button:focus{
		outline: none;
	}
	
	.cnt_btn{
		width: 30%;
		text-align: center;
	}
	
	
</style>

<script>

$(function(){
	
	//체크박스 옆 글자선택해도 체크박스 선택되게
	$("b.allCheck").click(function(){
	
		if($("input.allCheck").is(":checked")){
			$("input.allCheck").attr("checked",false);
		}else{
			$("input.allCheck").attr("checked","checked");
		}
	});
});

function cartList(){
	
}

</script>

</head>
<body>
	<div class="container">
		<div class="cartwrapper">
			<!-- 왼쪽 장바구니 목록창 -->
			<div class="cartlist_div">
				<div class="cartlist_header">
					<b class="allCheck"><input type="checkbox" class="allCheck">&nbsp;전체선택(1/1)</b>
					<span class="line">|</span>
					<span id="selDel">선택삭제</span>
				</div>
				
				<div class="cartlist_content">
					<div class="cartlist_cold content">
						<div class="cold_title title">
							<!-- 폰트어썸 -->
							<span class="icon"><i class="fa-solid fa-droplet fa-xl"
							 style="color: green;"></i></span>
							<span class="categoryTitle"><b>냉장 상품</b></span>
							<div class="nextline"></div>
						</div>
						<!-- 장바구니에 담긴 냉장 상품 -->
							<div class="list_content">
								<div class="item_check">
									<input type="checkbox" class="">
								</div>
								<div class="item_img">
									<img alt="" src="">
								</div>
								<div class="item_name">
									<span>상품명</span>
								</div>
								<div class="item_cnt">
									<div class="cnt_btn_wrapper">
										<button class="cnt_btn cnt_minus">
											-
										</button>
										<button class="cart_cnt">01</button>
										<button class="cnt_btn cnt_plus">
											+
										</button>
									</div>
								</div>
								<div class="item_price">
									<span>10,000원</span>
								</div>
								<div class="itemDel">
									<button type="button">X</button>
								</div>
							</div>
							<div class="nextline"></div>
					</div>
					
					<div class="cartlist_header"></div>
					<div class="nextline"></div>
					
					<div class="cartlist_freeze content">
						<div class="freeze_title title">
							<span class="icon"><i class="fa-regular fa-snowflake fa-xl"
							 style="color: skyblue;"></i></span>
							<span class="categoryTitle"><b>냉동 상품</b></span>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 오른쪽 배송지/금액/주문창  -->
			<div class="order_div">
				
			</div>
		</div>
	</div>
</body>
</html>














