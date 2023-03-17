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
    
    <style type="text/css">
    	.category{
    		background-color: white;
    		width: 250px;
    	}
    	
    	.sub>li{
    		background-color: lightgray;
    		width: 250px;
    		cursor: pointer;
    	}
    	
    	.sub>li:hover{
    		background-color: gray;
    	}
    	
    	.menu{
    		width: 800px;
    	}
    	
    	.menu>li{
    		float: left;
    		margin-left: 15px;
    	}
    </style>
    
    <script type="text/javascript">
       $(function(){
          $(".sub").hide();
          
          $(".category").mouseover(function(){
        	  //alert("클릭")
        	  $(".sub").show();
          });
          
          $(".category").mouseout(function(){
        	  $(".sub").hide();
          })
       
       });
    </script>
</head>
<body>
   <!--카테고리바-->
         <div class="nav">
            <ul class="menu">
               <li class="category">
               		<a href="#">
               		<b><img src="image/ico_gnb_all_off.png" alt="카테고리 아이콘">&ensp;&ensp;전체
                        카테고리</b></a>
                  <ul class="sub">
                     <li><a href="">&ensp;&ensp;과일·견과·쌀
                     </a></li>
                     <li><a href="">&ensp;&ensp;수산·해산·건어물
                     </a></li>
                     <li><a href="">&ensp;&ensp;정육·계란
                     </a></li>
                     <li><a href="#">&ensp;&ensp;간식·과자·떡
                     </a></li>
                  </ul>
             	</li>
             	
             	<li>
             		신상품
             	</li>
             </ul>
          </div>    
               

               
</body>
</html>















