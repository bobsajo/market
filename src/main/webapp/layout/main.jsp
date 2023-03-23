<%@page import="data.dto.ItemDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ItemDao"%>
<%@ page import="data.dao.TimeSaleDao" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="data.dto.TimeSaleDto" %>
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

    html, body { box-sizing: border-box; padding: 0; margin: 0; text-align: center;  min-height: 100vh; font-family: 'Gothic A1', sans-serif;}
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
    .slide_wrap { width: 1220px; padding-bottom: 40px;
     margin-left: 14.5%;}
    .slide_box { width: 1220px; margin:auto; overflow-x: hidden; text-align: center; }
    .slide_content { display: table; float: left; width: 305px; height: 300px;}
    
    .slide_btn_box {background:none; width:100%; height:100%; z-index:1; 
     position: relative; top: -300px;}
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
	
	
	<!-- 메인배너 -->
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
	}
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
	    text-align:center;
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
	
	.fade {
	  -webkit-animation-name: fade;
	  -webkit-animation-duration: 1.5s;
	  animation-name: fade;
	  animation-duration: 2.0s;
	}
	
	@-webkit-keyframes fade {
	  from {opacity: .1} 
	  to {opacity: 2}
	}
	
	@keyframes fade {
	  from {opacity: .2} 
	  to {opacity: 1}
	}
	
	.main_1>h1{
	     text-align : center;
	}
	
	.product_list{
	   display: flex;
	   float:left;
	   text-align:center;
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
    .timeSale-wrap {
        display: inline-flex;
    }
    .saleItem {
        margin-right: 18px;
    }

  #the-final-countdown {
      font-family: 'Gothic A1', sans-serif;
      text-align: center;
      color: dimgrey;
      font-size: 3rem;
      display: inline-flex;
      height: 50%;
      width: 40%;
  }
	
  </style>
  
  <script type="text/javascript">
   $(function(){
      
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
          
          /*
          var slides = $(".slide");
          slides.each(function(i,ele){
        	  $(ele).hide();
          });
          slideIndex++;
          if (slideIndex > slides.length) {slideIndex = 1}
          slides.eq(slideIndex-1).fadeIn('fast');*/
          
          setTimeout(showSlides, 2000); // Change image every 2 seconds
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
       jQuery('#the-final-countdown p').html(hours+':'+min+':'+sec)
   }, 1000);


</script>
  
