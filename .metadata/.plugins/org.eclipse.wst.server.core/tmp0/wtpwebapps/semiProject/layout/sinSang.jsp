<%@page import="java.util.Locale"%>
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
<style type="text/css">
.title{
	display: flex;
	margin: 0 20px;
	
}
.tb1{
	margin:50px 25px;
	
}
.cartbtn{
	 	background-color:#4B62D3;
		opacity : 0.8;
		border-radius: 100px;
		border: 0px;
		position: relative;
		top:-70px;
		left:225px;
	}
</style>

<!-- <script>
   $(function(){
      $("a.godetail").click(function(){
         
         var item_num = $(this).attr("item_num");
         
         location.href="index.jsp?main=layout/categoryList.jsp?item_num=" + item_num;
      });
   });

</script> -->

</head>
<body>
	<div class = "container" style= "margin-right: 25%;"> 
    <div class = "tab-content" >
     	<div id = "tabs-1" class = "tab-pane fade in active">
		<p>
			<table class = "tb1">
			<caption><b>신상품 목록</b></caption>
				<tr>
					<%
					
					String category=request.getParameter("category");
					
					NumberFormat nf = NumberFormat.getInstance(Locale.KOREA);
					ItemDao dao = new ItemDao();
					List<ItemDto> list = dao.getAllSinsang();
					int i=0;
					
					for(ItemDto dto:list)
					{
						String item_img = dto.getItem_img();
						
						%>
	                	<td>
	                	<div style="margin:0px 30px 30px 0px; height: 550px;" >
	                      <a href = "index.jsp?main=detail/detailView.jsp?item_num=<%=dto.getItem_num() %>" style="cursor: pointer;" class="godetail">
	                      <img src="itemImg/<%=dto.getItem_img()%>" class="photo" style="width: 300px;"></a>
	                      <button type = "button" class = "cartbtn" value="<%=dto.getItem_num()%>"><img src="image/cart.png" width="50";></button>
          				  <a href="detail/detailView.jsp?item_num=<%=dto.getItem_num() %>" class = "a" style = "text-decoration: none;">
          				  <div style="color: black; font-size: 16px; text-align: left;  margin-top: -15%;" >
	                         <p><%=dto.getItem_name()%></p>
	                      
				          	<%	
				          	if(!dao.itemIsSale(dto.getItem_num())) {%>
				          		<p><b><%=nf.format(dto.getItem_price())%>원</b></p>
				          	<%}else{ 
				          		int ori=dto.getItem_price();
								int sal=dao.getSalePrice(dto.getItem_num());
								int off=(int)((ori-sal)/(ori*1.0)*100);
				          	%>
				          		<p><font style="color: red"><%=off %>% &nbsp;</font><b><%=nf.format(dao.getSalePrice(dto.getItem_num()))%>원</b></p>
				          		<p style="color: gray; font-size: small;"><strike><%=nf.format(dto.getItem_price())%>원</strike></p>
				          	<%} %>
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
	  var one_price=$(".total_price").eq(i).attr("total",total_price);
	  }

	  if(cnt==1){
	  //1이라면
	  $(".cnt_minus").eq(i).css("color","lightgray");
	  $(".cnt_minus").eq(i).css("cursor","default");
	  }
	  });
	});
  
	  $(".cartbtn").each(function(i,ele){

	  		$(ele).click(function(){
	            <% 
	            String loginok=(String)session.getAttribute("loginok");
	            if(loginok==null) { %>
	                alert("회원 전용 서비스입니다. 로그인 해주세요.");
	                location.href='index.jsp?main=login/loginForm.jsp';
	            <% } else { %>
	  			$('#myModal').modal(); //열기 
	  			$(".cart_cnt").text("1");
	  			var item_num = $(ele).val();
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
	            <% } %>
	  		});

	  	});
  	
  	$(".cancel").click(function(){
  		$('#myModal').modal("hide"); //닫기 
  	});
  
  	$()
  	$(".add").click(function(){
  		var item_num = $(".add").val();
  		var cart_cnt = $(".cart_cnt").text();
  		$.ajax({
  			type:"get",
  			dataType:"html",
  			data:{"item_num":item_num, "cart_cnt":cart_cnt},
  			url:"cart/cartSearchItem.jsp",
  			success:function(res){
  				var cartGo = confirm("장바구니에 상품을 담았습니다.\n장바구니로 이동하시겠어요?");
                if (cartGo) {
                    location.href = 'index.jsp?main=cart/cartPage.jsp';
                }
  			}
  		});
  	});
  </script>
</body>
</html>
    
   