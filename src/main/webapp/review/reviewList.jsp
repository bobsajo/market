<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="dto.ReviewDto" %>
<%@ page import="dao.ReviewDao" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
    <title>Title</title>
    <link rel="stylesheet" href="review.css">
</head>
<%
    //로그인 상태와 아이디 불러오기
    String loginok=(String)session.getAttribute("loginok");
    String myid=(String)session.getAttribute("myid");

    //dao 선언
    ReviewDao db=new ReviewDao();

    //상품 들어갈 때 item_num 받아서 들어오기
    String item_num=request.getParameter("item_num");

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
    list=db.getListLike(item_num,start,perPage);
    %>
<%--    <script type="text/javascript">--%>
<%--        $(function() {--%>
<%--            $("#main").load("review/reviewOrderByLike.jsp");--%>

<%--           $("span.orderByNew").click(function() {--%>
<%--                $("#main").load("review/reviewOrderByNew.jsp");--%>
<%--           });--%>
<%--        });--%>
<%--    </script>--%>

<body>

<div>
<span style="font-size: 14pt"><b>상품 후기</b></span>
    <ul>
    <li><b>사진후기 100원, 글 후기 50원 적립금 혜택이 있어요.</b></li>
    <li>후기 작성은 배송완료일로부터 30일 이내 가능합니다.</li>
    <li>작성하신 후기는 확인 후 적립금이 지급됩니다.(영업일 기준 평균 1~2일 소요)</li>
    </ul>
    <br><br>
</div>
    <div>
        <%
            //        ReviewDao dao=new ReviewDao(); --> 페이징 처리 하면서 함
            ReviewDto dto=new ReviewDto();
//          List<ReviewDto> list=dao.getAllReviewData(); --> 페이징 처리로 인해 필요 없어짐
            SimpleDateFormat input=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            SimpleDateFormat output=new SimpleDateFormat("yyyy-MM-dd");

//        int i=0; //0번지부터 사진을 넣을 거라
            for(int i=0; i<list.size(); i++) {
                if(list.get(i).getReview_img()!=null) {
                    //이미지 가지고 오기
                    String photo = list.get(i).getReview_img();

        %>

        <button type="button" review_num="<%=list.get(i).getReview_num()%>" data-toggle="modal" data-target="#exampleModalLong" class="modalImg">
            <img review_num="<%=list.get(i).getReview_num()%>" src="reviewImg/<%=photo%>" class="reviewFlexImg">
        </button>
        <%
                if((i+1)%7==0) {
                    break;
                }
                }
            }
        %>
    </div><br><br>
    <div>
    <span><b>총 <%=list.size()%>개</b></span>
    <span class="orderByLike active">추천순 </span>
    <span style="font-size: 10pt; color: gray;">|</span>
    <span class="orderByNew"> 최근등록순</span>
    <hr style="width: 1000px; height: 10px;" align="left">
    </div>
    <div id="main">
        <script type="text/javascript">
                $.ajax({
                    url:"reviewOrderByLike.jsp",
                    dataType:"html",
                    type:"post",
                    data:{"item_num":<%=item_num%>},
                    success:function(res) {
                        $("#main").html(res);
                    }
                });

                $("span.orderByNew").click(function() {
                    $("span.orderByLike").removeClass('active');
                    $(this).addClass('active');
                    $.ajax({
                        url: "reviewOrderByNew.jsp",
                        dataType: "html",
                        type: "post",
                        data: {"item_num":<%=item_num%>},
                        success: function (res) {
                            $("#main").html(res);
                        }
                    });
                });

                $("span.orderByLike").click(function() {
                    $("span.orderByNew").removeClass('active');
                    $(this).addClass('active');

                    $.ajax({
                        url:"reviewOrderByLike.jsp",
                        dataType:"html",
                        type:"post",
                        data:{"item_num":<%=item_num%>},
                        success:function(res) {
                            $("#main").html(res);
                        }
                    });
                });

        </script>
    </div>
