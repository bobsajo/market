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
<style type="text/css">
div.includewrap{
   width:100%;
   /* margin:0 auto; */
   
}

div.menu{
   z-index:100;
}

div.main{
   z-index:-1;
}


/* div.mainbanner{
/*    text-align:center; 
   position:absolute;
   top:20%;
}*/


/* div.layout{
   border: 0px solid gray;
   position: absolute;
   display:inline-flex;
} */

.btns {
  display: flex;
  position: fixed;
  right: .4rem;
  bottom: .4rem;
}

.btns > div {
  padding: .6rem 1.5rem;
  background: #111;
  display: flex;
  justify-content: center;
  align-items: center;
  cursor: pointer;
  border-radius: 5px;
  transition: .2s;
  color: #fff;
  margin-right: .4rem;
  
}

.moveTopBtn:hover {
  color: #000;
  background: #febf00;
}

</style>
</head>
<%
   String mainPage = "layout/main.jsp";

   if(request.getParameter("main")!=null)
   {
      mainPage = request.getParameter("main");
   }
   String root = request.getContextPath();
%>
<body>
<div class = "includewrap">

   <div class="layout title">
     <jsp:include page="layout/title2.jsp"/>
   </div>

   <div class="layout menu">
     <jsp:include page="layout/menu.jsp"/>
   </div> 

   <div class="layout main">
    <jsp:include page = "<%=mainPage%>"/>
   </div>

   <div class="layout footer">
    <jsp:include page = "layout/footer.jsp"/>
   </div>
   
   <div class = "btns">
   <div class = "moveTopBtn"><span class = "glyphicon glyphicon-triangle-top"></span>&nbsp;&nbsp;맨 위로</div>
   </div>
</div>

<script>
	const $topBtn = document.querySelector(".moveTopBtn");

	//버튼 클릭 시 맨 위로 이동
	$topBtn.onclick = () => {
	window.scrollTo({ top: 0, behavior: "smooth" });  
	}
</script>
</body>
</html>