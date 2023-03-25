<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="data.dao.MemberDao" %>
<%@ page import="data.dto.MemberDto" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");

    String member_num=request.getParameter("member_num");
    String pass2=request.getParameter("searchPassUpdate2");

    MemberDao dao=new MemberDao();
    MemberDto dto=new MemberDto();
    dto.setMember_pass(pass2);
    dto.setMember_num(member_num);

    dao.updatePass(dto); %>

    <script type="text/javascript">
        alert("비밀번호가 변경되었습니다.");
    </script>
<%
    response.sendRedirect("../index.jsp?main=login/loginForm.jsp");
%>

    