<%--<div>--%>
<%--    <%--%>
<%--//        ReviewDao dao=new ReviewDao(); --> 페이징 처리 하면서 함--%>
<%--        ReviewDto dto=new ReviewDto();--%>
<%--//        List<ReviewDto> list=dao.getAllReviewData(); --> 페이징 처리로 인해 필요 없어짐--%>
<%--        SimpleDateFormat input=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");--%>
<%--        SimpleDateFormat output=new SimpleDateFormat("yyyy-MM-dd");--%>

<%--//        int i=0; //0번지부터 사진을 넣을 거라--%>
<%--        for(int i=0; i<list.size(); i++) {--%>
<%--            //이미지 가지고 오기--%>
<%--            String photo=list.get(i).getReview_img();--%>
<%--    %>--%>

<%--    <button type="button" review_num="<%=list.get(i).getReview_num()%>" data-toggle="modal" data-target="#exampleModalLong" class="modalImg">--%>
<%--        <img review_num="<%=list.get(i).getReview_num()%>" src="reviewImg/<%=photo%>" class="reviewFlexImg">--%>
<%--    </button>--%>
<%--    <%--%>
<%--            if((i+1)%7==0) {--%>
<%--                break;--%>
<%--            }--%>
<%--        }--%>
<%--    %>--%>
<%--</div><br><br>--%>
<%--<div id="orderByLike"> <!--리뷰 컨텐츠 나오는 칸-->--%>
<%--    <span><b>총 <%=list.size()%>개</b></span>--%>
<%--    <span class="orderByLike active">추천순 </span>--%>
<%--    <span style="font-size: 10pt; color: gray;">|</span>--%>
<%--    <span class="orderByNew"> 최근등록순</span>--%>
<%--    <hr style="width: 1000px; height: 10px;" align="left">--%>
<%--    <%--%>
<%--        //boolean like=false;--%>
<%--        for(int i=0; i<list.size(); i++) {--%>
<%--            String reviewDate=list.get(i).getReview_date();--%>
<%--            Date newdt = input.parse(reviewDate);			//date 자료형으로 변환--%>
<%--            String newdt2 = output.format(newdt);	//date 타입을 string 으로 변환--%>

<%--    %>--%>
<%--    <div class="eachReview"> <!--개개인 리뷰 칸 나오는 곳-->--%>
<%--        <div class="reviewSideBar">--%>
<%--            <%--%>
<%--                if((i+1)<4) { %>--%>
<%--                    <span class="bestReview">베스트</span>--%>
<%--                <% } else { %>--%>
<%--                    <span class="bin"></span>--%>
<%--            <% } %>--%>
<%--            <span>작성자: <%=list.get(i).getMember_num()%></span>--%>
<%--        </div>--%>
<%--        <div class="reviewContent">--%>
<%--        <article>--%>
<%--            <span class="reviewItemName">상품명: <%=list.get(i).getItem_num()%></span>--%>
<%--            <br><br>--%>
<%--            <p><%=list.get(i).getReview_content().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")--%>
<%--                    .replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></p>--%>
<%--            <br>--%>
<%--            <img class="reviewFlexImg" review_num="<%=list.get(i).getReview_num()%>" src="reviewImg/<%=list.get(i).getReview_img()%>" data-toggle="modal" data-target="#exampleModalLong">--%>
<%--            <br><br>--%>
<%--            <span class="reviewDate"><%=newdt2%></span>--%>
<%--            <button type="button" class="likeBtn" review_num="<%=list.get(i).getReview_num()%>"><span class="likeSpan glyphicon glyphicon-thumbs-up">--%>
<%--            </span>&ensp;도움돼요&ensp;<%=list.get(i).getReview_like()%></button>--%>
<%--        </article>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <hr style="width: 1000px; height: 10px;" align="left">--%>
<%--    <% } %>--%>

