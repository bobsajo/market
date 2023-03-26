<%@page import="data.dao.ItemDao"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ItemDto"%>
<%@page import="data.dto.JjimDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.JjimDao"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="data.dao.MemberDao" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/jjim.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>

<%
//로그인 상태와 아이디 가져오기
String loginok=(String)session.getAttribute("loginok");
String myid=(String)session.getAttribute("myid");

//상품이 들어갈때 member_num 받아서 들어오기
	String member_num=request.getParameter("member_num");

//dao 선언
JjimDao db= new JjimDao();
ItemDao idao=new ItemDao();

NumberFormat nf = NumberFormat.getInstance(Locale.KOREA);

//페이징

	int totalCount;
    int totalPage; //총 페이지 수
    int startPage; //각 블럭의 시작 페이지
    int endPage; //각 블럭의 끝 페이지(예:1~10 다음의 1~10 부분)
    int start; //각 페이지의 시작 번호
    int perPage=5; //한 페이지에 보여질 글의 갯수
    int perBlock=3; //한 블럭 당 보여지는 페이지 갯수(밑에 뜨는 1~10, 다음 이 부분)
    int currentPage; //현재 페이지
    
    
    //총갯수
    totalCount=db.getTotalCount(member_num);
    
    //현재 페이지에 글이 하나도 없어도 블럭을 1페이지로 두겠다, 페이지 있으면 그 페이지로 나타냄
    //현재 페이지번호 읽기(단 null일 때는 1페이지로 설정)
    if(request.getParameter("currentPage")==null)
    	currentPage=1;
    else
    	currentPage=Integer.parseInt(request.getParameter("currentPage"));
    
    //총페이지 갯수
    totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
    
  //각 블럭의 시작 페이지...현재 페이지가 3(startPage:1, endPage:5)  6(s:6 e:10)
    startPage=(currentPage-1)/perBlock*perBlock+1;
    endPage=startPage+perBlock-1;
    
    
    //총페이지가 8, (6~10...endpage를 8로 수정해주어야 한다)
    //10까지 설정해 놨으나 총 페이지가 8이라면 마지막 페이지를 8로 수정해줘야 한다
    if(endPage>totalPage)
        endPage=totalPage;
    
    //각 페이지에서 불러 올 시작번호
    //현재 페이지가 2라면 startPage는 6이 됨(한 페이지에 5개 들어가니까)
    start=(currentPage-1)*perPage;
    
    List<JjimDto> list;
    list=db.getJjimLike(member_num);
	List<ItemDto> ilist=db.getJjimItem(member_num,start,perPage);
%>
<body>
	<div><b> 찜한 목록 (<%=list.size()%>)</b></div>
	<hr>
	<div class="jitem-wrap">
	<%

	for(int i=0; i<ilist.size(); i++){ %>
		<div class="jitem">
			<img src="../save-info-img/<%=ilist.get(i).getItem_img()%>" class="jjim-img" width="130">
			<div>
				<span><%=ilist.get(i).getItem_name()%></span><br>
				<span><%=nf.format(ilist.get(i).getItem_price())%></span>
			</div>
			<div>
				<button class="jdel jbtn" type="button" item_num="<%=ilist.get(i).getItem_num()%>" member_num="<%=list.get(i).getMember_num()%>">삭제</button> <br>
				<button class="jcart jbtn" value="<%=ilist.get(i).getItem_num()%>">장바구니 담기</button>
			</div>
		<br>
		<hr class="jhr">
		</div>
		<% } %>
	</div>
	</div>
	<%-- 페이징 기법 --%>
	<div class="pagination1">
		<%
			//블록 이전 버튼
			if(startPage>1) { %>
		<a href="jjimList.jsp?currentPage=<%=startPage-1%>&member_num=<%=member_num%>" class="p-left">&laquo;</a>
		<% }

			//밑에 블럭 설정
			for(int pp=startPage; pp<=endPage; pp++) {
				if(pp==currentPage) { %>
		<a href="jjimList.jsp?currentPage=<%=pp%>&member_num=<%=member_num%>" class="active"><%=pp%></a>
		<% } else { %>
		<a href="jjimList.jsp?currentPage=<%=pp%>&member_num=<%=member_num%>"><%=pp%></a>
		<% }
		}

			//블록 다음 버튼
			if(endPage<totalPage) { %>
		<a href="jjimList.jsp?currentPage=<%=endPage+1%>&member_num=<%=member_num%>">&raquo;</a>
		<% }
		%>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style = "text-align:left;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
					<br><br><br>
				</div>

				<div class="modal-body" style = "text-align:right; margin-right:20px;">
					<div class="pricewrapper">

						<span style = "font-size:20px;float:left;">수량:</span>

						<button class="cnt_btn cnt_minus">

							<i class="fa-solid fa-minus"></i>

						</button>

						<span class="cart_cnt">1</span>

						<button class="cnt_btn cnt_plus">

							<i class="fa-solid fa-plus"></i>

						</button>
						<br><br><br>
						<span style = "font-size: 20px; float:left;">합계: </span>
						<span class = "total_price" total = "" style = "font-size: 20px;"></span>
						<br><br>
						<span style = "width:80px; height:40px; margin-right:10px; border-radius: 10px; background-color: rgb(255, 191, 0); font-size: 15px; font-weight:600; line-height:20px; color: rgb(255, 255, 255); text-align:center;">적립 &nbsp;&nbsp;</span>
						<span>로그인 후, 회원할인가와 적립혜택 제공</span>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default cancel" data-dismiss="modal" style = "width: 278px; height: 50px; font-weight: bold; ">취소</button>
					<button type="button" class="btn btn-default add" data-dismiss="modal" style = "width: 278px; height: 50px; background-color: #4B62D3; font-weight: bold; color: white;">장바구니 담기</button>
				</div>
			</div>

		</div>
	</div>

	<script type="text/javascript">
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
					one_price=$(".total_price").eq(i).attr("total",total_price);
				}
				if(cnt==1){
					//1이라면
					$(".cnt_minus").eq(i).css("color","lightgray");
					$(".cnt_minus").eq(i).css("cursor","default");
				}
			});
		});

		$(".jcart").each(function(i,ele){
			$(ele).click(function(){
				$("#myModal").modal(); //열기
				var item_num = $(ele).val();
				// console.log(item_num);
				$.ajax({
					type:"get",
					dataType:"json",
					data:{"item_num":item_num},
					url:"common/itemInfo.jsp",
					success:function(res){
						$(".add").val(item_num);
						$('.modal-header').html(res.item_name);

						$('.total_price').text(res.item_price.toLocaleString('ko-KR') + "원");
						$('.total_price').attr("total", res.item_price);
					}
				});

			});
		});
		$(".cancel").click(function(){
			$('#myModal').modal("hide"); //닫기
		});

		$(".add").click(function(){
			//임시로그인
			var item_num = $(".add").val();
			var cart_cnt = $(".cart_cnt").text();
			$.ajax({
				type:"get",
				dataType:"html",
				data:{"item_num":item_num, "cart_cnt":cart_cnt},
				url:"cart/cartSearchItem.jsp",
				success:function(res){

				}
			});
		});

		$(".jdel").click(function() {

			var item_num=$(this).attr("item_num");
			var member_num=$(this).attr("member_num");

			location.href="jjim/jjimDelete.jsp?item_num="+item_num+"&member_num="+member_num;
		});
	</script>
</body>
</html>