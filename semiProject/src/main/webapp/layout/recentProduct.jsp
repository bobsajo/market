<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	
	<%
	 String item_num = request.getParameter("item_num");
	 Cookie[] cookies = request.getCookies(); //client에서 쿠키를 받아옴
	 Cookie cookie;

	if(cookies==null){
    System.out.println("쿠키생성");
    cookie=new Cookie("recent_item","");
    response.addCookie(cookie);
    cookie.setMaxAge(60608); 
	}

	boolean isCookie=false;

	if(cookies!=null){
    for(int i=0;i<cookies.length;i++){
    	if(item_num!=null){
    		
	        if(cookies[i].getName().equals("recent_item")){
	            isCookie=true;
	
	            if(cookies[i].getValue().equals("")){
	                String vlaue= item_num;
	                cookie=new Cookie("recent_item",vlaue);
	                response.addCookie(cookie);
	                System.out.println(cookies[i].getValue());
	            }else{
	                String vlaue=cookies[i].getValue()+"&"+item_num;
	                cookie=new Cookie("recent_item",vlaue);
	                response.addCookie(cookie);
	                System.out.println(cookies[i].getValue());
	            }
	        }
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
	
	
</body>
</html>