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
    
    
    

</body>
</html>