</head>
<body>
	<!-- 메인배너 -->
	<div class="banner_container">
   
    <section class="visual">
    <div class = "slideshow-container">
        
        <div class="slide fade">
        <a href = "https://www.kurly.com/categories/825">
        <img alt = "" src = "image3/banner1.jpg">
        </a>
        </div>
        <div class="slide fade">
        <a href = "https://www.kurly.com/shop/main/html.php?htmid=event/kurly.htm&name=friend">
        <img alt = "" src = "image3/banner2.jpg">
        </a>
        </div>
        <div class="slide fade">
        <a href = "https://www.kurly.com/categories/139001" >
        <img alt = "" src = "image3/banner3.jpg">
        </a>
        </div>
        <div class="slide fade">
        <a href = "https://www.kurly.com/categories/863">
        <img alt = "" src = "image3/banner4.jpg">
        </a>
        </div>
   </div>
   </section>
   </div>
   
   <div>
   		<section>
			<div class = "ban">
				<img src = "image3/그림1.jpg" width = "1300px;">
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
    <div class="slide_wrap slide1">
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
              <a href = "index.jsp?main=detail/detailView.jsp?item_num=<%=dto.getItem_num() %>" class = "a">
          	<img src="itemImg/<%=dto.getItem_img() %>" width="275">
          	<p>상품명 : <%=dto.getItem_name()%></p>
          	<p>가격 : <%=dto.getItem_price() %>원</p>
          	</a>
          </div>
         <% 
    	}
          %>
        </div>
        <!-- // .slide_list -->
      </div>
     </div>
      <!-- // .slide_box -->
      <div class="slide_btn_box">
        <button type="button" class="slide_btn_prev"><img src="image/arrow_left.png" width="70"></button>
        <button type="button" class="slide_btn_next"><img src="image/arrow_right14.png" width="70"></button>
      </div>
      <!-- // .slide_btn_box -->
      <!-- // .slide_pagination -->
    </div>

      <!-- 특가 아이템 창 -->
        <div>
            <div>
            <h2>일일특가</h2>
            <h5 style="color: gray;">24시간 한정 특가</h5>
            </div>

            <div id="the-final-countdown">
                <i class="fa-solid fa-clock" style="color: #4c62d3; white-space: nowrap; margin-right: 10px;"></i>
                <p></p>
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
                    <img src="../save-info-img/<%=idto.getItem_img()%>" width="300">
                    <h5><%=idto.getItem_name()%></h5>
                    <h6><%=randomPercent%>%할인</h6>
                    <h4><%=nf.format(tdao.getPrice(arr))%>원</h4>
                </div>
                <% }  %>
            </div>
        </div>

   	<h2>카테고리별 상품 미리보기</h2>
    <h1 class="title">육류</h1>
    <a href="#" class="link" target="_blank"></a>
   	<div class="slide_wrap slide2">
      <div class="slide_box">
        <div class="slide_list clearfix">
       	<% 
    	List<ItemDto> list2 = dao.getListCategory("meat", 0, 8);
    	
    	for(ItemDto dto: list2){
    		
       	%>
            <div class="slide_content slide01">
                <a href = "index.jsp?main=detail/detailView.jsp?item_num=<%=dto.getItem_num() %>" class = "a">
                    <img src="itemImg/<%=dto.getItem_img() %>" width="275">
                    <p>상품명 : <%=dto.getItem_name()%></p>
                    <p>가격 : <%=dto.getItem_price() %>원</p>
                </a>
            </div>
         <% 
    	}
          %>
        </div>
        <!-- // .slide_list -->
      </div>
      <!-- // .slide_box -->
      <div class="slide_btn_box">
        <button type="button" class="slide_btn_prev"><img src="image/arrow_left.png" width="70"></button>
        <button type="button" class="slide_btn_next"><img src="image/arrow_right14.png" width="70"></button>
      </div>
      <!-- // .slide_btn_box -->
      <!-- // .slide_pagination -->
    </div>
    <h1 class="title">해산물</h1>
    <a href="#" class="link" target="_blank"></a>
   	<div class="slide_wrap slide3">
      <div class="slide_box">
        <div class="slide_list clearfix">
       	<% 
    	List<ItemDto> list3 = dao.getListCategory("seafood", 0, 8);
    	
    	for(ItemDto dto: list3){
    		
       	%>
          <div class="slide_content slide01">
              <a href = "index.jsp?main=detail/detailView.jsp?item_num=<%=dto.getItem_num() %>" class = "a">
          	<img src="itemImg/<%=dto.getItem_img() %>" width="275">
          	<p>상품명 : <%=dto.getItem_name()%></p>
          	<p>가격 : <%=dto.getItem_price() %>원</p>
          	</a>
          </div>
         <% 
    	}
          %>
        </div>
        <!-- // .slide_list -->
      </div>
      <!-- // .slide_box -->
      <div class="slide_btn_box">
        <button type="button" class="slide_btn_prev"><img src="image/arrow_left.png" width="70"></button>
        <button type="button" class="slide_btn_next"><img src="image/arrow_right14.png" width="70"></button>
      </div>
      <!-- // .slide_btn_box -->
      <!-- // .slide_pagination -->
    </div>
  <h1 class="title">과일</h1>
    <a href="#" class="link" target="_blank"></a>
   	<div class="slide_wrap slide4">
      <div class="slide_box">
        <div class="slide_list clearfix">
       	<% 
    	List<ItemDto> list4 = dao.getListCategory("fruit", 0, 8);
    	
    	for(ItemDto dto: list4){
    		
       	%>
          <div class="slide_content slide01">
              <a href = "index.jsp?main=detail/detailView.jsp?item_num=<%=dto.getItem_num() %>" class = "a">
          	<img src="itemImg/<%=dto.getItem_img() %>" width="275">
          	<p>상품명 : <%=dto.getItem_name()%></p>
          	<p>가격 : <%=dto.getItem_price() %>원</p>
          	</a>
          </div>
         <% 
    	}
          %>
        </div>
        <!-- // .slide_list -->
      </div>
      <!-- // .slide_box -->
      <div class="slide_btn_box">
        <button type="button" class="slide_btn_prev"><img src="image/arrow_left.png" width="70"></button>
        <button type="button" class="slide_btn_next"><img src="image/arrow_right14.png" width="70"></button>
      </div>
      <!-- // .slide_btn_box -->
      <!-- // .slide_pagination -->
    </div>
    
  
  <h1 class="title">베이커리</h1>
    <a href="#" class="link" target="_blank"></a>
   	<div class="slide_wrap slide5">
      <div class="slide_box">
        <div class="slide_list clearfix">
       	<% 
    	List<ItemDto> list5 = dao.getListCategory("bakery", 0, 8);
    	
    	for(ItemDto dto: list5){
    		
       	%>
          <div class="slide_content slide01">
              <a href = "index.jsp?main=detail/detailView.jsp?item_num=<%=dto.getItem_num() %>" class = "a">
              <img src="itemImg/<%=dto.getItem_img() %>" width="275">
          	<p>상품명 : <%=dto.getItem_name()%></p>
          	<p>가격 : <%=dto.getItem_price() %>원</p>
          	</a>
          </div>
         <% 
    	}
          %>
        </div>
        <!-- // .slide_list -->
      </div>
      <!-- // .slide_box -->
      <div class="slide_btn_box">
        <button type="button" class="slide_btn_prev"><img src="image/arrow_left.png" width="70"></button>
        <button type="button" class="slide_btn_next"><img src="image/arrow_right14.png" width="70"></button>
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
      const slideLen = slideContents.length;  // slide length
      const slideWidth = 1220; // slide width
      const slideSpeed = 300; // slide speed
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
      
      var next=0;

      /** Next Button Event */
      slideBtnNext.addEventListener('click', function() {
        if (curIndex < slideLen-4) {
          slideList.style.transition = slideSpeed + "ms";
          slideList.style.transform = "translate3d(-" + (slideWidth * (next + 1)) + "px, 0px, 0px)";

          if(curIndex<0){
        	  curIndex=0;
          }
          curIndex=curIndex+4;
          next=next+1;
          console.log(curIndex);
        }
        else if (curIndex >= slideLen-4) {
          setTimeout(function() {
            slideList.style.transition = "1000ms";
            slideList.style.transform = "translate3d(-" + (slideWidth)*0 + "px, 0px, 0px)";
          }, slideSpeed);
          curIndex = 0;
          next=0;
          console.log(curIndex);
        }
        
        curSlide = slideContents[curIndex];
      });

      /** Prev Button Event */
      slideBtnPrev.addEventListener('click', function() {
        if (curIndex > 0) {
          slideList.style.transition = slideSpeed + "ms";
          slideList.style.transform = "translate3d(-" + slideWidth*(next-1) + "px, 0px, 0px)";
          
          curIndex=curIndex-4;
          
          next=next-1;
          
          console.log(curIndex);
        }
        else if (curIndex <= 0) {
          setTimeout(function() {
            slideList.style.transition = "1000ms";
            slideList.style.transform = "translate3d(-" + slideWidth*(slideLen/4-1) + "px, 0px, 0px)";
          }, slideSpeed);
          curIndex = slideLen-4;
          next= slideLen/4-1;
          console.log(curIndex);
        }
        
        curSlide = slideContents[curIndex];
      });

    }
  </script>
</body>
</html>