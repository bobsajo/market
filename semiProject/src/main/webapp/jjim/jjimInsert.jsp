<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="data.dao.JjimDao" %>
<%@ page import="data.dto.JjimDto" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");

    String member_num=request.getParameter("member_num");
    String item_num=request.getParameter("item_num");
//    System.out.println("m"+member_num+" "+item_num);

    JjimDao dao=new JjimDao();
    JjimDto dto=new JjimDto();

    dto.setItem_num(item_num);
    dto.setMember_num(member_num);

    dao.insertJjim(member_num,item_num);
%>
    <script type="text/javascript">
        alert("찜 목록에 추가되었습니다.");
    </script>
<%
    response.sendRedirect("../index.jsp?main=detail/detailView.jsp?item_num="+item_num);
%>

    