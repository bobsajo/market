<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap');

body{
    font-family: 'Gothic A1', sans-serif;
}

div.includewrap {
	width: 100%;
	/* margin:0 auto; */
}

div.menu {
	z-index: 100;
}

div.main {
	z-index: -1;
}

/* div.mainbanner{
/*    text-align:center; 
   position:absolute;
   top:20%;
}*/

/* div.layout{
   border: 0px solid gray;
   position: absolute;
   display:inline-flex;
} */
.btns {
	display: flex;
	position: fixed;
	right: .4rem;
	bottom: .4rem;
}

.btns>div {
	padding: .6rem 1.5rem;
	background: #111;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	border-radius: 5px;
	transition: .2s;
	color: #fff;
	margin-right: .4rem;
}

.moveTopBtn:hover {
	color: #000;
	background: #febf00;
}

.sidebar {
	margin: 0 auto;
	width: 130px;
	height: 250px;
	background-color: white;
	position: fixed;
	top: 200px;
	right: 30px;
	overflow-x: hidden;
	border-radius: 10px;
	padding-top: 20px;
	line-height: 20%;
	
	
}
.preshow{
	visibility: visible;
	height:  100px;
	
}

.prehide{
	visibility: hidden;
	height:  0px;
}

.sidebar{
	z-index: 999;
}

a{
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}

</style>
<script type="text/javascript">
$(function(){
	   $.ajax({
	      type:"get",
	      dataType:"html",
	      url:"cookie/cookieCreate.jsp",
	      success:function(){
	         console.log("실행");
	      }
	   })
	})

</script>
</head>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");

   String mainPage = "layout/main.jsp";

	//메인페이지인지 확인하는 변수(0이면 메인페이지, 1이면 다른페이지)
   int ismain=0;
   
   

   if(request.getParameter("main")!=null)
   {
      mainPage = request.getParameter("main");
      ismain=1;   //다른페이지일 경우
   }
   String root = request.getContextPath();
   
%>

<body>
	<div class="includewrap">

		<div class="layout title">
			<jsp:include page="layout/title2.jsp" />
		</div>

		<div class="layout menu">
			<jsp:include page="layout/menu.jsp" />
		</div>

		<div class="layout main">
			<%--  <jsp:include page = "layout/main.jsp"/> --%>
			<jsp:include page="<%=mainPage %>" />
		</div>

		<div class="layout footer">
			<jsp:include page="layout/footer.jsp" />
		</div>

		<div class="btns">
         <div class="moveTopBtn" style = "background-color:white;">
            <img src = "image/top.png" alt = "" style = "width: 80px; height: 80px; margin-right: 10px; margin-bottom:10px;">
         </div>
      </div>
	</div>

	<script>
	const $topBtn = document.querySelector(".moveTopBtn");

	//버튼 클릭 시 맨 위로 이동
	$topBtn.onclick = () => {
	window.scrollTo({ top: 0, behavior: "smooth" });  
	}
	
</script>

<!-- 사이드바 -->
<div class="sidebar_right">
	<div class="sidebar" style="border: 1px solid #4B62D3;">
		<h2 class=""
			style="font-size: 15px; font-weight: bold; text-align: center;">
			최근 본 상품<hr style="color: #4B62D3;">
		</h2>
		<button
			class = "btnup" style="border: none; margin: 0 auto; justify-content: center; display: flex; background: #fff; align-items: center;">
			<span class="glyphicon glyphicon-chevron-up"></span>
		</button>
		<div class="preimg_content" style="text-align: center;">
		
		
		
		
		<!-- <div class = "preshow preimg1">
		<a><img src="image/goods01.jpg" style="height: 100%;"></a>
		</div>
		<div class = "prehide">
		<a><img src="image/goods02.jpg" style="height: 100%;"></a>
		</div>
		<div class = "prehide preimg3">
		<a><img src="image/goods03.jpg" style="height: 100%;"></a>
		</div> -->
		
		
		</div>
		
		<button
			class = "btndown" style="border: none; margin: 0 auto; justify-content: center; display: flex; background: #fff; align-items: center;">
			<span class="glyphicon glyphicon-chevron-down"></span>
		</button>
		
	</div>

