<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="data.dao.MemberDao" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");

    String member_id=request.getParameter("searchPassId");
    String member_email=request.getParameter("searchPassEmail");

    System.out.println(member_id);
    System.out.println(member_email);

    MemberDao dao=new MemberDao();
    String member_num=dao.searchPass(member_id,member_email);

    if(member_num.equals("")) { %>
        <script type="text/javascript">
            alert("일치하는 회원 정보가 없습니다.");
            history.back();
        </script>
    <% } else {
        response.sendRedirect("../index.jsp?main=login/searchPassUpdateForm.jsp?member_num="+member_num);
    }
%>

    