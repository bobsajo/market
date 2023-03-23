<%@page import="data.Dao.itemDao"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.Dto.itemDto"%>
<%@page import="data.Dto.JjimDto"%>
<%@page import="java.util.List"%>
<%@page import="data.Dao.JjimDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>


</head>

<%
//로그인 상태와 아이디 가져오기 
String loginok=(String)session.getAttribute("loginok");
String myid=(String)session.getAttribute("myid");

//dao 선언
JjimDao db= new JjimDao();
itemDao idao=new itemDao();
itemDto idto=new itemDto();

//상품이 들어갈때 member_num 받아서 들어오기 
String member_num=request.getParameter("member_num");


NumberFormat nf = NumberFormat.getInstance(Locale.KOREA);

//페이징

	int totalCount;
    int totalPage; //총 페이지 수
    int startPage; //각 블럭의 시작 페이지
    int endPage; //각 블럭의 끝 페이지(예:1~10 다음의 1~10 부분)
    int start; //각 페이지의 시작 번호
    int perPage=5; //한 페이지에 보여질 글의 갯수
    int perBlock=3; //한 블럭 당 보여지는 페이지 갯수(밑에 뜨는 1~10, 다음 이 부분)
    int currentPage; //현재 페이지
    
    
    //총갯수
    totalCount=db.getTotalCount(member_num);
    
    //현재 페이지에 글이 하나도 없어도 블럭을 1페이지로 두겠다, 페이지 있으면 그 페이지로 나타냄
    //현재 페이지번호 읽기(단 null일 때는 1페이지로 설정)
    if(request.getParameter("currentPage")==null)
    	currentPage=1;
    else
    	currentPage=Integer.parseInt(request.getParameter("currentPage"));
    
    //총페이지 갯수
    totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
    
  //각 블럭의 시작 페이지...현재 페이지가 3(startPage:1, endPage:5)  6(s:6 e:10)
    startPage=(currentPage-1)/perBlock*perBlock+1;
    endPage=startPage+perBlock-1;
    
    
    //총페이지가 8, (6~10...endpage를 8로 수정해주어야 한다)
    //10까지 설정해 놨으나 총 페이지가 8이라면 마지막 페이지를 8로 수정해줘야 한다
    if(endPage>totalPage)
        endPage=totalPage;
    
    //각 페이지에서 불러 올 시작번호
    //현재 페이지가 2라면 startPage는 6이 됨(한 페이지에 5개 들어가니까)
    start=(currentPage-1)*perPage;
    
    List<JjimDto> list;
    list=db.getJjimLike(member_num, start, perPage);
%>

	<div class="">
	
	
	<div><b> 찜한 목록 (<%=list.size()%>)</b></div>
	
	<hr>
	
	
	
	
	
	
	<%
	
	JjimDto dto=new JjimDto();
	
	
	for(int i=0; i<list.size(); i++){
		
		
			
			//이미지 가지고 오기 
			String jphoto= db.getItemImg(list.get(i).getItem_num());
			//System.out.println(jphoto);
			
			%>
			
			
			<%
		
		
	}
	
	
	%>
		
	
	</div>
	
	
	

	
	
	



<body>

</body>
</html>