<%--    <script type="text/javascript">--%>
<%--        //도움돼요 버튼을 클릭하면--%>
<%--        $("button.likeBtn").click(function() {--%>

<%--            <%--%>
<%--                if(loginok==null) { %>--%>
<%--            var goLogin=confirm("회원 전용 서비스입니다. 로그인 페이지로 이동하시겠습니까?");--%>
<%--            if(goLogin) {--%>
<%--                //로그인 페이지로 이동하기--%>
<%--                location.href="../login/loginForm.jsp";--%>
<%--            }--%>
<%--            <% } else { %>--%>

<%--            if($(this).hasClass('likeBtn')) {--%>
<%--                review_num=$(this).attr("review_num");--%>
<%--                var tag=$(this);--%>

<%--                $.ajax({--%>
<%--                    type:"get",--%>
<%--                    dataType:"json",--%>
<%--                    url:"reviewLike.jsp",--%>
<%--                    data:{"review_num":review_num},--%>
<%--                    success:function(res) {--%>
<%--                        tag.after().html("<span class='likeSpan glyphicon glyphicon-thumbs-up'></span> 도움돼요 "+res.review_like);--%>
<%--                        tag.removeClass('likeBtn');--%>
<%--                        tag.addClass('likeBtnActive');--%>

<%--                    },statusCode:{--%>
<%--                        404:function() {--%>
<%--                            alert("json 파일이 없어요");--%>
<%--                        },--%>
<%--                        500:function() {--%>
<%--                            alert("서버 오류... 코드를 다시 한 번 확인하세요");--%>
<%--                        }--%>
<%--                    }--%>
<%--                });--%>
<%--            } else if(!$(this).hasClass('likeBtnActive')) {--%>

<%--                $.ajax({--%>
<%--                    type:"get",--%>
<%--                    dataType:"json",--%>
<%--                    url:"reviewLikeDelete.jsp",--%>
<%--                    data:{"review_num":review_num},--%>
<%--                    success:function(res) {--%>
<%--                        tag.after().html("<span class='likeSpan glyphicon glyphicon-thumbs-up'></span> 도움돼요 "+res.review_like);--%>
<%--                        tag.removeClass('likeBtnActive');--%>
<%--                        tag.addClass('likeBtn');--%>

<%--                    },statusCode:{--%>
<%--                        404:function() {--%>
<%--                            alert("json 파일이 없어요");--%>
<%--                        },--%>
<%--                        500:function() {--%>
<%--                            alert("서버 오류... 코드를 다시 한 번 확인하세요");--%>
<%--                        }--%>
<%--                    }--%>
<%--                });--%>
<%--            }--%>
<%--            <% }--%>
<%--        %>--%>
<%--        });--%>

<%--        $("img").on('shown.bs.modal',function() {--%>
<%--            // $("#myInput").trigger('focus');--%>

<%--            console.log(review_num);--%>
<%--        });--%>
<%--    </script>--%>

<%--    &lt;%&ndash; 페이징 기법 &ndash;%&gt;--%>
<%--    <div class="pagination1">--%>
<%--        <%--%>
<%--            //블록 이전 버튼--%>
<%--            if(startPage>1) { %>--%>
<%--        <a href="reviewList.jsp?currentPage=<%=startPage-1%>" class="p-left">&laquo;</a>--%>
<%--        <% }--%>

<%--            //밑에 블럭 설정--%>
<%--            for(int pp=startPage; pp<=endPage; pp++) {--%>
<%--                if(pp==currentPage) { %>--%>
<%--        <a href="reviewList.jsp?currentPage=<%=pp%>" class="active"><%=pp%></a>--%>
<%--        <% } else { %>--%>
<%--        <a href="reviewList.jsp?currentPage=<%=pp%>"><%=pp%></a>--%>
<%--        <% }--%>
<%--        }--%>

<%--            //블록 다음 버튼--%>
<%--            if(endPage<totalPage) { %>--%>
<%--        <a href="reviewList.jsp?currentPage=<%=endPage+1%>">&raquo;</a>--%>
<%--        <% }--%>
<%--        %>--%>
<%--    </div>--%>

<%--    <!-- Button trigger modal -->--%>
<%--    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">--%>
<%--        Launch demo modal--%>
<%--    </button>--%>

