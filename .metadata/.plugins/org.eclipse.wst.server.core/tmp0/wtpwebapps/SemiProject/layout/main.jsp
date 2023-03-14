<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.container{
width: 100%;
}

.visual {
   display: block;
    justify-content: center;
    float:left;
    margin: 0 auto;
   text-align: center;
}

.visual > .slide{
    height: 370px;
    /*margin-left: 300px;*/
    margin-bottom: 40px;
    width: 100%;
     display: none;
}
.visual > img {
vertical-align: middle;
}
.visual > .slideshow-container {
 
  height: 500px;
  margin-left:100px;
  margin-right:100px;
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

.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 3.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
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
  	margin: 5px;
  	
}


</style>
<script>
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
          setTimeout(showSlides, 3000); // Change image every 2 seconds
      }
   });
</script>
</head>
<body>

<div class="container">
   
    <section class="visual">
       <div class = "slideshow-container">
        <div class="slide fade">
        <img alt = "" src = "../image3/banner1.jpg">
        </div>
        <div class="slide fade">
        <img alt = "" src = "../image3/banner2.jpg">
        </div>
        <div class="slide fade">
        <img alt = "" src = "../image3/banner3.jpg">
        </div>
        <div class="slide fade">
        <img alt = "" src = "../image3/banner4.jpg">
        </div>
        <div class="slide fade">
        <img alt = "" src = "../image3/banner5.jpg">
        </div>
        </div>
    </section>
</div>    
    <div style="clear: both;"></div>
  
    <section class="goods">
         <div class="main_type1">
                <div class="main_1">
                    <h1>이 상품 어때요?</h1>
                </div>
                <div class="product_list">
                    <a href = "#">
                    	<img src="../itemImg/0.jpg"
                    	 width="200px" height="300px">
                        <p>블루베리</p>
                        <p>5600원</p>
                    </a>
                    <a href = "#">
                        <img src="../itemImg/1.jpg"
                         width="200px" height="300px">
                        <p>바나나</p>
                        <p>8000원</p>
                    </a>
                    <a href = "#"><img src="../itemImg/2.jpg"
                        width="200px" height="300px">
                        <p>딸기</p>
                        <p>10150원</p>
                    </a>
                    <a class="list"><img src="../itemImg/3.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                     <a href = "#"><img src="../itemImg/4.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                     <a href = "#"><img src="../itemImg/5.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                     <a href = "#"><img src="../itemImg/6.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                     <a href = "#"><img src="../itemImg/7.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                     <a href = "#"><img src="../itemImg/8.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                     <a href = "#"><img src="../itemImg/9.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                     <a href = "#"><img src="../itemImg/10.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                     <a href = "#"><img src="../itemImg/11.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                     <a href = "#"><img src="../itemImg/12.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                     <a href = "#"><img src="../itemImg/13.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                     <a href = "#"><img src="../itemImg/14.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                     <a href = "#"><img src="../itemImg/15.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                     <a href = "#"><img src="../itemImg/16.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                     <a href = "#"><img src="../itemImg/17.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                     <a href = "#"><img src="../itemImg/18.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                     <a href = "#"><img src="../itemImg/19.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                     <a href = "#"><img src="../itemImg/20.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                     <a href = "#"><img src="../itemImg/21.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                    <a href = "#"><img src="../itemImg/22.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                    <a href = "#"><img src="../itemImg/23.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                    <a href = "#"><img src="../itemImg/24.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                    <a href = "#"><img src="../itemImg/25.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                    <a href = "#"><img src="../itemImg/26.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                    <a href = "#"><img src="../itemImg/27.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                    <a href = "#"><img src="../itemImg/28.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                    <a href = "#"><img src="../itemImg/29.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                    <a href = "#"><img src="../itemImg/30.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                    <a href = "#"><img src="../itemImg/31.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                    <a href = "#"><img src="../itemImg/32.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                    <a href = "#"><img src="../itemImg/33.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                    <a href = "#"><img src="../itemImg/34.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                    <a href = "#"><img src="../itemImg/35.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                    <a href = "#"><img src="../itemImg/36.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                    <a href = "#"><img src="../itemImg/37.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                    <a href = "#"><img src="../itemImg/38.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                    <a href = "#"><img src="../itemImg/39.jpg"
                            width="200px" height="300px">
                        <p>사과</p>
                        <p>15000원</p>
                    </a>
                </div>
            </div>
            
    </section>
    

</body>
</html>