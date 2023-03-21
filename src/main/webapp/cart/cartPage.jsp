<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
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

//나중에 삭제할 부분!!!!!!!!!!
///////////////////////////
session.setAttribute("loginok", "yes");
session.setAttribute("myid", "yezi");

///////////////////////////

//로그인 상태확인
String loginok=(String)session.getAttribute("loginok");

String myid="";
CartDto cdto=new CartDto();
CartDao cdao=new CartDao();
MemberDao mdao=new MemberDao();
MemberDto mdto=new MemberDto();
//로그인 상태라면 아이디 가져오기
if(loginok!=null){
	myid=(String)session.getAttribute("myid");
	
	//사용자 member_dto 가져오기
	mdto=mdao.getMemberById(myid);
	//System.out.println(mdto.getMember_name()+"님의 메일은 "+mdto.getMember_email()+"입니다.");
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
	
	/* Chrome, Safari, Edge, Opera */
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
	  	-webkit-appearance: none;
	  	margin: 0;
	}
	
	/* Firefox */
	input[type=number] {
	  -moz-appearance: textfield;
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
		margin-bottom: 10px;
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
		margin-bottom: 10px;
		width: 100%;
	}
	
	/*
	.list_content>div{
		float: left;
	}*/
	
	.item_check{
		width: 5%;
	}
	
	.item_img{
		width: 10%;
	}
	
	.item_name{
		width: 50%;
		padding-left: 15px;
		font-weight: bold;
		font-size: 11pt;
	}
	
	.item_cnt{
		width: 100px;
		text-align: right;
		float: left;
		height: 50px;
		padding-top: 30px;
	}
	
	.item_price{
		width: 14%;
		height: 50px;
		text-align: right;
		font-weight: bold;
		font-size: 12pt;
	}
	
	.itemDel{
		width: 7%;
		text-align: center;
	}
	
	.cnt_btn_wrapper{
		width: 85%;
		height: 30px;
		line-height: 30px;
		float: left;
		text-align: center;
		border: 1px solid lightgray;
		border-radius: 5px;
	}
	
	button:focus{
		outline: none;
	}
	
	.cnt_btn{
		width: 30%;
		/* text-align: center; */
		font-size: 10pt;
		font-weight: bold;
		padding: 0px 5px 0px 5px;
		height: 30px;
		line-height: 30px;
	}
	
	.cart_cnt{
		display: inline-block;
		width: 30%;
	  	text-align: center;
	  	background: none;
	  	font-size: 12pt;
	  	margin: 0 auto;
	  	padding: 0px;
	}
	
	.nextitem_line{
		width: 100%;
		border-top: 1px 
	}
	
	.subline{
		margin-top: 25px;
		margin-bottom: 25px;
		border: 1px solid #EFEFEF;
		width: 100%;
	}
	
	
</style>

<script>

