<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="data.dto.ReviewDto" %>
<%@ page import="data.dao.ReviewDao" %>
<%@ page import="org.json.simple.JSONObject" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");

    String review_num=request.getParameter("review_num");
    String item_num=request.getParameter("item_num");
    String member_num=request.getParameter("member_num");

//    System.out.println(review_num);

    ReviewDao dao=new ReviewDao();

    //num에 해당하는 like 1증가
    dao.deleteLike(review_num);
    dao.deleteReviewLike(member_num,item_num,review_num);
//    System.out.println(member_num+" "+item_num+" "+review_num);

    //num에 해당하는 chu값 json 형식으로 반환
    int review_like=dao.getData(review_num).getReview_like();

    //json형태로 변환
    JSONObject obj=new JSONObject();
    obj.put("review_like",review_like);

    //새로고침하면 like 수가 증가한다 --> 새로고침 되면서 계속 추가되며 변화하는 것
    //누가 추천을 누르면 값을 다시 리턴해준다
%>
<%=obj.toString()%>
    