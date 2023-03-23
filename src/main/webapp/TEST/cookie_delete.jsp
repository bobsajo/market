<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	
	<%
	Cookie[] cookies = request.getCookies(); //client에서 쿠키를 받아옴
	
	if(cookies != null){
	    for(int i=0; i < cookies.length; i++){
	    	// 쿠키 유지시간은 0으로 설정
	        cookies[i].setMaxAge(0);
	        
	        // 변경된 쿠기 정보를 다시 클라이언트에 전달
	        response.addCookie(cookies[i]);
	    }
	}
	%>
</body>
</html>