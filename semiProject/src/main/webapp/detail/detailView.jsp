<%@page import="data.dao.JjimDao"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.util.Locale"%>
<%@page import="data.dao.ReviewDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ItemDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ItemDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript"></script>
<link rel="stylesheet" href="css/good_view.css">
<link
	href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
  <script src="js/detailjs.js"></script>

</head>
<%
MemberDao mdao=new MemberDao();
//로그인 상태와 아이디 가져오기
String loginok=(String)session.getAttribute("loginok");
String myid=(String)session.getAttribute("myid");
String member_num=mdao.getMemberNum(myid);

String item_num = request.getParameter("item_num");
ItemDao dao = new ItemDao();
ItemDto dto = dao.getItemData(item_num);
ReviewDao rdao=new ReviewDao();
int reviewSize=rdao.getTotalCount(item_num);
NumberFormat nf=NumberFormat.getInstance(Locale.KOREA);
JjimDao jdao=new JjimDao();
%>

<script type="text/javascript">

$(function(){
	var a=<%=jdao.hasJjim(member_num,item_num)%>;
	
	$.ajax({
		type:"get",
		dataType:"html",
		url:"cookie/cookieSet.jsp",
		data:{"item_num":<%=item_num %>},
		success:function(){
			console.log("전달");
		}
	});
	
	$.ajax({

        url:"jjim/hasJjim.jsp",
        data:{"item_num":<%=item_num%>},
        dataType:"json",
        success:function(res) {
            if(res.has) {
                $(".btn_save img").attr({
                    'src': 'image/redheart.png',
                    alt:'찜하기 완료'
                });
            } else {
                $(this).find('img').attr({
                    'src': 'image/heart.png',
                    alt:"찜하기"
                });
            }
        }
    });

    $(".btn_save").click(function() {
        <% if(loginok!=null) { %>
            if(!a) {
                alert("찜 목록에 추가 되었습니다");
                $(".icon.heart").addClass('active');
                $(this).find('img').attr({
                    'src': 'image/redheart.png',
                    alt:'찜하기 완료'
                });
                location.href='jjim/jjimInsert.jsp?item_num=<%=item_num%>';
             } else {
                $(this).find('i').removeClass('fas').addClass('far')
                $(this).find('img').attr({
                    'src': 'image/heart.png',
                    alt:"찜하기"
                });
                location.href='jjim/jjimDelete.jsp?item_num=<%=item_num%>';
            }
           <% } else { %>
                alert("회원 전용 서비스입니다. 로그인 해주세요.");
                location.href='index.jsp?main=login/loginForm.jsp&item_num=<%=item_num%>';
        <%
        }

        %>
    });
 
    $(".detail_cart_in").click(function(){
    	$.ajax({
    		type:"get",
    		dataType:"html",
    		data:{"item_num":<%=item_num %>,"cart_cnt":$(".inp").val()},
    		url:"cart/cartSearchItem.jsp",
    		success:function(res){
    			var cartGo = confirm("장바구니에 상품을 담았습니다.\n장바구니로 이동하시겠어요?");
                if (cartGo) {
                    location.href = 'index.jsp?main=cart/cartPage.jsp';
                }
    		}
    	})
    });
    
});

</script>

