<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.TimeSaleDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="data.dto.ItemDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ItemDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <title>Slide Project</title>
  
  <style>
  	@import url('https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap');
	
	body{
    	font-family: 'Gothic A1', sans-serif;
	}
	
	a:hover{
		color: black;
	}
  
    html, body { box-sizing: border-box; padding: 0; margin: 0; text-align: center;  min-height: 100vh;}
    *, *:before, *:after { box-sizing: inherit; }
    .clearfix:after { content: ''; display: block; clear: both; float: none; }
    .title { margin-bottom: 0; text-align: center; font-size: 30px; color: #333; }
    .link, .link:visited { display: inline-block; margin: 20px 0; color: #555; text-decoration: none; font-weight: bold; }
    .link:hover, .link:focus { color: #9fd6c2; }
    /* container - body */
    #container { width: 100%; margin: auto; }
    .flex-slide{
    	width: 100%;
    	display:flex;
    	z-index:-1;
    }
    .slide_wrap { width: 1220px; padding-bottom: 40px; margin: 0 auto;;}
    .slide_box { width: 1220px; margin:auto; overflow-x: hidden; text-align: center; }
    .slide_content { display: table; float: left; width: 305px; height: 300px;}
    
    .slide_btn_box {background:none; width:100%; height:100%; z-index:1; position: relative; top: -300px;}
    .slide_btn_box > button { position:relative; width: 60px; height: 60px; font-size: 16px;  background: none; border: 0px; cursor: pointer; }
    .slide_btn_box > .slide_btn_prev {left:-47%;}
    .slide_btn_box > .slide_btn_next {left:45%;}
    
    .slide_pagination { position: absolute; left: 50%; bottom: 0; list-style: none; margin: 0; padding: 0; transform: translateX(-50%); }
    .slide_pagination .dot { display: inline-block; width: 15px; height: 15px; margin: 0 5px; overflow: hidden; background: #ddd; border-radius: 50%; transition: 0.3s; }
    .slide_pagination .dot.dot_active { background: #333; }
    .slide_pagination .dot a { display: block; width: 100%; height: 100%; }
    
    .a{
  	text-decoration : none;
  	color:black;
	}
	
	
	<!-- 메인배너 --/>
	.banner_container{
		width: 100%;
		display: flex;
		justify-content: center;
	}
	
	.visual {
	
	}
	
	.visual > .slide{
	    height: 370px;
	    /*margin-left: 300px;*/
	    margin-bottom: 40px;
	    width: 100%;
	    display: none;
	}
	.slide img{
		width:100%;
	}
	.visual > img {
	vertical-align: middle;
	
	}
	.visual > .slideshow-container {
	 
	  height: 500px;
	  /* margin-left:500px;
	  margin-right:500px; */
	 /*  margin:0 auto; */
	}
	
	.visual > .slide.active {
	  opacity: 1;
	},
	/* GOODS */
	.goods{
	
	}
	.goods > .inner{
	   
	}
	.goods .goods-top{
	   text-align: center;
	   margin: 0 auto;
	    display: block;/* 
	    justify-content: center; */
	    /* align-items: center; */
	    padding-top: 40px ;
	    margin-bottom: 27px;
	/*       margin-right:80px; */
	}
	.goods .goods-top span{
	    color: rgb(51, 51, 51);
	    font-size: 28px;
	    line-height: 1.15;
	    letter-spacing: -0.26px;
	    font-weight: 500;
	    padding: 8px 0;
	    margin-left: 10px;
	    margin-right: 50px;
	}
	.goods .goods-list{
	    display: flex;
	    justify-content: space-between;
	    padding-bottom: 40px;
	    float:left;
	    text-align:"center";
	    margin-left: 500px;
	    margin-right: 500px;
	    }
	.goods .goods-list .goods-card{
	    margin-right: 18px;
	   
	}
	.goods .goods-list .goods-card .img-container{
	   
	    height: 320px;
	    position: relative;
	   
	    
	}
	.goods .goods-list .goods-card .img-container img{
	    height: 100%;
	    
	    
	}
	
	.s_fade {
	  /* -webkit-animation-name: fade;
	  -webkit-animation-duration: 1.5s;
	  animation-name: fade;
	  animation-duration: 2.0s; */
	  -webkit-animation-name: slide;
	  -webkit-animation-duration: 1.5s;
	  
	  animation-name: slide;
	  animation-duration: 2.0s;
	}
	
	@-webkit-keyframes slide {
	  /* from {opacity: .1} 
	  to {opacity: 2} */
	  from {transform: translateX(100%);} 
	  to {transform: translateX(0%);}
	}
	
	@keyframes slide {
	  from {transform: translateX(100%);} 
	  to {transform: translateX(0%);}
	}
	
	.s_fade_out {
	  /* -webkit-animation-name: fade;
	  -webkit-animation-duration: 1.5s;
	  animation-name: fade;
	  animation-duration: 2.0s; */
	  -webkit-animation-name: slide2;
	  -webkit-animation-duration: 1.5s;
	  
	  animation-name: slide2;
	  animation-duration: 2.0s;
	}
	
	@-webkit-keyframes slide2 {
	  /* from {opacity: .1} 
	  to {opacity: 2} */
	  from {transform: translateX(0%);} 
	  to {transform: translateX(-100%);}
	}
	
	@keyframes slide2 {
	  from {transform: translateX(0%);} 
	  to {transform: translateX(-100%);}
	}
	
	.main_1>h1{
	     text-align : center;
	}
	
	.product_list{
	   display: flex;
	   float:left;
	   text-align:"center";
	    margin-left: 500px;
	    margin-right: 500px;
	
	     
	}
	.slider-nav {
	  position: absolute;
	  bottom: 10px;
	  left: 50%;
	  transform: translateX(-50%);
	}
	
	.slider-nav button {
	  margin: 0 10px;
	}
	
	.ban{
		margin-left: 10px;
		
	}
	.cartbtn{
	 	background-color:#4B62D3;
		opacity : 0.8;
		border-radius: 100px;
		border: 0px;
		position: relative;
		top:-70px;
		left:100px;
	}
	
	div.slide_show{
		visibility: visible;
		width: 305px;
	}
	
	div.slide_hide{
		visibility: hidden;
	}
	 .timeSale-wrap {
            display: inline-flex;
            align-content: center;
            align-items: center;
            text-align: center;
            margin: 0 auto;
        }
        .saleItem {
            margin-right: 18px;
            margin-top: 60px;
        }
        #the-final-countdown {
            font-family: 'Fira Sans', sans-serif;
            text-align: center;
            color: #434343;
            font-size: 3rem;
            display: inline-flex;
            width: 100%;
            align-content: center;
            position: absolute;
            left: 46%;
        }
        #the-final-countdown p {
            margin-bottom: 50px;
            padding-bottom: 50px;
        }
  </style>
  
  <script>
   $(function(){
	  setTimeout(function(){
		  $(".banner_container").css("visibility","visible");
		  $(".slide_wrap").css("visibility","visible");
	  }, 1000);
	   
	   
      var slideIndex = 0;
      showSlides();

      function showSlides() {
          var i;
          
          var slides = document.getElementsByClassName("slide");
          for (i = 0; i < slides.length; i++) {
             slides[i].style.display = "none";  
          }

          slideIndex++;
          if (slideIndex > slides.length) {slideIndex = 1}
          slides[slideIndex-1].style.display = "block";
          
          //////////////////////////
          
          /*
          var slides = $(".slide");
          slides.each(function(i,ele){
        	  $(ele).hide();
          });
          slideIndex++;
          if (slideIndex > slides.length) {slideIndex = 1}
          slides.eq(slideIndex-1).fadeIn('fast');*/
          
          setTimeout(showSlides, 5000); // Change image every 2 seconds
      }
   });
   
   function randSale() {
       var randSale=Math.floor(Math.random()*16)+10;
       return randSale;
   }
   setInterval(function time(){
       var d = new Date();
       var hours = 24 - d.getHours();
       var min = 60 - d.getMinutes();
       if((min + '').length == 1){
           min = '0' + min;
       }
       var sec = 60 - d.getSeconds();
       if((sec + '').length == 1){
           sec = '0' + sec;
       }
       jQuery('#the-final-countdown p').html("<i class='fa-solid fa-clock' style='color: #4c62d3; white-space: nowrap; margin-right: 10px; align-content: center; align-items: center'></i>"+hours+':'+min+':'+sec)
   }, 1000);
</script>
  
</head>
<body>
	<!-- 메인배너 -->
	<div class="banner_container" style="visibility: hidden;">
   
    <section class="visual">
    <div class = "slideshow-container">
        
        <div class="slide s_fade">
        <a href = "https://www.kurly.com/categories/825">
        <img alt = "" src = "image3/banner1.jpg">
        </a>
        </div>
        <div class="slide s_fade">
        <a href = "https://www.kurly.com/shop/main/html.php?htmid=event/kurly.htm&name=friend">
        <img alt = "" src = "image3/banner2.jpg">
        </a>
        </div>
        <div class="slide s_fade">
        <a href = "https://www.kurly.com/categories/139001" >
        <img alt = "" src = "image3/banner3.jpg">
        </a>
        </div>
        <div class="slide s_fade">
        <a href = "https://www.kurly.com/categories/863">
        <img alt = "" src = "image3/banner4.jpg">
        </a>
        </div>
   </div>
   </section>
   </div>
   
  
   <div>
   	<a href ="#"></a>
   </div>

  <!-- 네비게이터 -->

  <h1 class="title">이 상품 어때요 ?</h1>
  <a href="#" class="link" target="_blank"></a>
  
  <div id="container">
    <div class="slide_wrap slide1" style="visibility: hidden;">
   	<div class="flex-slide">
      <div class="slide_box">
        <div class="slide_list clearfix">
       	<% 
       	int startNum = (int)((Math.random()*29)); // 0 ~ 28
    	
    	ItemDao dao = new ItemDao();
    	List<ItemDto> list = dao.getList(startNum, 12);
    	
    	for(ItemDto dto: list){
    		
       	%>
          <div class="slide_content slide01">
          	<a href = "index.jsp?main=detail/detailView.jsp?item_num=<%=dto.getItem_num() %>" style="cursor: pointer;" class="godetail">
          	<img src="itemImg/<%=dto.getItem_img() %>" width="275"></a>
          	<button type = "button" class = "cartbtn" value="<%=dto.getItem_num()%>"><img src="image/cart.png" width="50";></button>
          	<a href = "#" class = "a" style = "text-decoration: none;">
          	<div style="text-align: left; margin-left: 4%; margin-right: 4%; margin-top: -15%;">
          	<p><%=dto.getItem_name()%></p>
          	<%
          	NumberFormat nf = NumberFormat.getInstance(Locale.KOREA);	
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
          	</a>
          </div>
          </div>
         <% 
    	}
          %>
          
          <!-- 임시해결법 -->
          <div class="slide_content slide01 slide_hide" style="width: 0px;"></div>
          <div class="slide_content slide01 slide_hide" style="width: 0px;"></div>
          <!-- 임시해결법 -->
        </div>
        <!-- // .slide_list -->
      </div>
     </div>
      <!-- // .slide_box -->
      <div class="slide_btn_box">
        <button type="button" class="slide_btn_prev" style = "top:-40px;"><img src="image/arrow_left.png" width="70";></button>
        <button type="button" class="slide_btn_next" style = "top:-40px;"><img src="image/arrow_right14.png" width="70"></button>
      </div>
      <!-- // .slide_btn_box -->
      <!-- // .slide_pagination -->
    </div>
    
     <div>
   		<section>
			<div class = "ban">
				<img src = "image3/그림1.jpg" width = "1300px;">
			</div>   		
   		</section>	
   </div>
    <br><br><br><br>
     <!-- 특가 아이템 창 -->
            <div>
                <div>
                    <h2>일일특가</h2>
                    <h5 style="color: gray;">24시간 한정 특가</h5>
                </div>

                <div id="the-final-countdown">
                    <p><%--<i class="fa-solid fa-clock" style="color: #4c62d3; white-space: nowrap; margin-right: 10px;"></i>--%>
                    </p>
                </div>

                <div class="timeSale-wrap">
                    <%
                        TimeSaleDao tdao=new TimeSaleDao();
                        List<String> random=tdao.randomItem();
                        NumberFormat nf=NumberFormat.getInstance(Locale.KOREA);
                        for(String arr:random) {
//                        System.out.println(arr);
                            ItemDto idto=tdao.selectItem(arr);
                            int randomPercent=(int)(Math.floor(Math.random()*25)+10);
                            int price= dao.getItemPrice(arr)*(100-randomPercent)/100;
                            tdao.updateSalePrice(price,arr);
                    %>
                    <div class="saleItem">
                        <a href="index.jsp?main=detail/detailView.jsp?item_num=<%=arr%>" style="color: black;"><img src="save-info-img/<%=idto.getItem_img()%>" width="275">
                            <h5 style="text-align: left;"><%=idto.getItem_name()%></h5>
                            <h4 style="text-align: left;"><span style="color: orangered; white-space: nowrap;"><%=randomPercent%>%&ensp;</span><%=nf.format(tdao.getPrice(arr))%>원&nbsp;<span style="color: gray; font-size: small;"><del><%=nf.format(dao.getItemPrice(arr))%>원</del></span></h4>
                        </a>
                    </div>
                    <% }  %>
                </div>
            </div>
             <br><br><br><br><br><br>
    

  
    <h2 class="title" >육류,달걀</h2>
    <h5 style=" color: gray;">단백질 보충 어때요??</h5>
    <a href="#" class="link" target="_blank"></a>
   	<div class="slide_wrap slide2">
      <div class="slide_box">
        <div class="slide_list clearfix">
       	<% 
    	ItemDao dao2 = new ItemDao();
    	List<ItemDto> list2 = dao.getListCategory("meat", 0, 8);
    	
    	for(ItemDto dto: list2){
    		
       	%>
          <div class="slide_content slide01" >
          	<a href = "index.jsp?main=detail/detailView.jsp?item_num=<%=dto.getItem_num() %>" style="cursor: pointer;" class="godetail">
          	<img src="itemImg/<%=dto.getItem_img() %>" width="275"></a>
          	<button type = "button" class = "cartbtn" value="<%=dto.getItem_num()%>"><img src="image/cart.png" width="50";></button>
          	<a href = "index.jsp?main=detail/detailView.jsp?item_num=<%=dto.getItem_num() %>" class = "a" style = "text-decoration: none;">
          	<div style="text-align: left; margin-left: 4%; margin-right: 4%; margin-top: -15%;" >
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
         <% 
    	}
          %>
          <!-- 임시해결법 -->
          <div class="slide_content slide01 slide_hide" style="width: 0px;"></div>
          <div class="slide_content slide01 slide_hide" style="width: 0px;"></div>
          <!-- 임시해결법 -->
        </div>
        <!-- // .slide_list -->
      </div>
      <!-- // .slide_box -->
      <div class="slide_btn_box">
        <button type="button" class="slide_btn_prev" style = "top:-40px;"><img src="image/arrow_left.png" width="70"></button>
        <button type="button" class="slide_btn_next" style = "top:-40px;"><img src="image/arrow_right14.png" width="70"></button>
      </div>
      <!-- // .slide_btn_box -->
      <!-- // .slide_pagination -->
    </div>
    <h2 class="title">해산물</h2>
    <h5 style=" color: gray;">신선한 해산물을 즐기세요</h5>
    <a href="#" class="link" target="_blank"></a>
   	<div class="slide_wrap slide3">
      <div class="slide_box">
        <div class="slide_list clearfix">
       	<% 
    	ItemDao dao3 = new ItemDao();
    	List<ItemDto> list3 = dao.getListCategory("seafood", 0, 8);
    	
    	for(ItemDto dto: list3){
    		
       	%>
          <div class="slide_content slide01">
          	<a href = "index.jsp?main=detail/detailView.jsp?item_num=<%=dto.getItem_num() %>" class = "a">
          	<img src="itemImg/<%=dto.getItem_img() %>" width="275"></a>
          	<button type = "button" class = "cartbtn" value="<%=dto.getItem_num()%>"><img src="image/cart.png" width="50";></button>
          	<a href = "index.jsp?main=detail/detailView.jsp?item_num=<%=dto.getItem_num() %>" class = "a" style = "text-decoration: none;">
          	<div style="text-align: left; margin-left: 4%; margin-right: 4%; margin-top: -15%;"  >
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
         <% 
    	}
          %>
          <!-- 임시해결법 -->
          <div class="slide_content slide01 slide_hide" style="width: 0px;"></div>
          <div class="slide_content slide01 slide_hide" style="width: 0px;"></div>
          <!-- 임시해결법 -->
        </div>
        <!-- // .slide_list -->
      </div>
      <!-- // .slide_box -->
      <div class="slide_btn_box">
        <button type="button" class="slide_btn_prev" style = "top:-40px;"><img src="image/arrow_left.png" width="70"></button>
        <button type="button" class="slide_btn_next" style = "top:-40px;"><img src="image/arrow_right14.png" width="70"></button>
      </div>
      <!-- // .slide_btn_box -->
      <!-- // .slide_pagination -->
    </div>
  <h2 class="title">과일</h2>
   <h5 style=" color: gray;">산뜻한 과일로 비타민 충전하세요</h5>
    <a href="#" class="link" target="_blank"></a>
   	<div class="slide_wrap slide4">
      <div class="slide_box">
        <div class="slide_list clearfix">
       	<% 
    	ItemDao dao4 = new ItemDao();
    	List<ItemDto> list4 = dao.getListCategory("fruit", 0, 8);
    	
    	for(ItemDto dto: list4){
    		
       	%>
          <div class="slide_content slide01">
          	<a href = "index.jsp?main=detail/detailView.jsp?item_num=<%=dto.getItem_num() %>" style="cursor: pointer;" class="godetail">
          	<img src="itemImg/<%=dto.getItem_img() %>" width="275"></a>
          	<button type = "button" class = "cartbtn" value="<%=dto.getItem_num()%>"><img src="image/cart.png" width="50";></button>
          	<a href = "index.jsp?main=detail/detailView.jsp?item_num=<%=dto.getItem_num() %>" class = "a" style = "text-decoration: none;">
          	<div style="text-align: left; margin-left: 4%; margin-right: 4%; margin-top: -15%;">
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
         <% 
    	}
          %>
          <!-- 임시해결법 -->
          <div class="slide_content slide01 slide_hide" style="width: 0px;"></div>
          <div class="slide_content slide01 slide_hide" style="width: 0px;"></div>
          <!-- 임시해결법 -->
        </div>
        <!-- // .slide_list -->
      </div>
      <!-- // .slide_box -->
      <div class="slide_btn_box">
        <button type="button" class="slide_btn_prev" style = "top:-40px;"><img src="image/arrow_left.png" width="70"></button>
        <button type="button" class="slide_btn_next" style = "top:-40px;"><img src="image/arrow_right14.png" width="70"></button>
      </div>
      <!-- // .slide_btn_box -->
      <!-- // .slide_pagination -->
    </div>
    
  
  <h2 class="title">베이커리</h2>
   <h5 style="font-size: 15pt; color: gray;">고소한 베이커리 추천드려요</h5>
    <a href="#" class="link" target="_blank"></a>
   	<div class="slide_wrap slide5">
      <div class="slide_box">
        <div class="slide_list clearfix">
       	<% 
    	ItemDao dao5 = new ItemDao();
    	List<ItemDto> list5 = dao.getListCategory("bakery", 0, 8);
    	
    	for(ItemDto dto: list5){
    		
       	%>
          <div class="slide_content slide01">
          	<a href = "index.jsp?main=detail/detailView.jsp?item_num=<%=dto.getItem_num() %>" style="cursor: pointer;" class="godetail">
          	<img src="itemImg/<%=dto.getItem_img() %>" width="275"></a>
          	<button type = "button" class = "cartbtn" value="<%=dto.getItem_num()%>"><img src="image/cart.png" width="50";></button>
          	<a href = "index.jsp?main=detail/detailView.jsp?item_num=<%=dto.getItem_num() %>" class = "a" style = "text-decoration: none;">
          	<div style="text-align: left; margin-left: 4%; margin-right: 4%; margin-top: -15%;">
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
         <% 
    	}
          %>
          <!-- 임시해결법 -->
          <div class="slide_content slide01 slide_hide" style="width: 0px;"></div>
          <div class="slide_content slide01 slide_hide" style="width: 0px;"></div>
          <!-- 임시해결법 -->
        </div>
        <!-- // .slide_list -->
      </div>
      <!-- // .slide_box -->
      <div class="slide_btn_box">
        <button type="button" class="slide_btn_prev" style = "top:-40px;"><img src="image/arrow_left.png" width="70"></button>
        <button type="button" class="slide_btn_next" style = "top:-40px;"><img src="image/arrow_right14.png" width="70"></button>
      </div>
      <!-- // .slide_btn_box -->
      <!-- // .slide_pagination -->
    </div>
    
</div>
  <!-- // .container -->

  <script> 
  	slide('.slide1');
  	slide('.slide2');
  	slide('.slide3');
  	slide('.slide4');
  	slide('.slide5');
  	
    function slide(root_name) {
      const root = document.querySelector(root_name);
      const slideList = root.querySelector('.slide_list');  // Slide parent dom
      const slideContents = root.querySelectorAll('.slide_content');  // each slide dom
      const slideBtnNext = root.querySelector('.slide_btn_next'); // next button
      const slideBtnPrev = root.querySelector('.slide_btn_prev'); // prev button
      const slideLen = slideContents.length-2;  // slide length
      const slideWidth = 1220; // slide width
      const slideSpeed = 500; // slide speed
      const startNum = 0; // initial slide index (0 ~ 4)
      
      slideList.style.width = slideWidth * (slideLen + 2) + "px";
      
      // Copy first and last slide
      let firstChild = slideList.firstElementChild;
      let lastChild = slideList.lastElementChild;
      let clonedFirst = firstChild.cloneNode(true);
      let clonedLast = lastChild.cloneNode(true);

      // Add copied Slides
      slideList.appendChild(clonedFirst);
      slideList.insertBefore(clonedLast, slideList.firstElementChild);

      // Add pagination dynamically

      slideList.style.transform = "translate3d(-" + (slideWidth)*0 + "px, 0px, 0px)";

      let curIndex = startNum; // current slide index (except copied slide)
      let curSlide = slideContents[curIndex]; // current slide dom
      
      for(var i=0;i<slideLen;i++){
    	  if(i<4){
    		  slideContents[i].classList.add('slide_show');
    	  }else{
    		  slideContents[i].classList.add('slide_hide');
    	  }
      }
      
      var next=0;

      /** Next Button Event */
      slideBtnNext.addEventListener('click', function() {
        if (curIndex < slideLen-4) {
        	if(curIndex<0){
          	  curIndex=0;
            }
            curIndex=curIndex+4;

            for(var n=curIndex-4;n<curIndex;n++){
          	  slideContents[n].classList.remove('slide_show');
          	  slideContents[n].classList.add('slide_hide');
            }
            
          slideList.style.transition = slideSpeed + "ms";
          slideList.style.transform = "translate3d(-" + (slideWidth * (next + 1)) + "px, 0px, 0px)";

          next=next+1;
          console.log(curIndex);
          
          for(var n=curIndex;n<curIndex+4;n++){
        	  slideContents[n].classList.remove('slide_hide');
        	  slideContents[n].classList.add('slide_show');
          }
        }
        else if (curIndex >= slideLen-4) {
        	curIndex = 0;
        	
            for(var n=slideLen-4;n<slideLen;n++){
            	  slideContents[n].classList.remove('slide_show');
            	  slideContents[n].classList.add('slide_hide');
            }
            
          setTimeout(function() {
            slideList.style.transition = "200ms";
            slideList.style.transform = "translate3d(-" + (slideWidth)*0 + "px, 0px, 0px)";
          }, slideSpeed);
          
          next=0;
          console.log(curIndex);
          
          for(var n=curIndex;n<curIndex+4;n++){
        	  slideContents[n].classList.remove('slide_hide');
        	  slideContents[n].classList.add('slide_show');
          }
        }
        
        curSlide = slideContents[curIndex];
      });

      /** Prev Button Event */
      slideBtnPrev.addEventListener('click', function() {
        if (curIndex > 0) {
            curIndex=curIndex-4;

            for(var n=curIndex;n<curIndex+4;n++){
          	  slideContents[n].classList.remove('slide_show');
          	  slideContents[n].classList.add('slide_hide');
            }
            
          slideList.style.transition = slideSpeed + "ms";
          slideList.style.transform = "translate3d(-" + slideWidth*(next-1) + "px, 0px, 0px)";
          
          next=next-1;
          
          console.log(curIndex);
          
          if(curIndex!=0){
	          for(var n=curIndex-4;n<curIndex+4;n++){
	        	  slideContents[n].classList.remove('slide_hide');
	        	  slideContents[n].classList.add('slide_show');
	          }
          }else{
        	  for(var n=0;n<4;n++){
            	  slideContents[n].classList.remove('slide_hide');
            	  slideContents[n].classList.add('slide_show');
              }
          }
        }
        else if (curIndex <= 0) {
            curIndex = slideLen-4;

            for(var n=0;n<4;n++){
          	  slideContents[n].classList.remove('slide_show');
          	  slideContents[n].classList.add('slide_hide');
            }
            
          setTimeout(function() {
            slideList.style.transition = "200ms";
            slideList.style.transform = "translate3d(-" + slideWidth*(slideLen/4-1) + "px, 0px, 0px)";
          }, slideSpeed);
          next= slideLen/4-1;
          console.log(curIndex);
          
          for(var n=curIndex;n<curIndex+4;n++){
        	  slideContents[n].classList.remove('slide_hide');
        	  slideContents[n].classList.add('slide_show');
          }
        }
        
        curSlide = slideContents[curIndex];
      });

    };
  </script>
  
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