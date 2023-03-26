<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Title</title>
 <link rel="stylesheet" href="/login/searchIdForm.css">
 
</head>
<body>
    <div class="search-id-wrap">
    <div class="smain">
    <div align="center"><h2><b>아이디 찾기</b></h2></div>
    <div align="center">
        <span>이메일 인증</span>
        </div>
    </div>
    <div class="search-input-wrap">
        <form action="login/searchIdAction.jsp">
            <h4>이름</h4>
            <input type="text" name="searchIdName" style="width: 300px; height: 50px; border-radius: 7px; border: 1px solid gray;">
            <h4>이메일</h4>
            <input type="text" name="searchIdEmail" style="width: 300px; height: 50px; border-radius: 7px; border: 1px solid gray;">
            <div><button type="submit" style="width: 300px; background-color: #4B62D3; height: 50px; border-radius: 7px; border:0px; color: white;">확인</button></div>
        </form>
    </div>
    </div>
</body>
</html>
    