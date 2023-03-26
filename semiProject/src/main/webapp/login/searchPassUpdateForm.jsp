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
    <link rel="stylesheet" href="login/searchPassUpdateForm.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Title</title>
</head>
<%
    String member_num=request.getParameter("member_num");
    System.out.println(member_num);
%>
<body>
    <div class="search-input-wrap">
    <div class="search-id-inner">
        <div align="center"><h2><b>비밀번호 변경</b></h2></div>
        <form action="login/searchPassUpdate.jsp" name="frm">
            <input type="hidden" name="member_num" value="<%=member_num%>">
            <h4>비밀번호</h4>
            <input type="password" name="searchPassUpdate" id="searchPassUpdate" style="width: 300px; height: 50px; border-radius: 7px; border: 1px solid gray;">
            <h4>비밀번호 확인</h4>
            <input type="password" name="searchPassUpdate2" id="searchPassUpdate2" style="width: 300px; height: 50px; border-radius: 7px; border: 1px solid gray;">
            <div><button type="submit" id="passBtn" onclick="test()" style="width: 300px; background-color: #4B62D3; height: 50px; border-radius: 7px; border:0px; color: white;">확인</button></div>
        </form>
    </div>
    </div>
    <script type="text/javascript">
        var pass=document.getElementById('searchPassUpdate');
        var pass2=document.getElementById('searchPassUpdate2');

        function test() {
            if(pass.value!=pass2.value) {
                pass2.setCustomValidity("비밀번호가 일치하지 않습니다");
            } else {
                pass2.setCustomValidity('');
            }

            pass.onchange=test;
            pass2.onkeyup=test;
        }
    </script>
</body>
</html>
    