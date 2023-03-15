<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.ReviewDao" %>
<%@ page import="dto.ReviewDto" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="dao.MemberDao" %>
<%@ page import="dao.ItemDao" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");

    String review_num=request.getParameter("review_num");
//    System.out.println(review_num);

    ReviewDao dao=new ReviewDao();
    ReviewDto dto=dao.getData(review_num);
    MemberDao mdao=new MemberDao();
    ItemDao idao=new ItemDao();

    SimpleDateFormat input=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    SimpleDateFormat output=new SimpleDateFormat("yyyy-MM-dd");
    String reviewDate=dto.getReview_date();
    Date newdt = input.parse(reviewDate);			//date 자료형으로 변환
    String newdt2 = output.format(newdt); //date 타입을 string 으로 변환
    String member_name=mdao.getName(dto.getMember_num());
    System.out.println(member_name);


    JSONObject obj=new JSONObject();
    obj.put("review_num",review_num);
    obj.put("item_name",idao.getItemName(dto.getItem_num()));
    obj.put("member_name",member_name);
    obj.put("review_img",dto.getReview_img());
    obj.put("review_content",dto.getReview_content());
    obj.put("review_date",newdt2);

%>
<%=obj.toString()%>

    