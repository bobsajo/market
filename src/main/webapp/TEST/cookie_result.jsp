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

System.out.print("쿠키 출력: ");
Cookie[] cookies = request.getCookies(); //client에서 쿠키를 받아옴
Cookie cookie;

if(cookies!=null){
    for(int i=0;i<cookies.length;i++){
    	if(cookies[i].getName().equals("recent_item")){
    		if(cookies[i].getValue().equals("")){
        		System.out.println(cookies[i].getValue());
    		}else{
        		System.out.println(cookies[i].getValue());
    		}
        }
    	

		System.out.println(cookies[i].getValue());
    }
}
%>
</body>
</html>