$(function(){
	/*

	td.item_img>img

	td.item_name>span

	td.item_cnt>span (=#cart_cnt)

	td.item_price>span

	td.itemDel>button (삭제버튼)

	*/
	
	//체크박스 옆 글자선택해도 체크박스 선택되게
	$("b.allCheck").click(function(){
	
		if($("input.allCheck").is(":checked")){
			$("input.allCheck").attr("checked",false);
		}else{
			$("input.allCheck").attr("checked","checked");
		}
	});
	
	//상품개수가 최소치(=1)라면 -를 비활성화
	$(".cart_cnt").each(function(i,ele){
		if(Number($(ele).text())==1){
			$(".cnt_minus").eq(i).css("color","lightgray");
			$(".cnt_minus").eq(i).css("cursor","default");
		}
	});
	
	//+버튼
	$(".cnt_plus").each(function(i,ele){
		$(ele).click(function(){
			var cnt=Number($(".cart_cnt").eq(i).text());
			//해당 상품의 하나의 값
			var one_price=$(".total_price").eq(i).attr("total")/cnt;
			
			$(".cart_cnt").eq(i).text(cnt+1);
			$(".cnt_minus").eq(i).css("color","black");
			$(".cnt_minus").eq(i).css("cursor","pointer");
			
			//가격 하나 더한 가격
			var total_price=one_price*(cnt+1);
			$(".total_price").eq(i).text(total_price.toLocaleString('ko-KR')+"원");
			var one_price=$(".total_price").eq(i).attr("total",total_price);
		});
	});
	
	//-버튼
	$(".cnt_minus").each(function(i,ele){
		$(ele).click(function(){
			var cnt=Number($(".cart_cnt").eq(i).text());
			
			if(cnt!=1){
				//해당 상품의 하나의 값
				var one_price=$(".total_price").eq(i).attr("total")/cnt;
				//console.log(one_price)
				
				//개수 -1, 가격도 하나 뺀  가격으로
				$(".cart_cnt").eq(i).text(cnt-1);
				
				var total_price=one_price*(cnt-1);
				$(".total_price").eq(i).text(total_price.toLocaleString('ko-KR')+"원");
				var one_price=$(".total_price").eq(i).attr("total",total_price);
			}
			if(cnt==1){
				//1이라면
				$(".cnt_minus").eq(i).css("color","lightgray");
				$(".cnt_minus").eq(i).css("cursor","default");
			}
		});
	});
	
	//전체선택
	$("input.allCheck").click(function(){
		if($(this).is(":checked")){
			$("input.one_check:visible").prop('checked',true);
			$(".chk_cnt").text($("input.one_check:checked").length);
		}else{
			$("input.one_check:visible").prop('checked',false);
			$(".chk_cnt").text($("input.one_check:checked").length);
		}
	});
	
	//개별 선택시에도 전체선택 옆에 숫자 증가
	$("input.one_check").each(function(i,ele){
		$(ele).click(function(){
			if($(this).is(":checked")){
				$(".chk_cnt").text($("input.one_check:checked").length);
			}else{
				$(".chk_cnt").text($("input.one_check:checked").length);
			}
		});
	});
	
	//삭제
	$(".itemDel button").each(function(i,ele){
		$(ele).click(function(){
			//삭제 액션 실행후
			//console.log($("input.one_check").eq(i).is(":checked"));
			//삭제한 상품 숨기기(hide)
			
			$(".list_content").eq(i).css("display","none");
			
			//만약 삭제한 상품이 체크된 상태라면 체크값 해제+체크개수에서 빼주기
			
			if($("input.one_check").eq(i).is(":checked")==true){
				var cnt=Number($(".chk_cnt").text());
				console.log(cnt);
				$(".chk_cnt").text(--cnt);
				//삭제한 상품 체크 해제
				$("input.one_check").eq(i).attr("checked",false);
			}
			
			var cold_null=false;
			var freeze_null=false;
			var room_null=false;
			
			//냉장 상품이 전부 비었는지 확인
			$(".cartlist_cold .list_content").each(function(i,ele){
				if($(ele).css("display")=="none"){
					cold_null=true;
				}else{
					cold_null=false;
					return false;
				}
			});
			
			//냉장 상품이 전부 비었다면 냉장 상품란 지우기
			if(cold_null){
				$(".cold_title").hide();
				$(".cold_title").removeClass("title");
				$(".cartlist_cold").next(".cartlist_header").css("border","0px").css("padding-bottom","0px");
			}
			
			//냉동 상품이 전부 비었는지 확인
			$(".cartlist_freeze .list_content").each(function(i,ele){
				if($(ele).css("display")=="none"){
					freeze_null=true;
				}else{
					freeze_null=false;
					return false;
				}
			});
			
			//상온 상품이 전부 비었다면 상온 상품란 지우기
			if(freeze_null){
				$(".freeze_title").hide();
				$(".freeze_title").removeClass("title");
				$(".cartlist_freeze").next(".cartlist_header").css("border","0px").css("padding-bottom","0px");
			}
			
			//상온 상품이 전부 비었는지 확인
			$(".cartlist_room .list_content").each(function(i,ele){
				if($(ele).css("display")=="none"){
					room_null=true;
				}else{
					room_null=false;
					return false;
				}
			});
			
			//냉동 상품이 전부 비었다면 냉동 상품란 지우기
			if(room_null){
				$(".room_title").hide();
				$(".room_title").removeClass("title");
			}
			
			//총 개수 수정
			var total_cnt=Number($(".total_cnt").text());
			$(".total_cnt").text(--total_cnt);
			
			var cart_num=$(ele).val();
			
			$.ajax({
				type:"get",
				dataType:"html",
				url:"deleteCart.jsp",
				data:{"cart_num":cart_num},
				success:function(){}
			})
			
		});
	});
	
	//전체삭제
	$("#selDel").click(function(){
		$("input.one_check:checked").each(function(i,ele){
			var cart_num=$(ele).val();
			
			$.ajax({
				type:"get",
				dataType:"html",
				url:"deleteCart.jsp",
				data:{"cart_num":cart_num},
				success:function(){}
			});
		});
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
			
			
			<% 
				String member_num=mdto.getMember_num();
				//System.out.println(member_num);
				List<HashMap<String,String>> list=cdao.getAllUserCart(member_num);
				NumberFormat nf=NumberFormat.getNumberInstance();
				
				List<HashMap<String,String>> cold=new ArrayList<HashMap<String,String>>();
				List<HashMap<String,String>> freeze=new ArrayList<HashMap<String,String>>();
				List<HashMap<String,String>> room=new ArrayList<HashMap<String,String>>();
				
				for(HashMap<String,String> c:list){
					
					//냉장 리스트
					if(c.get("item_package_type").contains("냉장")){
						cold.add(c);
					}
					
					//냉동 리스트
					if(c.get("item_package_type").contains("냉동")){
						freeze.add(c);
					}
					
					//상온 리스트
					if(c.get("item_package_type").contains("상온")){
						room.add(c);
					}
					
				}
				
				int total_cnt=cold.size()+freeze.size()+room.size();
					
					//다시 아래에 냉장 리스트 for문, 냉동 리스트 for문, 상온 리스트 for문 돌리기
					
			%>
			
			<div class="cartlist_div">
				<div class="cartlist_header">
					<b class="allCheck"><input type="checkbox" class="allCheck">&nbsp;전체선택(<span class="chk_cnt">0</span>/<span class="total_cnt"><%=total_cnt %></span>)</b>
					<span class="line">|</span>
					<span id="selDel">선택삭제</span>
				</div>
				
					<div class="cartlist_content">
					<%
					//냉장
					if(cold.size()!=0){%>
						<div class="cartlist_cold content">
						<div class="cold_title title">
							<!-- 폰트어썸 -->
							<span class="icon"><i class="fa-solid fa-droplet fa-xl"
							 style="color: green;"></i></span>
							<span class="categoryTitle"><b>냉장 상품</b></span>
							<div class="nextline"></div>
						</div>
					<%
						int isfirst=0;
						for(HashMap<String,String> item:cold){ 
							isfirst++;
							int total_price=(Integer.parseInt(item.get("item_price")))*(Integer.parseInt(item.get("cart_cnt")));
					%>
							<!-- 장바구니에 담긴 냉장 상품 -->
								<div class="list_content">
									<table style="width: 100%">
										<tr>
											<td class="item_check">
												<input type="checkbox" class="one_check" value="<%=item.get("cart_num") %>">
											</td>
											<td class="item_img">
												<img src="../itemImg/<%=item.get("item_img") %>">
											</td>
											<td class="item_name">
												<span><%=item.get("item_name") %></span>
											</td>
											<td class="item_cnt">
												<div class="cnt_btn_wrapper">
													<button class="cnt_btn cnt_minus">
														<i class="fa-solid fa-minus"></i>
													</button>
													<span class="cart_cnt"><%=item.get("cart_cnt") %></span>
													<button class="cnt_btn cnt_plus">
														<i class="fa-solid fa-plus"></i>
													</button>
												</div>
											</td>
											<td class="item_price">
												<span class="total_price" total=<%=total_price %>><%=nf.format(total_price) %>원</span>
											</td>
											<td class="itemDel">
												<button type="button" value=<%=item.get("cart_num") %>>
													<i class="fa-solid fa-x" style="color: lightgray"></i>
												</button>
											</td>
										</tr>
									</table>
									<% 
									if(isfirst!=cold.size()){%>
									<div class="subline"></div>
									<%} %>
								</div>
						
					<%
					
						}
					%>
						<div class="nextline"></div>
						<div class="nextitem_line"></div>
					</div>
					<%}
					
					///냉동
					
					if(freeze.size()!=0){%>
					<div class="cartlist_header"></div>
					<div class="cartlist_freeze content">
					<div class="freeze_title title">
						<!-- 폰트어썸 -->
						<span class="icon"><i class="fa-regular fa-snowflake fa-xl"
						 style="color: skyblue;"></i></span>
						<span class="categoryTitle"><b>냉동 상품</b></span>
					</div>
				<%
					int isfirst=0;
					for(HashMap<String,String> item:freeze){ 
						isfirst++;
						int total_price=Integer.parseInt(item.get("item_price"))*Integer.parseInt(item.get("cart_cnt"));
				%>
						<!-- 장바구니에 담긴 냉장 상품 -->
							<div class="list_content">
								<table style="width: 100%">
									<tr>
										<td class="item_check">
											<input type="checkbox" class="one_check" value="<%=item.get("cart_num") %>">
										</td>
										<td class="item_img">
											<img src="../itemImg/<%=item.get("item_img") %>">
										</td>
										<td class="item_name">
											<span><%=item.get("item_name") %></span>
										</td>
										<td class="item_cnt">
											<div class="cnt_btn_wrapper">
												<button class="cnt_btn cnt_minus">
													<i class="fa-solid fa-minus"></i>
												</button>
												<span class="cart_cnt"><%=item.get("cart_cnt") %></span>
												<button class="cnt_btn cnt_plus">
													<i class="fa-solid fa-plus"></i>
												</button>
											</div>
										</td>
										<td class="item_price">
											<span class="total_price" total=<%=total_price %>><%=nf.format(total_price) %>원</span>
										</td>
										<td class="itemDel">
											<button type="button" value=<%=item.get("cart_num") %>>
												<i class="fa-solid fa-x" style="color: lightgray"></i>
											</button>
										</td>
									</tr>
								</table>
								<% 
								if(isfirst!=freeze.size()){%>
								<div class="subline"></div>
								<%} %>
							</div>
					
				<%
					}
				%>
					<div class="nextline"></div>
					<div class="nextitem_line"></div>
				</div>
				<%}
					///상온
					
					if(room.size()!=0){%>
					<div class="cartlist_header"></div>
					<div class="cartlist_room content">
					<div class="room_title title">
						<!-- 폰트어썸 -->
						<span class="icon"><i class="fa-regular fa-sun fa-xl" 
						style="color: #fea034;"></i></span>
						<span class="categoryTitle"><b>상온 상품</b></span>
					</div>
				<%
					int isfirst=0;
					for(HashMap<String,String> item:room){ 
						isfirst++;
						int total_price=Integer.parseInt(item.get("item_price"))*Integer.parseInt(item.get("cart_cnt"));
				%>
						<!-- 장바구니에 담긴 상온 상품 -->
							<div class="list_content">
								<table style="width: 100%">
									<tr>
										<td class="item_check">
											<input type="checkbox" class="one_check" value="<%=item.get("cart_num") %>">
										</td>
										<td class="item_img">
											<img src="../itemImg/<%=item.get("item_img") %>">
										</td>
										<td class="item_name">
											<span><%=item.get("item_name") %></span>
										</td>
										<td class="item_cnt">
											<div class="cnt_btn_wrapper">
												<button class="cnt_btn cnt_minus">
													<i class="fa-solid fa-minus"></i>
												</button>
												<span class="cart_cnt"><%=item.get("cart_cnt") %></span>
												<button class="cnt_btn cnt_plus">
													<i class="fa-solid fa-plus"></i>
												</button>
											</div>
										</td>
										<td class="item_price">
											<span class="total_price" total=<%=total_price %>><%=nf.format(total_price) %>원</span>
										</td>
										<td class="itemDel">
											<button type="button" value=<%=item.get("cart_num") %>>
												<i class="fa-solid fa-x" style="color: lightgray"></i>
											</button>
										</td>
									</tr>
								</table>
								<% 
								if(isfirst!=room.size()){%>
								<div class="subline"></div>
								<%} %>
							</div>
					
				<%
					}
				%>
					<div class="nextline"></div>
					<div class="nextitem_line"></div>
				</div>
				<%}
				%>
					</div>
			</div>
			
			<!-- 오른쪽 배송지/금액/주문창  -->
			<div class="order_div">
				
			</div>
		</div>
	</div>
</body>
</html>















