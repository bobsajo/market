<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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