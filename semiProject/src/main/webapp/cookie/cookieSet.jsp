<%@page import="data.dao.ItemDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String item_num=request.getParameter("item_num");

System.out.print("쿠키 실행: ");
Cookie[] cookies = request.getCookies(); //client에서 쿠키를 받아옴
Cookie cookie;

ItemDao dao = new ItemDao();
item_num = dao.getItemData(item_num).getItem_img();

if(cookies!=null){
    for(int i=0;i<cookies.length;i++){
       if(cookies[i].getName().equals("recent_item")){
    	   String s = cookies[i].getValue();
    	   String [] arr = s.split("&");
    	   
    	   if(arr.length>=3){
    		   String vlaue=arr[1] + "&" + arr[2] + "&" + item_num;
               cookie=new Cookie("recent_item",vlaue);
               response.addCookie(cookie);
               cookie.setMaxAge(60*60*8);  
    	   }
    	   
    	   else if(cookies[i].getValue().equals("")){
               String vlaue=item_num;
               cookie=new Cookie("recent_item",vlaue);
               response.addCookie(cookie);
               cookie.setMaxAge(60*60*8); 
               //System.out.println(cookies[i].getValue());
          }else{
             String vlaue=cookies[i].getValue()+"&"+item_num;
               cookie=new Cookie("recent_item",vlaue);
               response.addCookie(cookie);
               cookie.setMaxAge(60*60*8); 
               //System.out.println(cookies[i].getValue());
          }
        }
       
    }
}
%>