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
</head>
<%
    String member_id=request.getParameter("member_id");
%>
<body style="text-align: center;">
    <%
        if(member_id.equals("")) { %>
            <script>
                alert("일치하는 회원정보가 없습니다.");
                history.back();
            </script>
       <% } else { %>
            아이디는 <%=member_id%> 입니다.
        <% } %>
</body>
</html>
    