<%--    <!-- Modal -->--%>
<%--    <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">--%>
<%--        <div class="modal-dialog" role="document">--%>
<%--            <div class="modal-content">--%>
<%--                <div class="modal-header">--%>
<%--                    <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>--%>
<%--                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                        <span aria-hidden="true">&times;</span>--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--                <div class="modal-body">--%>
<%--                    ...--%>
<%--                </div>--%>
<%--                <div class="modal-footer">--%>
<%--                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
<%--                    <button type="button" class="btn btn-primary">Save changes</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


<%--    --%>
<%--    <div id="orderByNew"> <!--리뷰 컨텐츠 나오는 칸-->--%>
<%--        <%--%>
<%--            list=db.getListNew(item_num,start,perPage);--%>
<%--        %>--%>
<%--        <span><b>총 <%=list.size()%>개</b></span>--%>
<%--        <span class="orderByLike active">추천순 </span>--%>
<%--        <span style="font-size: 10pt; color: gray;">|</span>--%>
<%--        <span class="orderByNew"> 최근등록순</span>--%>
<%--        <hr style="width: 1000px; height: 10px;" align="left">--%>
<%--        <%--%>
<%--            for(int i=0; i<list.size(); i++) {--%>
<%--                String reviewDate=list.get(i).getReview_date();--%>
<%--                Date newdt = input.parse(reviewDate);			//date 자료형으로 변환--%>
<%--                String newdt2 = output.format(newdt);	//date 타입을 string 으로 변환--%>

<%--        %>--%>
<%--        <div class="eachReview"> <!--개개인 리뷰 칸 나오는 곳-->--%>
<%--            <div class="reviewSideBar">--%>
<%--                <span class="bin"></span>--%>
<%--                <span>작성자: <%=list.get(i).getMember_num()%></span>--%>
<%--            </div>--%>
<%--            <div class="reviewContent">--%>
<%--                <article>--%>
<%--                    <span class="reviewItemName">상품명: <%=list.get(i).getItem_num()%></span>--%>
<%--                    <br><br>--%>
<%--                    <p><%=list.get(i).getReview_content().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")--%>
<%--                            .replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></p>--%>
<%--                    <br>--%>
<%--                    <img class="reviewFlexImg" review_num="<%=list.get(i).getReview_num()%>" src="reviewImg/<%=list.get(i).getReview_img()%>" data-toggle="modal" data-target="#exampleModalLong">--%>
<%--                    <br><br>--%>
<%--                    <span class="reviewDate"><%=newdt2%></span>--%>
<%--                    <button type="button" class="likeBtn" review_num="<%=list.get(i).getReview_num()%>"><span class="likeSpan glyphicon glyphicon-thumbs-up">--%>
<%--            </span>&ensp;도움돼요&ensp;<%=list.get(i).getReview_like()%></button>--%>
<%--                </article>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <hr style="width: 1000px; height: 10px;" align="left">--%>
<%--        <% } %>--%>

