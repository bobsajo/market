<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="data.dao.ReviewDao" %>
<%@ page import="data.dto.ReviewDto" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="data.dao.MemberDao" %>
<%@ page import="data.dao.ItemDao" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="review.css">
    <title>Title</title>
    <%
        //로그인 상태와 아이디 불러오기
        String loginok=(String)session.getAttribute("loginok");
        String myid=(String)session.getAttribute("myid");
//        System.out.println(loginok+" "+myid);

        //dao 선언
        ReviewDao db=new ReviewDao();
        MemberDao mdao=new MemberDao();
        ItemDao idao=new ItemDao();


        //상품 들어갈 때 item_num 받아서 들어오기
        String item_num=request.getParameter("item_num");
        //id로 member_num 받아오기
        String member_num=mdao.getMemberNum(myid);

//--------페이징 처리 기법 복사 시작----
        int totalCount;
        int totalPage; //총 페이지 수
        int startPage; //각 블럭의 시작 페이지
        int endPage; //각 블럭의 끝 페이지(예:1~10 다음의 1~10 부분)
        int start; //각 페이지의 시작 번호
        int perPage=7; //한 페이지에 보여질 글의 갯수
        int perBlock=5; //한 블럭 당 보여지는 페이지 갯수(밑에 뜨는 1~10, 다음 이 부분)
        int currentPage; //현재 페이지

        //총 갯수
        totalCount=db.getTotalCount(item_num);

        //현재 페이지에 글이 하나도 없어도 블럭을 1페이지로 두겠다, 페이지 있으면 그 페이지로 나타냄
        //현재 페이지번호 읽기(단 null일 때는 1페이지로 설정)
        if(request.getParameter("currentPage")==null)
            currentPage=1;
        else
            currentPage=Integer.parseInt(request.getParameter("currentPage"));

        //총 페이지 갯수
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

        //각 페이지에서 필요한 게시글 가져오기
        List<ReviewDto> list;
        list=db.getListNew(item_num,start,perPage);
        List<String> reviewArr=db.selectReviewNum(member_num,item_num);
    %>
</head>
<script type="text/javascript">
    var member_num=<%=member_num%>;
    var item_num=<%=item_num%>
        $(document).ready(function(){
            <%
                for(String arr:reviewArr) { %>
            //arr가 선언이 안되어 있어서 그랬다. reviewArr를 넣어주자
            $.each($(".likeBtn"),function(idx, item) {
                var reviewNum=$(item).attr("review_num");
                if(reviewNum==<%=arr%>) { //만약 review_num과 arr에 저장된 review_num이 같다면
                    //      console.log(reviewNum);
                    $(item).addClass("likeBtnActive");
                }
            });
            <% }
        %>
        });