<script type="text/javascript">
	//ajax로 최근에 읽은 상품 읽어오기
	$.ajax({
		type:"post",
		dataType:"json",
		url:"cookie/cookieGet.jsp",
		success:function(res){
				var html = "";
				
				var img_arr = res.reverse();
				
				$.each(img_arr,function(i,ele){
		            //console.log(ele.item);
		            if(i==0&&i<res.length-1){
			            //첫번째
		               html+="<div class = 'preshow preimg1'>";
		               html+="<a href='index.jsp?main=detail/detailView.jsp?item_num="+ele.item_num
            		   		+"'><img src='itemImg/"+ele.item_img+"' style='height: 100%;'></a>"
		               html+="</div>";
		            }else if(i==0){
		            	//첫번째이자 마지막
		            	if(ele.item_num!=""){
			               html+="<div class = 'preshow preimg1 preimg3'>";
			               html+="<a href='index.jsp?main=detail/detailView.jsp?item_num="+ele.item_num
			            		   +"'><img src='itemImg/"+ele.item_img+"' style='height: 100%;'></a>"
			               html+="</div>";
		            	}else{
		            		html+="<div class = 'preshow preimg1 preimg3'>";
				            html+="</div>";
		            	}
		            }else if(i<res.length-1){
		            	//가운데
		               html+="<div class = 'prehide'>";
		               html+="<a href='index.jsp?main=detail/detailView.jsp?item_num="+ele.item_num
            		   		+"'><img src='itemImg/"+ele.item_img+"' style='height: 100%;'></a>"
		               html+="</div>";
		            }else if(i=res.length-1){
		            	//마지막
		               html+="<div class = 'prehide preimg3'>";
		               html+="<a href='index.jsp?main=detail/detailView.jsp?item_num="+ele.item_num
            		   		+"'><img src='itemImg/"+ele.item_img+"' style='height: 100%;'></a>"
		               html+="</div>";
		            }
		         });
		         
		         $(".preimg_content").html(html);
		}
	});

	$(".btnup").click(function(){
		var cur=$(".preshow");
		
		if(!cur.hasClass("preimg1")){
			var pre=$(".preshow").prev();
			
			cur.addClass("prehide");
			pre.addClass("preshow");
			pre.removeClass("prehide");
			cur.removeClass("preshow");	
		}
		
	});
	
	$(".btndown").click(function(){
		var cur=$(".preshow");
		
		if(!cur.hasClass("preimg3")){
			var next=$(".preshow").next();
			
			cur.addClass("prehide");
			next.addClass("preshow");
			next.removeClass("prehide");
			cur.removeClass("preshow");	
		}
		
	});
	
	var scrollPosition = window.scrollY || document.documentElement.scrollTop;
	console.log(scrollPosition);
	//최초 실행시 스크롤 위치가 위에 있으면 사이드바 없애기
	   <%
	   if(ismain==0){%>
	      if(scrollPosition<300){
	          //$(".sidebar").css("margin-top","300px");
	          $(".sidebar").hide();
	       }   
	   <%}%>
	      if(scrollPosition<500){
	          $(".moveTopBtn").fadeOut("slow");
	       }
	   //스크롤 이벤트(사이드바)
	   window.addEventListener('scroll', function(){
	      //console.log('123');
	      scrollPosition = window.scrollY || document.documentElement.scrollTop;
	      
	      <%if(ismain==0){%>
	         if(scrollPosition<300){
	               //$(".sidebar").css("margin-top","300px");
	               $(".sidebar").hide();
	           }else{
	                //$(".sidebar").css("margin-top","0px");
	                $(".sidebar").show();
	           }
	      <%}%>
	      if(scrollPosition<500){
              $(".moveTopBtn").fadeOut("slow");
           }else{
              $(".moveTopBtn").fadeIn("fast");
           }
	      
	   });

	</script>
</div>
<!-- 사이드바 마지막 -->	
	
</body>
</html>