<%--        <script type="text/javascript">--%>
<%--            //도움돼요 버튼을 클릭하면--%>
<%--            $("div.orderByNew button.likeBtn").click(function() {--%>

<%--                <%--%>
<%--                    if(loginok==null) { %>--%>
<%--                var goLogin=confirm("회원 전용 서비스입니다. 로그인 페이지로 이동하시겠습니까?");--%>
<%--                if(goLogin) {--%>
<%--                    //로그인 페이지로 이동하기--%>
<%--                    location.href="../login/loginForm.jsp";--%>
<%--                }--%>
<%--                <% } else { %>--%>

<%--                if($(this).hasClass('likeBtn')) {--%>
<%--                    // review_num=$(this).attr("review_num");--%>
<%--                    var tag=$(this);--%>
<%--                    // alert(review_num);--%>

<%--                    $.ajax({--%>
<%--                        type:"get",--%>
<%--                        dataType:"json",--%>
<%--                        url:"reviewLike.jsp",--%>
<%--                        data:{"review_num":review_num},--%>
<%--                        success:function(res) {--%>
<%--                            tag.after().html("<span class='likeSpan glyphicon glyphicon-thumbs-up'></span> 도움돼요 "+res.review_like);--%>
<%--                            tag.removeClass('likeBtn');--%>
<%--                            tag.addClass('likeBtnActive');--%>

<%--                        },statusCode:{--%>
<%--                            404:function() {--%>
<%--                                alert("json 파일이 없어요");--%>
<%--                            },--%>
<%--                            500:function() {--%>
<%--                                alert("서버 오류... 코드를 다시 한 번 확인하세요");--%>
<%--                            }--%>
<%--                        }--%>
<%--                    });--%>
<%--                } else if(!$(this).hasClass('likeBtnActive')) {--%>

<%--                    $.ajax({--%>
<%--                        type:"get",--%>
<%--                        dataType:"json",--%>
<%--                        url:"reviewLikeDelete.jsp",--%>
<%--                        data:{"review_num":review_num},--%>
<%--                        success:function(res) {--%>
<%--                            tag.after().html("<span class='likeSpan glyphicon glyphicon-thumbs-up'></span> 도움돼요 "+res.review_like);--%>
<%--                            tag.removeClass('likeBtnActive');--%>
<%--                            tag.addClass('likeBtn');--%>

<%--                        },statusCode:{--%>
<%--                            404:function() {--%>
<%--                                alert("json 파일이 없어요");--%>
<%--                            },--%>
<%--                            500:function() {--%>
<%--                                alert("서버 오류... 코드를 다시 한 번 확인하세요");--%>
<%--                            }--%>
<%--                        }--%>
<%--                    });--%>
<%--                }--%>
<%--                <% }--%>
<%--            %>--%>
<%--            });--%>

<%--            $("img").on('shown.bs.modal',function() {--%>
<%--                // $("#myInput").trigger('focus');--%>

<%--                console.log(review_num);--%>
<%--            });--%>
<%--        </script>--%>

<%--        &lt;%&ndash; 페이징 기법 &ndash;%&gt;--%>
<%--        <div class="pagination1">--%>
<%--            <%--%>
<%--                //블록 이전 버튼--%>
<%--                if(startPage>1) { %>--%>
<%--            <a href="reviewList.jsp?currentPage=<%=startPage-1%>" class="p-left">&laquo;</a>--%>
<%--            <% }--%>

<%--                //밑에 블럭 설정--%>
<%--                for(int pp=startPage; pp<=endPage; pp++) {--%>
<%--                    if(pp==currentPage) { %>--%>
<%--            <a href="reviewList.jsp?currentPage=<%=pp%>" class="active"><%=pp%></a>--%>
<%--            <% } else { %>--%>
<%--            <a href="reviewList.jsp?currentPage=<%=pp%>"><%=pp%></a>--%>
<%--            <% }--%>
<%--            }--%>

<%--                //블록 다음 버튼--%>
<%--                if(endPage<totalPage) { %>--%>
<%--            <a href="reviewList.jsp?currentPage=<%=endPage+1%>">&raquo;</a>--%>
<%--            <% }--%>
<%--            %>--%>
<%--        </div>--%>

<%--        <!-- Button trigger modal -->--%>
<%--        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">--%>
<%--            Launch demo modal--%>
<%--        </button>--%>

        <!-- Modal -->
        <%--    <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">--%>
        <%--        <div class="modal-dialog" role="document">--%>
        <%--            <div class="modal-content">--%>
        <%--                <div class="modal-header">--%>
        <%--                    <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>--%>
        <%--                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
        <%--                        <span aria-hidden="true">&times;</span>--%>
        <%--                    </button>--%>
        <%--                </div>--%>
        <%--                <div class="modal-body">--%>
        <%--                    ...--%>
        <%--                </div>--%>
        <%--                <div class="modal-footer">--%>
        <%--                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
        <%--                    <button type="button" class="btn btn-primary">Save changes</button>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>
<%--    </div>--%>
<%--    </div>--%>

</body>
</html>
    