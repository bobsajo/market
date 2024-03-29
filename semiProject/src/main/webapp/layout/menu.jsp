<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="menu/css/font-awesome.css">
		<link rel="stylesheet" type="text/css" href="menu/css/menu.css">
		<link rel="stylesheet" href="iconSource/all.min.css">	
		<script src="iconSource/all.min.js"></script>
		<script type="text/javascript" src="menu/js/jquery.js"></script>
		<script type="text/javascript" src="menu/js/function.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<style type="text/css">
#menu {

    height: 50px;
    background: white;
	text-align: center;
	margin-left: 7%;
	
}

.main1 {

    width: 800px;
    height: 100%;
    margin: 0 auto;

}

.main1>li {

    float: left;
    width: 25%;
    line-height: 50px;
    text-align: center;
    position: relative;
	list-style: none;
}

.main1>li:hover .main2 {

    left: 0;

}

.main1>li a {

    display: block;
	color: black;
	
}

.main1>li a:hover {

    background: white;
    color: #4B62D3;
}

.main2 {

    position: absolute;
    top: 50px;
    left: -9999px;
    width: 120%;
    
}

.main2>li {

    position: relative;
    list-style: none;

}

.main2>li:hover .main3 {

    left: 100%;

}

.main2>li a, .main3>li a {

    border-radius: 10px;
    margin: 10px;
    
}

.main3 {

    position: absolute;
    top: 0;
    background: ;
    width: 80%;
    left: -9999px;
    /*left: 100%;*/
    /*display: none;*/

}

.main3>li a:hover {

    background: white;
    color: black;

}
</style>
</head>

<body>
 
	<div id="menu">

    <ul class="main1">

        <li><a href=""><img alt="카데고리 아이콘" src="image/menuicon.png" style="width: 30px; margin-bottom: 5px;">카테고리</a>

            <ul class="main2" style="z-index: 100; background: white; text-align: left;">

                <li><a href="index.jsp?main=layout/categoryList.jsp?category=fruit"><i class="fa-solid fa-lemon"></i>&nbsp;&nbsp;과일·견과·쌀</a></li>
                
                <li><a href="index.jsp?main=layout/categoryList.jsp?category=seafood"><i class="fa-solid fa-fish"></i>&nbsp;&nbsp;수산·해산·건어물</a></li>
                
                <li><a href="index.jsp?main=layout/categoryList.jsp?category=meat"><i class="fa-solid fa-drumstick-bite"></i>&nbsp;&nbsp;정육·계란</a></li>
                
                <li><a href="index.jsp?main=layout/categoryList.jsp?category=bakery"><i class="fa-solid fa-cake-candles"></i>&nbsp;&nbsp;베이커리·치즈·델리</a> </li>
            </ul>

        </li>

        <li><a href="index.jsp?main=layout/sinSang.jsp">신상품</a>

            <ul class="main2">

            </ul>

        </li>

        <li><a href="index.jsp?main=layout/best.jsp">베스트</a>

            <ul class="main2">

            </ul>

        </li>
        
    </ul>

</div>
</body>
</html>