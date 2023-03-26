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
    <script type="text/javascript">
        function test() {
            var pass=document.getElementById('searchPassUpdate').value;
            var pass2=document.getElementById('searchPassUpdate2').value;

            if(pass!==pass2) {
                return false;
            } else {
                return true;
            }

        }
    </script>
</head>
<body>
    <div class="search-input-wrap">
        <div align="center"><h2><b>비밀번호 변경</b></h2></div>
        <form action="login/searchPassUpdate.jsp">
            <h4>비밀번호</h4>
            <input type="password" name="searchPassUpdate" id="searchPassUpdate" style="width: 300px; height: 50px; border-radius: 7px; border: 1px solid gray;">
            <h4>비밀번호 확인</h4>
            <input type="password" name="searchPassUpdate2" id="searchPassUpdate2" style="width: 300px; height: 50px; border-radius: 7px; border: 1px solid gray;">
            <script type="text/javascript">
                var yes=test();
                if(!yes) {
                    document.getElementById('passBtn').disabled=true;
                }
            </script>
            <div><button type="submit" id="passBtn" style="width: 300px; background-color: #4B62D3; height: 50px; border-radius: 7px; border:0px; color: white;">확인</button></div>
        </form>
    </div>
</body>
</html>
    