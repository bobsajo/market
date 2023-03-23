<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>Insert title here</title>

<%
Cookie[] cookies = request.getCookies(); //client에서 쿠키를 받아옴
Cookie cookie;

if(cookies==null){
	System.out.println("쿠키생성");
	cookie=new Cookie("recent_item","");
	response.addCookie(cookie);
	cookie.setMaxAge(60*60*8); 
}

boolean isCookie=false;

if(cookies!=null){
    for(int i=0;i<cookies.length;i++){
        if(cookies[i].getName().equals("recent_item")){
        	isCookie=true;
        }
    }
    
    if(!isCookie){
    	System.out.println("쿠키생성");
    	cookie=new Cookie("recent_item","");
    	cookie.setMaxAge(60*2); 
    	response.addCookie(cookie);
    }
}

%>
</head>
<body>

<a href="cookie_get.jsp">이동</a>

</body>
</html>