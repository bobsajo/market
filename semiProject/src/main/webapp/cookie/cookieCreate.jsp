<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
Cookie[] cookies = request.getCookies(); //client에서 쿠키를 받아옴
Cookie cookie;

if(cookies==null){
   System.out.println("쿠키생성");
   cookie=new Cookie("recent_item","");
   response.addCookie(cookie);
   cookie.setMaxAge(60*60*8); 
}

boolean isCookie=false;

if(cookies!=null){
    for(int i=0;i<cookies.length;i++){
        if(cookies[i].getName().equals("recent_item")){
           isCookie=true;
        }
    }
    
    if(!isCookie){
       System.out.println("쿠키생성");
       cookie=new Cookie("recent_item","");
       cookie.setMaxAge(60*60*8); 
       response.addCookie(cookie);
    }
}

%>