<body>
<!-- 과일 -->
<script type="text/javascript">
        $(function() {

            $.ajax({
                url:"detail/detail_img_encdoing_utf8.json",
                dataType:"json",
                type:"post",
                success:function(res) {
                    /*var s=res.title+"<br>";
                    $(".words").html(s);*/
                    $.each(res,function(idx,item) {
                        var resNum=item.num;
                        // console.log(resNum);
                        if(resNum==<%=item_num%>) {
                            $(".desImg").attr("src",item.description_img);
                            $(".itemName").append(item.item_name);
                            $(".words").text(item.title);
                            if(item.check_point_img==="") {
                                $(".goods_point").hide();
                            } else {
                                var checkPointImg=item.check_point_img;
                                var chkImg=checkPointImg.split(",");
                                // console.log(chkImg.length);
                                for(var i=0; i<chkImg.length; i++) {
                                    $(".picChk").after("<img src='"+chkImg[i]+"'><br><br><br>");
                                    // console.log(chkImg[i]);
                                }
                            }
                            if(item.detail_img==="") {
                                $(".detailSize").hide();
                            } else {
                                var detailSizeImg=item.detail_img;
                                var detailImg=detailSizeImg.split(",");
                                /*console.log(chkImg.length);*/
                                for(var i=0; i<detailImg.length; i++) {
                                    $(".detailSizeImg").after("<img src='"+detailImg[i]+"'><br><br><br>");
                                    /*console.log(chkImg[i]);*/
                                }
                            }
                           /* console.log(item.tip); */
                            
                            $(".tipimg").attr("src",item.tip_img);
                            
                            if(item.tip_img===""){
                            	$(".goods_tip").hide();
                            	
                            	
                            }else {
                            	
                            	var tipImg=item.tip_img;
                            	var tipImg1=tipImg.split(",");
                            	
                            	for(var i=0; i<tipImg1.length; i++){
                            		$(".tipImg").after("<img src='"+tipImg1[i]+"' style='width:100%'> <br><br><br>");
                            	}
                            		
                            	
                            }
                            
                            
                         
                            
                            if(item.tip===""){
                            	$(".tipcontext").hide();
                            	
                            	
                            }else { 
                            	
                            	
                            	var tipcontext=item.tip;
                            	
                           
                            	var tipcontext1=tipcontext.split("\\n");
                            	//console.log(tipcontext);
                            	
                            	for(var i=0; i<tipcontext1.length; i++){
                            		
                            									
                            		 if(tipcontext1[i].startsWith("?",0)) {
                            			 $(".tip_box .context").append("<ul>"+tipcontext1[i].substr(1)+"</ul>");
                            		 }else {
                            			 $(".tip_box .context").append("<h4>"+tipcontext1[i]+"</h4>");
                            		 }
                            	}
                            }
                      
                        }
                    });
                }
            });
            
            
            <!-- 해산물 -->
            
            $.ajax({
                url:"detail/detail_img2_encdoing_utf8.json",
                dataType:"json",
                type:"post",
                success:function(res) {
                    /*var s=res.title+"<br>";
                    $(".words").html(s);*/
                    $.each(res,function(idx,item) {
                        var resNum=item.num;
                        // console.log(resNum);
                        if(resNum==<%=item_num%>) {
                            $(".desImg").attr("src",item.description_img);
                            $(".itemName").append(item.item_name);
                            $(".words").text(item.title);
                            if(item.check_point_img==="") {
                                $(".goods_point").hide();
                            } else {
                                var checkPointImg=item.check_point_img;
                                var chkImg=checkPointImg.split(",");
                                // console.log(chkImg.length);
                                for(var i=0; i<chkImg.length; i++) {
                                    $(".picChk").after("<img src='"+chkImg[i]+"'><br><br><br>");
                                    // console.log(chkImg[i]);
                                }
                            }
                            if(item.detail_img==="") {
                                $(".detailSize").hide();
                            } else {
                                var detailSizeImg=item.detail_img;
                                var detailImg=detailSizeImg.split(",");
                                /*console.log(chkImg.length);*/
                                for(var i=0; i<detailImg.length; i++) {
                                    $(".detailSizeImg").after("<img src='"+detailImg[i]+"'><br><br><br>");
                                    /*console.log(chkImg[i]);*/
                                }
                            }
                           /* console.log(item.tip); */
                            
                            $(".tipimg").attr("src",item.tip_img);
                            
                            if(item.tip_img===""){
                            	$(".goods_tip").hide();
                            	
                            	
                            }else {
                            	
                            	var tipImg=item.tip_img;
                            	var tipImg1=tipImg.split(",");
                            	
                            	for(var i=0; i<tipImg1.length; i++){
                            		$(".tipImg").after("<img src='"+tipImg1[i]+"' style='width:100%'> <br><br><br>");
                            	}

                            }

                            if(item.tip===""){
                            	$(".tipcontext").hide();
                            }else { 
                            	var tipcontext=item.tip;
                            	var tipcontext1=tipcontext.split("\\n");
                            	//console.log(tipcontext);
                            	
                            	for(var i=0; i<tipcontext1.length; i++){
                            						
                            		 if(tipcontext1[i].startsWith("?",0)) {
                            			 $(".tip_box .context").append("<ul>"+tipcontext1[i].substr(1)+"</ul>");
                            		 }else {
                            			 $(".tip_box .context").append("<h4>"+tipcontext1[i]+"</h4>");
                            		 }
                            	}
                            }
                        }
                    });
                }
            });
            
            
 <!-- 육류 -->
            
            $.ajax({
                url:"detail/detail_img3_encoding_utf8.json",
                dataType:"json",
                type:"post",
                success:function(res) {
                    /*var s=res.title+"<br>";
                    $(".words").html(s);*/
                    $.each(res,function(idx,item) {
                        var resNum=item.num;
                        console.log(resNum);
                        if(resNum==<%=item_num%>) {
                            $(".desImg").attr("src",item.description_img);
                            $(".itemName").append(item.item_name);
                            $(".words").text(item.title);
                            if(item.check_point_img==="") {
                                $(".goods_point").hide();
                            } else {
                                var checkPointImg=item.check_point_img;
                                var chkImg=checkPointImg.split(",");
                                // console.log(chkImg.length);
                                for(var i=0; i<chkImg.length; i++) {
                                    $(".picChk").after("<img src='"+chkImg[i]+"'><br><br><br>");
                                    // console.log(chkImg[i]);
                                }
                            }
                            if(item.detail_img==="") {
                                $(".detailSize").hide();
                            } else {
                                var detailSizeImg=item.detail_img;
                                var detailImg=detailSizeImg.split(",");
                                /*console.log(chkImg.length);*/
                                for(var i=0; i<detailImg.length; i++) {
                                    $(".detailSizeImg").after("<img src='"+detailImg[i]+"'><br><br><br>");
                                    /*console.log(chkImg[i]);*/
                                }
                            }
                           /* console.log(item.tip); */
                            
                            $(".tipimg").attr("src",item.tip_img);
                            
                            if(item.tip_img===""){
                            	$(".goods_tip").hide();
                            	
                            }else {
                            	
                            	var tipImg=item.tip_img;
                            	var tipImg1=tipImg.split(",");
                            	
                            	for(var i=0; i<tipImg1.length; i++){
                            		$(".tipImg").after("<img src='"+tipImg1[i]+"' style='width:100%'> <br><br><br>");
                            	}
                            		
                            }
                            if(item.tip===""){
                            	$(".tipcontext").hide();
                            }else { 
                            	var tipcontext=item.tip;
                            	var tipcontext1=tipcontext.split("\\n");
                            	//console.log(tipcontext);
                            	
                            	for(var i=0; i<tipcontext1.length; i++){				
                            		 if(tipcontext1[i].startsWith("?",0)) {
                            			 $(".tip_box .context").append("<ul>"+tipcontext1[i].substr(1)+"</ul>");
                            		 }else {
                            			 $(".tip_box .context").append("<h4>"+tipcontext1[i]+"</h4>");
                            		 }
                            	}
                            }
                        }
                    });
                }
            });
            
            
            
            
 <!-- 베이커리 -->
            
            $.ajax({
                url:"detail/detail_img4_encoding_utf8.json",
                dataType:"json",
                type:"post",
                success:function(res) {
                    /*var s=res.title+"<br>";
                    $(".words").html(s);*/
                    $.each(res,function(idx,item) {
                        var resNum=item.num;
                        console.log(resNum);
                        if(resNum==<%=item_num%>) {
                            $(".desImg").attr("src",item.description_img);
                            $(".itemName").append(item.item_name);
                            $(".words").text(item.title);
                            if(item.check_point_img==="") {
                                $(".goods_point").hide();
                            } else {
                                var checkPointImg=item.check_point_img;
                                var chkImg=checkPointImg.split(",");
                                // console.log(chkImg.length);
                                for(var i=0; i<chkImg.length; i++) {
                                    $(".picChk").after("<img src='"+chkImg[i]+"'><br><br><br>");
                                    // console.log(chkImg[i]);
                                }
                            }
                            if(item.detail_img==="") {
                                $(".detailSize").hide();
                            } else {
                                var detailSizeImg=item.detail_img;
                                var detailImg=detailSizeImg.split(",");
                                /*console.log(chkImg.length);*/
                                for(var i=0; i<detailImg.length; i++) {
                                    $(".detailSizeImg").after("<img src='"+detailImg[i]+"'><br><br><br>");
                                    /*console.log(chkImg[i]);*/
                                }
                            }
                           /* console.log(item.tip); */
                            
                            $(".tipimg").attr("src",item.tip_img);
                            
                            if(item.tip_img===""){
                            	$(".goods_tip").hide();
                            	
                            }else {
                            	
                            	var tipImg=item.tip_img;
                            	var tipImg1=tipImg.split(",");
                            	
                            	for(var i=0; i<tipImg1.length; i++){
                            		$(".tipImg").after("<img src='"+tipImg1[i]+"' style='width:100%'> <br><br><br>");
                            	}
                            		
                            }
                            if(item.tip===""){
                            	$(".tipcontext").hide();
                            }else { 
                            	var tipcontext=item.tip;
                            	var tipcontext1=tipcontext.split("\\n");
                            	//console.log(tipcontext);
                            	
                            	for(var i=0; i<tipcontext1.length; i++){				
                            		 if(tipcontext1[i].startsWith("?",0)) {
                            			 $(".tip_box .context").append("<ul>"+tipcontext1[i].substr(1)+"</ul>");
                            		 }else {
                            			 $(".tip_box .context").append("<h4>"+tipcontext1[i]+"</h4>");
                            		 }
                            	}
                            }
                        }
                    });
                }
            });
        });    
    </script>





	<!-- 시작 -->
