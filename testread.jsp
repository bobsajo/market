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
<body>
    <h2>Test</h2>
    <button type="button" class="btn btn-success" id="testbtn">button</button>
    <div id="d"></div>
    <script type="text/javascript">
        $("#testbtn").click(function() {
            $.ajax({
                type:"get",
                url:"testjson.json",
                dataType:"json",
                success:function(data) {

                    var s="";

                    $.each(data,function(i,item) {
                       s+="<div class='alert alert-success'>";
                       s+="name: "+item.name+"<br>";
                       s+="score: "+item.score+"<br>";
                       s+="c: "+item.c+"<br>";
                       s+="</div>";
                    });
                    $("#d").html(s);
                },
                statusCode:{
                    404:function() {
                        alert("json 파일이 없어요");
                    },
                    500:function() {
                        alert("서버 오류... 코드를 다시 한 번 확인하세요");
                    }
                }
            });
        });

    </script>
</body>
</html>