</script>
<body>
    <div>
        <%
            ReviewDto dto=new ReviewDto();
            SimpleDateFormat input=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            SimpleDateFormat output=new SimpleDateFormat("yyyy-MM-dd");

        %>
    </div><br><br>
    <div id="orderByNew"> <!--리뷰 컨텐츠 나오는 칸-->
        <%
            for(int i=0; i<list.size(); i++) {
                String reviewDate=list.get(i).getReview_date();
                Date newdt = input.parse(reviewDate);			//date 자료형으로 변환
                String newdt2 = output.format(newdt);	//date 타입을 string 으로 변환

        %>
        <div class="eachReview"> <!--개개인 리뷰 칸 나오는 곳-->
            <div class="reviewSideBar">
                <span class="bin">최신순</span>
                <span><%=mdao.getReviewName(list.get(i).getMember_num())%></span>
            </div>
            <div class="reviewContent">
                <article>
                    <span class="reviewItemName"><%=idao.getItemName(list.get(i).getItem_num())%></span>
                    <br><br>
                    <p><%=list.get(i).getReview_content().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
                            .replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></p>
                    <br>
                    <%
                        if(list.get(i).getReview_img()!=null) { %>
                    <img class="reviewFlexImg" review_num="<%=list.get(i).getReview_num()%>" src="../reviewImg/<%=list.get(i).getReview_img()%>" data-toggle="modal" data-target="#exampleModalLong">
                    <br><br>
                    <%  } %>
                    <span class="reviewDate"><%=newdt2%></span>
                    <button type="button" class="likeBtn" review_num="<%=list.get(i).getReview_num()%>" item_num="<%=list.get(i).getItem_num()%>" member_num="<%=list.get(i).getMember_num()%>"><span class="likeSpan glyphicon glyphicon-thumbs-up">
            </span>&ensp;도움돼요&ensp;<%=list.get(i).getReview_like()%></button>
                </article>
            </div>
        </div>
        <hr style="width: 1000px; height: 10px;" align="left">
        <% } %>

        <script type="text/javascript">
            like=false;
            //도움돼요 버튼을 클릭하면
            $("button.likeBtn").click(function() {
                <%
                    if(loginok==null) { %>
                        var goLogin=confirm("회원 전용 서비스입니다. 로그인 페이지로 이동하시겠습니까?");
                        if(goLogin) {
                            //로그인 페이지로 이동하기
                            window.top.location.href="../login/loginForm.jsp";
                }
                <% } else {
                %>
                //클래스 체크용
                // var check=$(this).hasClass("likeBtnActive");
                // console.log(check);

                review_num=$(this).attr("review_num");
                if($(this).hasClass("likeBtnActive")===true) {
                    // review_num=$(this).attr("review_num");
                    // console.log(review_num);
                    item_num=$(this).attr("item_num");
                    var tag=$(this);


                    $.ajax({
                        type:"get",
                        dataType:"json",
                        url:"reviewLikeDelete.jsp",
                        data:{"review_num":review_num,"item_num":item_num,"member_num":member_num},
                        success:function(res) {
                            tag.html("<span class='likeSpan glyphicon glyphicon-thumbs-up'></span> 도움돼요 "+res.review_like);
                            tag.removeClass("likeBtnActive");
                        },statusCode:{
                            404:function() {
                                alert("json 파일이 없어요");
                            },
                            500:function() {
                                alert("서버 오류... 코드를 다시 한 번 확인하세요");
                            }
                        }
                    });

                } else {
                    var tag=$(this);
                    $.ajax({
                        type:"get",
                        dataType:"json",
                        url:"reviewLike.jsp",
                        data:{"review_num":review_num,"item_num":item_num,"member_num":member_num},
                        success:function(res) {
                            tag.html("<span class='likeSpan glyphicon glyphicon-thumbs-up'></span> 도움돼요&ensp;"+res.review_like);
                            tag.addClass("likeBtnActive");
                        },statusCode:{
                            404:function() {
                                alert("json 파일이 없어요");
                            },
                            500:function() {
                                alert("서버 오류... 코드를 다시 한 번 확인하세요");
                            }
                        }
                    });
                }
                <% }
            %>
            });
        </script>

        <%-- 페이징 기법 --%>
        <div class="pagination1">
            <%
                //블록 이전 버튼
                if(startPage>1) { %>
            <a href="reviewList.jsp?currentPage=<%=startPage-1%>" class="p-left">&laquo;</a>
            <% }

                //밑에 블럭 설정
                for(int pp=startPage; pp<=endPage; pp++) {
                    if(pp==currentPage) { %>
            <a href="reviewList.jsp?currentPage=<%=pp%>" class="active"><%=pp%></a>
            <% } else { %>
            <a href="reviewList.jsp?currentPage=<%=pp%>"><%=pp%></a>
            <% }
            }

                //블록 다음 버튼
                if(endPage<totalPage) { %>
            <a href="reviewList.jsp?currentPage=<%=endPage+1%>">&raquo;</a>
            <% }
            %>
        </div>

        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">
            Launch demo modal
        </button>

        <!-- Modal -->
        <div class="modal fade bd-example-modal-lg modal-dialog-scrollable" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-lg-h" modal-dialog-scrollable role="document">
                <div class="modal-content" style="padding: 10px 10px;">
                    <div class="modal-header">
                        <span class="modal-title" id="exampleModalLongTitle" style="white-space:nowrap; font-size: 17pt; font-weight: bold">사진 후기</span>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="white-space:nowrap;">
                            <span aria-hidden="true" style="font-size: 25pt; white-space:nowrap;">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body modal-dialog-scrollable" style="float: left;">
                        <div class="modal-img"></div>
                        <script type="text/javascript">
                            $(".reviewFlexImg").click(function() {
                                var modal_num=$(this).attr("review_num");
                                // console.log(modal_num);

                                $.ajax({
                                    url:"getDataModal.jsp",
                                    type:"get",
                                    dataType:"json",
                                    data:{"review_num":modal_num},
                                    success:function(res) {
                                        // alert(modal_num);

                                        var item_name=res.item_name;
                                        var review_content=res.review_content;
                                        var review_date=res.review_date;
                                        // new Date(review_date);

                                        $(".modal-body").html("<img src='../reviewImg/"+res.review_img+"' style='width: 300px; height: 400px; border-radius: 10px; float: left; margin-right: 20px; margin-top: 20px;'>");
                                        $(".modal-text").html("<span style='font-weight: bold'>"+res.member_name+"</span><br><span style='font-size: 9pt; color: gray;'><b>"+item_name+"</b></span><br><br><span>"+review_content+"</span><br><br><span style='color: gray'>"+review_date+"</span>");
                                    }
                                });
                            });
                        </script>
                    </div>
                    <div class="modal-text modal-lg-h"></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
    