<div id="container" class="container">
        

        <div id="main">
            <div id="content" style="opacity: 1;">
                <div class="section_view">
                    <div id="sectionView">
                        <div class="inner_view">
                            <div class="thumb" >
                                <img src="save-info-img/<%=dto.getItem_img()%>" alt="" class="bg">
										
										
                            </div>
                            <p class="goods_name">
                             
                               
                                <strong class="name"><%=dto.getItem_name() %></strong>
                                <span class="short_desc"><%=dto.getItem_sub_title() %></span>
                            </p>
                            <p class="goods_price">
                                <span class="position">
                                    <span class="dc">
                                      
                                        <span class="dc_price">
                                         
                                             <%
                                                if(!dao.itemIsSale(dto.getItem_num())) { %>
                                                	 <input type="hidden" value="<%=dto.getItem_price()%>" class="price1">
                                                    <%=nf.format(dto.getItem_price())%>
                                               <% } else { %>
                                               		 <input type="hidden" value="<%=dao.getSalePrice(dto.getItem_num())%>" class="price1">
                                                    <%=nf.format(dao.getSalePrice(dto.getItem_num()))%>
                                              <% }
                                            %>
                                            
                                            
                                        </span>
                                       <%	
							          	if(!dao.itemIsSale(dto.getItem_num())) {%>
							          		<span class="won">원</span>
							          	<%}else{ 
							          		int ori=dto.getItem_price();
											int sal=dao.getSalePrice(dto.getItem_num());
											int off=(int)((ori-sal)/(ori*1.0)*100);
							          	%>
							          		<span class="won">원</span>
							          		<br>
							          		<span style="font-size: 15pt"><font style="color: red"><%=off %>% &nbsp;</font></span>
							          		<span style="color: gray; font-size: small;"><strike><%=nf.format(dto.getItem_price())%>원</strike></span>
							          	<%} %>
                                    </span>
                                     
                                </span>
                                
                            </p>
                            
                            <div class="goods_info">
                           
                                <dl class="list fst">
                                
                                    <dt class="tit">판매단위</dt>
                                    <dd class="desc"><%=dto.getItem_sell_unit() %></dd>
                                </dl>
                                <dl class="list">
                                    <dt class="tit">중량/용량</dt>
                                    <dd class="desc"><%=dto.getItem_weight() %></dd>
                                </dl>
                                <dl class="list">
                                    <dt class="tit">배송구분</dt>
                                    <dd class="desc"><%=dto.getItem_package_detail() %></dd>
                                </dl>
                                <dl class="list">
                                    <dt class="tit">원산지</dt>
                                    <dd class="desc"><%=dto.getItem_origin() %></dd>
                                </dl>
                                <dl class="list">
                                    <dt class="tit">포장타입</dt>
                                    <dd class="desc">
                                        <%=dto.getItem_package_type() %>
                                        <strong class="emphd"></strong>
                                    </dd>
                                </dl>
                                <dl class="list">
                                    <dt class="tit">알레르기정보</dt>
                                    <dd class="desc"><%=dto.getItem_allergy() %></dd>
                                </dl>
                                <dl class="list">
                                    <dt class="tit">안내사항</dt>
                                    <dd class="desc"><%=dto.getItem_warning() %></dd>
                                </dl>
                            </div>
                        </div>
                    </div>

                    <div id="cartPut">
                        <div class="cart_option cart_type2">
                            <form action="">
                                <div class="inner_option">
                                    <div class="in_option">
                                        <div class="list_goods">
                                            <ul class="list list_nopackage">
                                                <li class="on">
                                                    <span class="tit_item">구매수량</span>
                                                    <div class="option">
                                                        <span class="count">
                                                            <button type="button" class="btn down on">수량내리기</button>
                                                            <input type="number" readonly="readonly" value = 1 class="inp">
                                                            <button  type="button" class="btn up on">수량올리기</button>
                                                        </span>
                                                    
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="total">
                                            <div class="price">
                                                <strong class="tit">총 상품금액 :</strong>
                                                <span class="sum">
                                                    <span class="num"><%=nf.format(dto.getItem_price()) %></span>
                                                    
                                                </span>
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <div class="group_btn off">
                                        <div class="view_function">
                                          <a  href="javascript:;" class="icon heart btn_save"><img alt="찜 목록" src="image/heart.png "  ></a>
                                        </div>
                                        <span class="btn_type1">
                                            <button type="button" class="detail_cart_in" style="background-color: #4B62D3;">장바구니 담기</button>
                                        </span>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="layout-wrapper goods-view-area"> <!-- $$$$$ -->
                   

                    <div class="goods-view-infomation detail_wrap_outer" id="goods-view-infomation" style="margin-left: 10%;">
                        <ul class="goods-view-infomation-tab-group" style="margin-left: 20%; ">
                            <li class="goods-view-infomation-tab">
                                <a href="#goods-description" class="goods-view-infomation-tab-anchor __active">상품설명</a>
                            </li>
                            
                            <li class="goods-view-infomation-tab">
                                <a href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a>
                            </li>
                            <li class="goods-view-infomation-tab">
                                <a href="#goods-review" class="goods-view-infomation-tab-anchor">
                                    고객후기
                                    <span class="count_review">(<%=reviewSize%>)</span>
                                </a>
                            </li>
                         
                        </ul>
                        <div class="goods-view-infomation-content __active" id="goods-description">
                            <div class="goods_wrap">
                                <div class="goods_intro">
                                    <div class="pic">
                                        <img src="" style="width:1010px; height:671px;" class="desImg">
                                    </div>
                                    <div class="context last">
                                        <h3 class="itemName">
                                            <small>
                                                <%=dto.getItem_sub_title()%>
                                            </small>
                                        </h3>
                                        <p class="words">
                                        </p>

                                    </div>
                                </div>
                                <div class="goods_point">
                                    <h3>
                                        <span>새벽마켓's Check Point</span>
                                    </h3>
                                    <div class="context last">
                                        <div class="picChk"><%--
                                            <img src="" class="checkImg">--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="goods_tip">
                                    <h3>
                                        <span>새벽마켓's Tip</span>
                                    </h3>
                                    <div class="tip_box">
                                        <div class="context last">
                                            <div class="pic">
                                                <img src="" class="tipImg">
                                            </div>
                                            
                                        </div>
                                         
                                            
                                    </div>
                                </div>
                              <%--  <div class="goods_pick">
                                    <h3>
                                        <span>새벽마켓`s Tip</span>
                                    </h3>

                                    <div class="context last" style="background-color: yellow;">
                                        <p class="words">
                                            <strong class="sub_tit">
                                                <span class="option_tit">상품명</span>
                                            </strong>
                                            <b>중량</b>
                                            : 중량샬라샬라
                                            <br>
                                            <b>특징</b>
                                            : 특징샬라샬라
                                            <br>
                                            <b>보관법</b>
                                            : 보관법샬라샬라
                                            <br>
                                            <b>조리법</b>
                                            : 조리법샬라샬라
                                        </p>
                                    </div>
                                </div>--%>
                                <div class="goods_tip detailSize">
                                    <div class="context last">
                                        <div class="context_about">
                                            <div class="pic">
                                                <img src="" class="detailSizeImg">
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </div>

                        </div>
                        <ul class="goods-view-infomation-tab-group" style="margin-left: 20%; ">
                            <li class="goods-view-infomation-tab">
                                <a href="#goods-description" class="goods-view-infomation-tab-anchor">상품설명</a>
                            </li>
                           
                            <li class="goods-view-infomation-tab">
                                <a href="#goods-infomation" class="goods-view-infomation-tab-anchor __active">상세정보</a>
                            </li>
                            <li class="goods-view-infomation-tab">
                                <a href="#goods-review" class="goods-view-infomation-tab-anchor">
                                    고객후기
                                    <span class="count_review">(<%=reviewSize%>)</span>
                                </a>
                            </li>
                            
                        </ul>
                        <div class="goods-view-infomation-content" id="goods-infomation" >
                            <table class="extra-information" style="margin-left: 10%; ">
                                <tbody>
                                    <tr>
                                        <th scope="row" class="goods-view-form-table-heading">포장단위별 용량(중량), 수량, 크기</th>
                                        <td><%=dto.getItem_weight() %></td>
                                        <th scope="row" class="goods-view-form-table-heading">관련법상 표시사항</th>
                                        <td>제품 별도 라벨 표기 참조</td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="goods-view-form-table-heading">생산자, 수입품의 경우 수입자를 함께 표기</th>
                                        <td>제품 별도 라벨 표기 참조</td>
                                        <th scope="row" class="goods-view-form-table-heading">상품구성</th>
                                        <td><%=dto.getItem_name() %></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="goods-view-form-table-heading">농수산물의 원산지 표시에 관한 법률에 따른 원산지</th>
                                        <td>국산</td>
                                        <th scope="row" class="goods-view-form-table-heading">보관방법 또는 취급방법</th>
                                        <td><%=dto.getItem_package_type() %></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="goods-view-form-table-heading">제조연월일(포장일 또는 생산연도), 유통기한 또는 품질유지기한</th>
                                        <td>제품 별도 라벨 표기 참조</td>
                                        <th scope="row" class="goods-view-form-table-heading">소비자상담 관련 전화번호</th>
                                        <td>새벽마켓 고객행복센터(1644-1107)</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="whykurly_area" style="margin-right: 10%; ">
                                <div class="row">
                                    <strong class="tit_whykurly">WHY 새벽마켓</strong>
                                    <div id="why_kurly" class="txt_area">
                                        <div class="why-kurly">
                                            <div class="col">
                                                <div class="icon">
                                                    <img src="detailimg/check.png">
                                                </div>
                                                <div class="info">
                                                    <div class="title">깐깐한 상품위원회</div>
                                                    <div class="desc">
                                                        <p>
                                                            나와 내 가족이 먹고 쓸 상품을 고르는
                                                            <br>
                                                            마음으로 매주 상품을 직접 먹어보고,
                                                            <br>
                                                            경험해보고 성분, 맛, 안정성 등 다각도의
                                                            <br>
                                                            기준을 통과한 상품만을 판매합니다.
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="icon">
                                                    <img src="detailimg/only.png" >
                                                </div>
                                                <div class="info">
                                                    <div class="title">차별화된 상품</div>
                                                    <div class="desc">
                                                        <p>
                                                            전국 각지와 해외의 훌륭한 생산자가
                                                            <br>
                                                            믿고 선택하는 파트너, 마켓컬리.
                                                            <br>
                                                            2천여 개가 넘는 컬리 단독 브랜드, 스펙의
                                                            <br>
                                                            상품을 믿고 만나보세요.
                                                        </p>
                                                        <span class="etc">
                                                            (온라인 기준 / 자사몰, 직구 제외)
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="icon">
                                                    <img src="detailimg/truck.png">
                                                </div>
                                                <div class="info">
                                                    <div class="title">신선한 풀콜드체인 배송</div>
                                                    <div class="desc">
                                                        <p>
                                                            온라인 업계 최초로 산지에서 문 앞까지
                                                            <br>
                                                            상온, 냉장, 냉동 상품을 분리 포장 후
                                                            <br>
                                                            최적의 온도를 유지하는 냉장 배송 시스템,
                                                            <br>
                                                            풀콜드체인으로 상품을 신선하게 전해드립니다.

                                                        </p>
                                                        <span class="etc">(샛별배송에 한함)</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="icon">
                                                    <img src="detailimg/price.png">
                                                </div>
                                                <div class="info">
                                                    <div class="title">고객, 생산자를 위한 최선의 가격</div>
                                                    <div class="desc">
                                                        <p>
                                                            매주 대형 마트와 주요 온라인 마트의 가격
                                                            <br>
                                                            변동 상황을 확인해 신선식품은 품질을
                                                            <br>
                                                            타협하지 않는 선에서 최선의 가격으로,
                                                            <br>
                                                            가공식품은 언제나 합리적인 가격으로
                                                            <br>
                                                            정기 조정합니다.
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="icon">
                                                    <img src="detailimg/eco.png">
                                                </div>
                                                <div class="info">
                                                    <div class="title">환경을 생각하는 지속 가능한 유통</div>
                                                    <div class="desc">
                                                        <p>
                                                            친환경 포장재부터 생산자가 상품에만
                                                            <br>
                                                            집중할 수 있는 직매입 유통구조까지,
                                                            <br>
                                                            지속 가능한 유통을 고민하며 컬리를 있게
                                                            <br>
                                                            하는 모든 환경(생산자, 커뮤니티, 직원)이
                                                            <br>
                                                            더 나아질 수 있도록 노력합니다.
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="happy_center fst">
                                <div class="happy">
                                    <h4 class="tit"  style="color:#4B62D3;">고객행복센터</h4>
                                    <p class="sub">
                                        <span class="emph">궁금하신 점이나 서비스 이용에 불편한 점이 있으신가요?</span>
                                        <span class="bar"></span>
                                        문제가 되는 부분을 사진으로 찍어 아래 중 편하신 방법으로 접수해 주시면 빠르게 도와드리겠습니다.
                                    </p>
                                </div>
                                <ul class="list">
                                    <li>
                                        <div  >
                                        <b style="font-weight:bolder; color:#4B62D3; font-size:14pt;">|&nbsp;전화 문의 </b>
                                         
                                        </div>
                                        <div class="sub">오전 8시~오후 4시 (평일) <br>
                                        (점심시간 오후 12시 - 오후 1시)</div>
                                    </li>
                                    <li style="list-style: none;">
                                        <div><b style="font-weight:bolder; color:#4B62D3; font-size:14pt;" >|&nbsp;카카오톡 문의</b>
                                       
                                        </div>
                                        <div class="sub">오전 8시~오후 4시 (평일)
                                        <br>
                                        (점심시간 오후 12시 - 오후 1시)</div>
                                        <div class="expend" style="">
                                            카카오톡에서 '새벽마켓'를 검색 후
                                            <br>
                                            대화창에 문의 및 불편사항을
                                            <br>
                                            남겨주세요
                                        </div>
                                    </li>
                                    <li style="list-style: none;">
                                        <div>
                                           <b style="font-weight:bolder; color:#4B62D3; font-size:14pt;">|&nbsp;홈페이지 문의</b> 
                                        </div>
                                        <div class="sub">
                                            24시간 접수 가능
                                            <br>
                                            로그인 > 새벽마켓 > 1:1문의
                                        </div>
                                        <div class="expend">                                            
                                            고객센터 운영 시간에 순차적으로 답변해드리겠습니다.
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="happy_center order">
                                <div class="happy unfold">
                                    <h4 class="tit" style="color:#4B62D3; " >주문 취소 안내</h4>
                                    <ul class="sub" style="list-style: none; position:s relative; bottom: -10px;" >
                                        <li >
                                            <strong class="emph" >[입금 확인] 단계</strong>                                            
                                            마이마켓 > 주문 내역 상세페이지에서 직접 취소하실 수 있습니다.
                                        </li>
                                        <li>
                                            <strong class="emph">[입금 확인] 이후 단계</strong>                                                                                        
                                            고객행복센터로 문의해주세요.
                                        </li>
                                        <li>
                                            <strong class="emph">결제 승인 취소 / 환불</strong>                                                                                        
                                            결제 수단에 따라 영업일 기준 3~7일 내에 처리해드립니다.
                                        </li>
                                    </ul>

                                </div>
                            </div>
                            <div class="happy_center lst">
                                <div class="happy unfold">
                                    <h4 class="tit" style="color:#4B62D3;">교환 및 환불 안내</h4>
                                    <p class="sub" style="position: relative; bottom: -10px;" >
                                        고객님의 단순 변심으로 인한 반품은 어려울 수 있으니 양해 부탁드립니다.</p>
                                </div>
                            </div>
                        </div>
                        <ul class="goods-view-infomation-tab-group" style="margin-left: 20%; ">
                            <li class="goods-view-infomation-tab">
                                <a href="#goods-description" class="goods-view-infomation-tab-anchor">상품설명</a>
                            </li>
                            
                            <li class="goods-view-infomation-tab">
                                <a href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a>
                            </li>
                            <li class="goods-view-infomation-tab">
                                <a href="#goods-review" class="goods-view-infomation-tab-anchor __active">
                                    고객후기
                                    <span class="count_review">(<%=reviewSize%>)</span>
                                </a>
                            </li>
                            
                        </ul>
                        <div class="goods-view-infomation-content" id="goods-review"> <!-- 아래 주소창에 good_review_list.html url 넣어주면 됩니당-->
                             <iframe src="review/reviewList.jsp?item_num=<%=item_num %>" id="inreview" frameborder="0" class="goods-view-infomation-board" height="4000"></iframe>
                            <%-- <jsp:include page="review/reviewList.jsp?item_num=<%=item_num %>"></jsp:include> --%>
                        </div>
                        
                    </div>
                </div>
            </div>

        </div>
        </div>

</body>
</html>