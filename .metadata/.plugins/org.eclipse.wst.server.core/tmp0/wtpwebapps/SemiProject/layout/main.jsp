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
  <title>Slide Project</title>
  
  <style>
    html, body { box-sizing: border-box; padding: 0; margin: 0; text-align: center; }
    *, *:before, *:after { box-sizing: inherit; }
    .clearfix:after { content: ''; display: block; clear: both; float: none; }
    .title { margin-bottom: 0; text-align: center; font-size: 30px; color: #333; }
    .link, .link:visited { display: inline-block; margin: 20px 0; color: #555; text-decoration: none; font-weight: bold; }
    .link:hover, .link:focus { color: #9fd6c2; }
    /* container - body */
    #container { width: 1300px; margin: auto; }
    .slide_wrap { position: relative; width: 1220px; margin:0 auto; padding-bottom: 30px;}
    .slide_box { width: 100%; margin:auto; overflow-x: hidden; text-align: center;}
    .slide_content { display: table; float: left; width: 305px; height: 300px;}
    
    .slide_btn_box > button { position: absolute; top: 50%; margin-top: -45px; width: 60px; height: 60px; font-size: 16px;  background: none; border: 0px; cursor: pointer; }
    .slide_btn_box > .slide_btn_prev { top:190px; left: -30px; }
    .slide_btn_box > .slide_btn_next { top:190px; right: -10px; }
    
    .slide_pagination { position: absolute; left: 50%; bottom: 0; list-style: none; margin: 0; padding: 0; transform: translateX(-50%); }
    .slide_pagination .dot { display: inline-block; width: 15px; height: 15px; margin: 0 5px; overflow: hidden; background: #ddd; border-radius: 50%; transition: 0.3s; }
    .slide_pagination .dot.dot_active { background: #333; }
    .slide_pagination .dot a { display: block; width: 100%; height: 100%; }
    
    .a{
  	text-decoration: none;
	}
  </style>
  
</head>
<body>
  <h1 class="title">이 상품 어때요 ?</h1>
  <a href="#" class="link" target="_blank"></a>
  
  <div id="container">
    <div class="slide_wrap">
      <div class="slide_box">
        <div class="slide_list clearfix">
       	<% 
       	int startNum = (int)((Math.random()*29)); // 0 ~ 28
    	
    	ItemDao dao = new ItemDao();
    	List<ItemDto> list = dao.getList(startNum, 12);
    	
    	for(ItemDto dto: list){
    		
       	%>
          <div class="slide_content slide01">
          	<a href = "#" class = "a">
          	<img src="../itemImg/<%=dto.getItem_img() %>" width="275">
          	<p><%=dto.getItem_name()%></p>
          	<p><%=dto.getPrice() %></p>
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
        <button type="button" class="slide_btn_prev"><img src="../image/arrow_left.png" width="70"></button>
        <button type="button" class="slide_btn_next"><img src="../image/arrow_right14.png" width="70"></button>
      </div>
      <!-- // .slide_btn_box -->
      <!-- // .slide_pagination -->
    </div>
    <!-- // .slide_wrap -->
  </div>
  <!-- // .container -->

  <script>
    (function () {
      const slideList = document.querySelector('.slide_list');  // Slide parent dom
      const slideContents = document.querySelectorAll('.slide_content');  // each slide dom
      const slideBtnNext = document.querySelector('.slide_btn_next'); // next button
      const slideBtnPrev = document.querySelector('.slide_btn_prev'); // prev button
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

    })();
  </script>
</body>
</html>