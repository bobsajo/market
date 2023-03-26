<%@page import="data.dao.SearchDao"%>
<%@ page import="data.dao.SearchDao" %>
<%@ page import="data.dto.SearchDto" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    //한글 인코딩
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    SearchDao dao = new SearchDao();
    String searchText=request.getParameter("searchText");
	System.out.println(searchText);

    //검색 메소드에 사용자가 입력한 값 넣기
    ArrayList<SearchDto> list = dao.getSearch(searchText);

    //만약 사용자가 입력한 값과 일치하는 게 없다면(예를 들어 사과 입력했는데 사과가 없다면) 창 띄워주기
    if (list.size() == 0) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('검색결과가 없습니다.')");
        script.println("history.back()");
        script.println("</script>");
    } %>

<!--검색 결과 출력-->
<h4>'<%=searchText%>'에 대한 검색결과(총 <%=list.size()%>개)</h4>

<!--저는 일단 간단하게 테이블 형태로 출력했습니다-->
<table>
<%
    //값이 있는 크기만큼만 반복
    for (int i = 0; i < list.size(); i++) {
%>
    <!--사진과 타이틀 중 아무거나 클릭하면 상세 페이지로 넘어가도록-->
    <a href="index.jsp?main=detail/detailView.jsp?item_num=<%=list.get(i).getItem_num()%>">
    <tr>
        <!--현재 상품 이미지가 안들어가 있어서 null로 떠요-->
        <td><%=list.get(i).getItem_img()%></td>
    </tr>

    <tr>
        <!--제목 출력 및 제목에 있는 <,>,공백 등이 잘 나올 수 있도록 html 언어로 replaceAll 해주기-->
        <td><%=list.get(i).getItem_name().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
                .replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></td>
    </tr>

    <tr>
        <td><%=list.get(i).getItem_sub_title().replaceAll(" ", "&nbsp;")%></td>
    </tr>
    </a>

    <tr>
        <td><b><%=list.get(i).getItem_price()%>원</b></td>
    </tr>
<%
    }
%>
</table>

    