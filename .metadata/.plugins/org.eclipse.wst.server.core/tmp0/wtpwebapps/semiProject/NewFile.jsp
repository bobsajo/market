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
    Cookie[] cookies = request.getCookies(); //client���� ��Ű�� �޾ƿ�

    if(cookies != null){
        for(int i=0; i < cookies.length; i++){
            // ��Ű �����ð��� 0���� ����
            cookies[i].setMaxAge(0);

            // ����� ��� ������ �ٽ� Ŭ���̾�Ʈ�� ����
            response.addCookie(cookies[i]);
        }
    }
    %>
</body>
</html>