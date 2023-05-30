<%@page import="data.dao.ItemDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Random"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.CartDao"%>
<%@page import="data.dto.CartDto"%>

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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<%

//로그인 상태확인
String loginok=(String)session.getAttribute("loginok");

String myid="";
CartDto cdto=new CartDto();
CartDao cdao=new CartDao();
MemberDao mdao=new MemberDao();
MemberDto mdto=new MemberDto();
ItemDao idao=new ItemDao();
//로그인 상태라면 아이디 가져오기
if(loginok!=null){
   myid=(String)session.getAttribute("myid");
   
   //사용자 member_dto 가져오기
   mdto=mdao.getMemberById(myid);
   //System.out.println(mdto.getMember_name()+"님의 메일은 "+mdto.getMember_email()+"입니다.");
}

%>

<style type="text/css">

   /*체크박스모양 바꾸기*/
   input[type="checkbox"] {
   
   
       display:none;
       appearance: none;
   
   
   }
   
   
   input[type="checkbox"] {
   
   
       display: inline-block;
   
   
       width: 25px;
       height: 25px;
   
      margin: -2px 10px 0 0;
   
       vertical-align: middle;
   
       background-size: cover;
       
       background: url(imgsource/checkbox_default.png) no-repeat;
   
   
   }
   
   input[type="checkbox"]:checked {
   
   
        background-size: cover;
        
        background: url(imgsource/checkbox_checked.png) no-repeat;
        
   }
   
   input[type="checkbox"]:focus {
      outline:none;
   }
   
   /* Chrome, Safari, Edge, Opera */
   input::-webkit-outer-spin-button,
   input::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
   }
   
   /* Firefox */
   input[type=number] {
     -moz-appearance: textfield;
   }
   
   div.cart_container{
      width: 100%;
   }
   
   .cart_inner{
      margin: 10px auto;
      width: 1100px;
   }
   
   div.cartwrapper{
      width: 70%;
      margin-right: 4%;
      float: left;
   }
   
   div.cartwrapper>div{
      float: left;
   }
   
   div.cartlist_div{
      width: 100%;
   }
   
   div.cartlist_header{
      border-bottom: 1px solid black;
      padding-bottom: 10px;
      margin-left: 10px;
      height: 35px;
   }
   
   span.line{
      color: lightgray;
      padding: 0px 20px 0px 20px;
   }
   
   .content{
      margin-top: 15px;
      margin-bottom: 10px;
   }
   
   .cart_title{
      margin-left: 10px;
      height: 35px;
      line-height: 35px;
   }
   
   .cart_title>span{
      float: left;
      margin-right: 10px;
   }
   
   .icon{
      padding: 0px 3px 6px 5px;
      height: 30px;
   }
   
   .nextline{
      clear: both;
   }
   
   .categoryTitle{
      font-size: 13pt;
   }
   
   .list_content{
      margin-left: 10px;
      margin-bottom: 10px;
      width: 100%;
   }
   
   /*
   .list_content>div{
      float: left;
   }*/
   
   .item_check{
      width: 5%;
   }
   
   td.item_img{
      width: 10%;
   }
   
   td.item_img img{
   	width: 100%; 
   }
   
   .item_name{
      width: 50%;
      padding-left: 15px;
      font-weight: bold;
      font-size: 11pt;
   }
   
   .item_cnt{
      width: 100px;
      text-align: right;
      float: left;
      height: 50px;
      padding-top: 30px;
   }
   
   .item_cnt button{
   	border: 0px;
   	background: none;
   }
   
   .item_price{
      width: 14%;
      height: 50px;
      text-align: right;
      font-weight: bold;
      font-size: 12pt;
   }
   
   .itemDel{
      width: 7%;
      text-align: center;
   }
   
   .itemDel button{
   	border: 0px;
   	background: none;
   }
   
   .cnt_btn_wrapper{
      width: 85%;
      height: 30px;
      line-height: 30px;
      float: left;
      text-align: center;
      border: 1px solid lightgray;
      border-radius: 5px;
   }
   
   button:focus{
      outline: none;
   }
   
   .cnt_btn{
      width: 30%;
      /* text-align: center; */
      font-size: 10pt;
      font-weight: bold;
      padding: 0px 5px 0px 5px;
      height: 30px;
      line-height: 30px;
   }
   
   .cart_cnt{
      display: inline-block;
      width: 30%;
        text-align: center;
        background: none;
        font-size: 12pt;
        margin: 0 auto;
        padding: 0px;
   }
   
   .nextitem_line{
      width: 100%;
      border-top: 1px 
   }
   
   .subline{
      margin-top: 25px;
      margin-bottom: 25px;
      border: 1px solid #EFEFEF;
      width: 100%;
   }
   
   #selDel{
      cursor: pointer;
   }
   
   .cartClose, .cartOpen{
      width: 100%;
      text-align: right;
      cursor: pointer;
   }
   
   .cart_header_title{
      margin-top: 50px;
      margin-bottom: 70px;
      width: 100%;
      text-align: center;
      font-size: 21pt;
   }
   
</style>

<style type="text/css">
   .buyingwrapper{
      width: 26%;
      height: 550px;
      float: left;
      margin-top: 35px;
   }
   
   .buyingwrapper span{
      display: inline-block;
   }
   
   .buying_div{
      width: 100%;
      height: 78%;
      border: 1px solid #EFEFEF;
      background-color: #EFEFEF;
   }
   
   .delivery_div{
      text-align: center;
      width: 100%;
      height: 12%;
      margin-top: 5%;
      margin-bottom: 5%;
   }
   
   .buying_title{
      width: 50%; 
      margin-right: 5%; 
      text-align: left; 
      float: left
   }
   
   .buying_content{
      width: 45%; 
      text-align: right; 
      float: left
   }
   
   .buying_addr{
      width: 100%;
      height: 40%;
      font-size: 11pt;
      font-weight: bold;
      padding: 20px;
      background-color: white;
   }
   
   #find_bying_addr{
      width: 100%;
      padding: 8px;
      font-size: 8.5pt;
      color: #4B62D3;
      border: 1px solid #4B62D3;
      border-radius: 5px;
      margin-top: 20px;
      margin-bottom: 25px;
      background: white;
   }
   
   .buying_amount{
      width: 100%;
      height: 60%;
      padding: 20px;
      font-size: 12pt;
   }
   
   .buying_amount div{
      margin-bottom: 15px;
   }
   
   #delivery_btn{
      width: 100%;
      height: 100%;
      background-color: #4B62D3;
      color: white;
      font-size: 13pt;
      border-radius: 5px;
   }
   
   .total_price2{
      font-size: 10pt;
   }
   
   table a{
   	text-decoration: none;
   	color: black;
   }
   
   table a:hover {
	text-decoration: none;
	color: black;
	}
</style>

<script>

$(function(){
   /*

   td.item_img>img

   td.item_name>span

   td.item_cnt>span (=#cart_cnt)

   td.item_price>span

   td.itemDel>button (삭제버튼)

   */
   
   $(".cartOpen").hide();
   $("input.allCheck").attr("checked",true);
   $("input.one_check").attr("checked",true);
   $(".chk_cnt").text($("input.one_check").length);
   
   amount();
   
   //체크박스 옆 글자선택해도 체크박스 선택되게
   $("b.allCheck").click(function(){
   
      if($("input.allCheck").is(":checked")){
         $("input.allCheck").attr("checked",false);
      }else{
         $("input.allCheck").attr("checked","checked");
      }
      
      amount();
   });
   
   //상품개수가 최소치(=1)라면 -를 비활성화
   $(".cart_cnt").each(function(i,ele){
      if(Number($(ele).text())==1){
         $(".cnt_minus").eq(i).css("color","lightgray");
         $(".cnt_minus").eq(i).css("cursor","default");
      }
   });
   
   //+버튼
   $(".cnt_plus").each(function(i,ele){
      $(ele).click(function(){
         
            var cnt=Number($(".cart_cnt").eq(i).text());
            
            //ajax로 cart테이블 수량 변경
            $.ajax({
               type:"get",
               dataType:"html",
               url:"cart/cartCntChange.jsp",
               data:{"cart_num":$(".one_check").eq(i).val(),"cart_cnt":cnt+1},
               success:function(res){
                  $(".cart_cnt").eq(i).text(cnt+1);
                  $(".cnt_minus").eq(i).css("color","black");
                  $(".cnt_minus").eq(i).css("cursor","pointer");
                  
                  //해당 상품의 하나의 값
                  var one_price=$(".total_price").eq(i).attr("one_price");
                  var one_price2=$(".total_price").eq(i).siblings(".total_price2").attr("one_price2");
                  
                  //가격 하나 더한 가격
                  var total_price=one_price*(cnt+1);
                  var total_price2=one_price2*(cnt+1);
                  $(".total_price").eq(i).text(total_price.toLocaleString('ko-KR',{maximumFractionDigits: 0})+"원");
                  $(".total_price").eq(i).siblings(".total_price2").text(total_price2.toLocaleString('ko-KR',{maximumFractionDigits: 0})+"원");
                  
                  $(".total_price").eq(i).attr("total",total_price);
                  $(".total_price").eq(i).siblings(".total_price2").attr("total2",total_price2);
                  
                  amount();
               }
            });
         
      });
   });
   
   //-버튼
   $(".cnt_minus").each(function(i,ele){
      $(ele).click(function(){
         
            var cnt=Number($(".cart_cnt").eq(i).text());
            
            if(cnt!=1){
               //ajax로 cart테이블 수량 변경
               $.ajax({
                  type:"get",
                  dataType:"html",
                  url:"cart/cartCntChange.jsp",
                  data:{"cart_num":$(".one_check").eq(i).val(),"cart_cnt":cnt-1},
                  success:function(res){
                     $(".cart_cnt").eq(i).text(cnt-1);
                     $(".cnt_minus").eq(i).css("color","black");
                     $(".cnt_minus").eq(i).css("cursor","pointer");
                     
                     //해당 상품의 하나의 값
                     var one_price=$(".total_price").eq(i).attr("one_price");
                     var one_price2=$(".total_price").eq(i).siblings(".total_price2").attr("one_price2");
                     
                     //가격 하나 더한 가격
                     var total_price=one_price*(cnt-1);
                     var total_price2=one_price2*(cnt-1);
                     $(".total_price").eq(i).text(total_price.toLocaleString('ko-KR',{maximumFractionDigits: 0})+"원");
                     $(".total_price").eq(i).siblings(".total_price2").text(total_price2.toLocaleString('ko-KR',{maximumFractionDigits: 0})+"원");
                     
                     $(".total_price").eq(i).attr("total",total_price);
                     $(".total_price").eq(i).siblings(".total_price2").attr("total2",total_price2);
                     
                     amount();
                     
                     if(cnt==2){
                        //1이라면
                        $(".cnt_minus").eq(i).css("color","lightgray");
                        $(".cnt_minus").eq(i).css("cursor","default");
                     }
                  }
               });
            }
            if(cnt==1){
               //1이라면
               $(".cnt_minus").eq(i).css("color","lightgray");
               $(".cnt_minus").eq(i).css("cursor","default");
            }
         
      });
   });
   
   //전체선택
   $("input.allCheck").click(function(){
      if($(this).is(":checked")){
         $("input.one_check:visible").prop('checked',true);
         $(".chk_cnt").text($("input.one_check:checked").length);
      }else{
         $("input.one_check:visible").prop('checked',false);
         $(".chk_cnt").text($("input.one_check:checked").length);
         
         amount();
      }
   });
   
   //개별 선택시에도 전체선택 옆에 숫자 증가
   $("input.one_check").each(function(i,ele){
      $(ele).click(function(){
         if($(this).is(":checked")){
            $(".chk_cnt").text($("input.one_check:checked").length);
         }else{
            $(".chk_cnt").text($("input.one_check:checked").length);
         }
         
         amount();
      });
   });
   
   //삭제
   $(".itemDel button").each(function(i,ele){
      $(ele).click(function(){
         //삭제 액션 실행후
         var cart_num=$(ele).val();
         $.ajax({
            type:"get",
            dataType:"html",
            url:"cart/deleteCart.jsp",
            data:{"cart_num":cart_num},
            success:function(){
               //console.log($("input.one_check").eq(i).is(":checked"));
               //삭제한 상품 숨기기(hide)
               
               $(".list_content").eq(i).css("display","none");
               
               //만약 삭제한 상품이 체크된 상태라면 체크값 해제+체크개수에서 빼주기
               
               if($("input.one_check").eq(i).is(":checked")==true){
                  var cnt=Number($(".chk_cnt").text());
                  console.log(cnt);
                  $(".chk_cnt").text(--cnt);
                  //삭제한 상품 체크 해제
                  $("input.one_check").eq(i).attr("checked",false);
               }
               
               var cold_null=false;
               var freeze_null=false;
               var room_null=false;
               
               //만약 자신의 subline의 visibility가 hidden이라면 다음 subline의 visibility 또한 hidden으로 만들기
               if($(".subline").eq(i).css("visibility")=="hidden"){
                  $(".subline").eq(i+1).css("visibility","hidden").css("margin-bottom","0px");
               }
               
               //냉장 상품이 전부 비었는지 확인
               $(".cartlist_cold .list_content").each(function(i,ele){
                  if($(ele).css("display")=="none"){
                     cold_null=true;
                  }else{
                     cold_null=false;
                     return false;
                  }
               });
               
               //냉장 상품이 전부 비었다면 냉장 상품란 지우기
               if(cold_null){
                  $(".cold_title").hide();
                  $(".cold_title").removeClass("cart_title");
                  $(".cartlist_cold").next(".cartlist_header").css("border","0px").css("padding-bottom","0px").css("height","0px");
               }
               
               //냉동 상품이 전부 비었는지 확인
               $(".cartlist_freeze .list_content").each(function(i,ele){
                  if($(ele).css("display")=="none"){
                     freeze_null=true;
                  }else{
                     freeze_null=false;
                     return false;
                  }
               });
               
               //냉동 상품이 전부 비었다면 상온 상품란 지우기
               if(freeze_null){
                  $(".freeze_title").hide();
                  $(".freeze_title").removeClass("cart_title");
                  $(".cartlist_freeze").prev(".cartlist_header").css("border","0px").css("padding-bottom","0px").css("height","0px");
                  if(cold_null){
                     $(".cartlist_room").prev(".cartlist_header").css("border","0px").css("padding-bottom","0px").css("height","0px");
                  }
               }
               
               //상온 상품이 전부 비었는지 확인
               $(".cartlist_room .list_content").each(function(i,ele){
                  if($(ele).css("display")=="none"){
                     room_null=true;
                  }else{
                     room_null=false;
                     return false;
                  }
               });
               
               //상온 상품이 전부 비었다면 냉동 상품란 지우기
               if(room_null){
                  $(".room_title").hide();
                  $(".room_title").removeClass("cart_title");
                  $(".cartlist_room").prev(".cartlist_header").css("border","0px").css("padding-bottom","0px").css("height","0px");
               }
               
               //총 개수 수정
               var total_cnt=Number($(".total_cnt").text());
               $(".total_cnt").text(--total_cnt);
               
               amount();
            }
         })
         
      });
   });
   
   //전체삭제
   $("#selDel").click(function(){
      if($(".chk_cnt").text()==0){
         alert("삭제할 상품을 선택해주세요.");
         return false;
      }
      
      $(".one_check").each(function(i,ele){
         if($(ele).is(":checked")==true){
            //console.log("선택");
            var cart_num=$(ele).val();
            $.ajax({
               type:"get",
               dataType:"html",
               url:"cart/deleteCart.jsp",
               data:{"cart_num":cart_num},
               success:function(){
                  //console.log($("input.one_check").eq(i).is(":checked"));
                  //삭제한 상품 숨기기(hide)
                  
                  $(".list_content").eq(i).css("display","none");
                  
                  //만약 삭제한 상품이 체크된 상태라면 체크값 해제+체크개수에서 빼주기
                  var cnt=Number($(".chk_cnt").text());
                  $(".chk_cnt").text(--cnt);
                  //삭제한 상품 체크 해제
                  //전체선택 해제
                  $(".allCheck").attr("checked",false);
                  $(ele).attr("checked",false);
                  
                  
                  var cold_null=false;
                  var freeze_null=false;
                  var room_null=false;
                  
                  //만약 자신의 subline의 visibility가 hidden이라면 다음 subline의 visibility 또한 hidden으로 만들기
                  if($(".subline").eq(i).css("visibility")=="hidden"){
                     $(".subline").eq(i+1).css("visibility","hidden").css("margin-bottom","0px");
                  }
                  
                  //냉장 상품이 전부 비었는지 확인
                  $(".cartlist_cold .list_content").each(function(i,ele){
                     if($(ele).css("display")=="none"){
                        cold_null=true;
                     }else{
                        cold_null=false;
                        return false;
                     }
                  });
                  
                  //냉장 상품이 전부 비었다면 냉장 상품란 지우기
                  if(cold_null){
                     $(".cold_title").hide();
                     $(".cold_title").removeClass("cart_title");
                     $(".cartlist_cold").next(".cartlist_header").css("border","0px").css("padding-bottom","0px").css("height","0px");
                  }
                  
                  //냉동 상품이 전부 비었는지 확인
                  $(".cartlist_freeze .list_content").each(function(i,ele){
                     if($(ele).css("display")=="none"){
                        freeze_null=true;
                     }else{
                        freeze_null=false;
                        return false;
                     }
                  });
                  
                  //냉동 상품이 전부 비었다면 상온 상품란 지우기
                  if(freeze_null){
                     $(".freeze_title").hide();
                     $(".freeze_title").removeClass("cart_title");
                     $(".cartlist_freeze").prev(".cartlist_header").css("border","0px").css("padding-bottom","0px").css("height","0px");
                     if(cold_null){
                        $(".cartlist_room").prev(".cartlist_header").css("border","0px").css("padding-bottom","0px").css("height","0px");
                     }
                  }
                  
                  //상온 상품이 전부 비었는지 확인
                  $(".cartlist_room .list_content").each(function(i,ele){
                     if($(ele).css("display")=="none"){
                        room_null=true;
                     }else{
                        room_null=false;
                        return false;
                     }
                  });
                  
                  //상온 상품이 전부 비었다면 냉동 상품란 지우기
                  if(room_null){
                     $(".room_title").hide();
                     $(".room_title").removeClass("cart_title");
                     $(".cartlist_room").prev(".cartlist_header").css("border","0px").css("padding-bottom","0px").css("height","0px");
                  }
                  
                  //총 개수 수정
                  var total_cnt=Number($(".total_cnt").text());
                  $(".total_cnt").text(--total_cnt);
               }
            })
         }
      });
      location.reload();
      
   });
   
   // 각 상품 목록 닫기
   $(".cartClose").each(function(i,ele){
      $(ele).click(function(){
         $(ele).hide();
         $(".cartOpen").eq(i).show();
         //margin-bottom
         $(".cart_title").eq(i).css("margin-bottom","0px");
         $(".content").eq(i).find(".list_content").each(function(idx,elt){
            $(elt).hide();
         });
      });
   });
   
   //각 상품 목록 열기
   $(".cartOpen").each(function(i,ele){
      $(ele).click(function(){
         $(ele).hide();
         $(".cartClose").eq(i).show();
         //margin-bottom
         $(".cart_title").eq(i).css("margin-bottom","25px");
         $(".content").eq(i).find(".list_content").each(function(idx,elt){
            $(elt).show();
         });
      });
   });
   
});

function amount(){
   var item_amount=0;
   var off=0;
      
   $("input.one_check").each(function(i,ele){
      if($(ele).is(":checked")){
         item_amount+=Number($(".total_price").eq(i).attr("total"));
   
         //할인된 총 가격 가져오기
         //var total2=$(".total_price").eq(i).siblings(".total_price2").attr("total2");
         //total_price2=할인되기 전 원가
         //total_price=할인된 가격<-total_price2가 존재할 때 한정
            
         //var total2=(Number)($(ele).attr("total2"));
         //var total=(Number)($(ele).siblings(".total_price").attr("total"));
            
         //off=total2-total;
         
         if($(".total_price").eq(i).siblings(".total_price2").length>0){
            var total2=$(".total_price").eq(i).siblings(".total_price2").attr("total2");
            var total=(Number)($(".total_price").eq(i).attr("total"));
            off+=Number(total2)-total;
         }
      }
   });
   
   $(".item_amount").attr("item_amount",item_amount+off);
   $(".item_amount").text((item_amount+off).toLocaleString('ko-KR')+"원");
   
   $(".off").attr("off",off);
   $(".off").text(off.toLocaleString('ko-KR')+"원");
   
   var delivery=2500;
   $(".delivery").attr("delivery",2500);
   $(".delivery").text(delivery.toLocaleString('ko-KR')+"원");
   
   var amount=item_amount+delivery;
   $(".buying_amount").attr("buying_amount",amount);
   $(".buying_amount b").text(amount.toLocaleString('ko-KR'));
   
   console.log("amount실행");
   
}

//주소찾기 api
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            
            } else {
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $("#bying_addr").text(addr);
            var popup=window.open( "cart/detailAddrWindow.jsp", "detailAddr", "width=600, height=500, top=50, left=50" );
            
            //팜업창 닫았을 때 사용자 주소(멤버테이블)변경
            popup.onbeforeunload = function() {
               $.ajax({
                   type:"get",
                   dataType:"html",
                   url:"cart/memberChangeAddr.jsp",
                   data:{"member_addr":$("#bying_addr").text()},
                   success:function(){
                      console.log("success");
                   }
                });
            };
            // 커서를 상세주소 필드로 이동한다.
            //document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

</script>

<body>
	<div class = "container">
		<div class="cart_container" style="width: 100%;">
      <div class="cart_inner">
         <div class="cart_header_title">
            <b>장바구니</b>
         </div>
      
         <!-- (왼쪽)장바구니 목록 -->
         <div class="cartwrapper" style="height: 100%;">
            <!-- 왼쪽 장바구니 목록창 -->
            
            
            <% 
               String member_num=mdto.getMember_num();
               //System.out.println(member_num);
               List<HashMap<String,String>> list=cdao.getAllUserCart(member_num);
               NumberFormat nf=NumberFormat.getNumberInstance();
               
               List<HashMap<String,String>> cold=new ArrayList<HashMap<String,String>>();
               List<HashMap<String,String>> freeze=new ArrayList<HashMap<String,String>>();
               List<HashMap<String,String>> room=new ArrayList<HashMap<String,String>>();
               
               for(HashMap<String,String> c:list){
                  
                  //냉장 리스트
                  if(c.get("item_package_type").contains("냉장")){
                     cold.add(c);
                  }
                  
                  //냉동 리스트
                  if(c.get("item_package_type").contains("냉동")){
                     freeze.add(c);
                  }
                  
                  //상온 리스트
                  if(c.get("item_package_type").contains("상온")){
                     room.add(c);
                  }
                  
               }
               
               int total_cnt=cold.size()+freeze.size()+room.size();
                  
                  //다시 아래에 냉장 리스트 for문, 냉동 리스트 for문, 상온 리스트 for문 돌리기
                  
            %>
            
            <div class="cartlist_div">
               <div class="cartlist_header">
                  <b class="allCheck"><input type="checkbox" class="allCheck">&nbsp;전체선택(<span class="chk_cnt">0</span>/<span class="total_cnt"><%=total_cnt %></span>)</b>
                  <span class="line">|</span>
                  <span id="selDel"><b>선택삭제</b></span>
               </div>
               
                  <div class="cartlist_content">
                  <%
                  //냉장
                  if(cold.size()!=0){%>
                     <div class="cartlist_cold content">
                     <div class="cold_title cart_title">
                        <!-- 폰트어썸 -->
                        <span class="icon"><i class="fa-solid fa-droplet fa-xl"
                         style="color: green;"></i></span>
                        <span class="categoryTitle"><b>냉장 상품</b></span>
                        <div class="cartClose"><i class="fa-solid fa-chevron-up"></i></div>
                        <div class="cartOpen"><i class="fa-solid fa-chevron-down"></i></div>
                        <div class="nextline"></div>
                     </div>
                  <%
                     int isfirst=0;
                     for(HashMap<String,String> item:cold){ 
                        isfirst++;
                        int total_price=(Integer.parseInt(item.get("item_price")))*(Integer.parseInt(item.get("cart_cnt")));
                  %>
                        <!-- 장바구니에 담긴 냉장 상품 -->
                           <div class="list_content">
                              <% 
                              if(isfirst!=1){%>
                              <div class="subline"></div>
                              <%}else{ %>
                              <div class="subline" style="visibility: hidden; margin-bottom: 0px;"></div>
                              <%} %>
                              <table style="width: 100%">
                                 <tr>
                                    <td class="item_check">
                                       <input type="checkbox" class="one_check" value="<%=item.get("cart_num") %>">
                                    </td>
                                    <td class="item_img">
                                       <a href="index.jsp?main=detail/detailView.jsp?item_num=<%=item.get("item_num") %>">
                                       <img src="itemImg/<%=item.get("item_img") %>">
                                       </a>
                                    </td>
                                    <td class="item_name">
                                    	<a href="index.jsp?main=detail/detailView.jsp?item_num=<%=item.get("item_num") %>">
                                       <span><%=item.get("item_name") %></span>
                                       </a>
                                    </td>
                                    <td class="item_cnt">
                                       <div class="cnt_btn_wrapper">
                                          <button class="cnt_btn cnt_minus">
                                             <i class="fa-solid fa-minus"></i>
                                          </button>
                                          <span class="cart_cnt"><%=item.get("cart_cnt") %></span>
                                          <button class="cnt_btn cnt_plus">
                                             <i class="fa-solid fa-plus"></i>
                                          </button>
                                       </div>
                                    </td>
                                    <td class="item_price">
                                    <%
                                    String item_num=item.get("item_num");
                                    //할인하는 상품이라면(아이템이라면)
                                    if(idao.itemIsSale(item_num)){
                                       int total_price2=(idao.getSalePrice(item_num))*(Integer.parseInt(item.get("cart_cnt")));
                                    %>
                                       <span class="total_price" total=<%=total_price2 %> 
                                       one_price="<%=idao.getSalePrice(item_num) %>"><%=nf.format(total_price2) %>원</span>         
                                       <br><strike class="total_price2" total2=<%=total_price %> 
                                       one_price2="<%=idao.getItemData(item_num).getItem_price() %>"><%=nf.format(total_price) %>원</strike>
                                    <%}
                                    //할인하는 상품이(아이템이) 아니라면
                                    else{%>
                                       <span class="total_price" total=<%=total_price %> 
                                       one_price="<%=idao.getItemData(item_num).getItem_price() %>"><%=nf.format(total_price) %>원</span>
                                    <%} %>
                                    </td>
                                    <td class="itemDel">
                                       <button type="button" value=<%=item.get("cart_num") %>>
                                          <i class="fa-solid fa-x" style="color: lightgray"></i>
                                       </button>
                                    </td>
                                 </tr>
                              </table>
                           </div>
                     
                  <%
                  
                     }
                  %>
                     <div class="nextline"></div>
                     <div class="nextitem_line"></div>
                  </div>
                  <%}
                  
                  ///냉동
                  
                  if(freeze.size()!=0 && cold.size()!=0){%>
                  <div class="cartlist_header"></div>
                  <% }
                  
                  if(freeze.size()!=0){%>
                  <div class="cartlist_freeze content">
                  <div class="freeze_title cart_title">
                     <!-- 폰트어썸 -->
                     <span class="icon"><i class="fa-regular fa-snowflake fa-xl"
                      style="color: skyblue;"></i></span>
                     <span class="categoryTitle"><b>냉동 상품</b></span>
                     <div class="cartClose"><i class="fa-solid fa-chevron-up"></i></div>
                     <div class="cartOpen"><i class="fa-solid fa-chevron-down"></i></div>
                  </div>
               <%
                  int isfirst=0;
                  for(HashMap<String,String> item:freeze){ 
                     isfirst++;
                     int total_price=Integer.parseInt(item.get("item_price"))*Integer.parseInt(item.get("cart_cnt"));
               %>
                     <!-- 장바구니에 담긴 냉장 상품 -->
                        <div class="list_content">
                           <% 
                           if(isfirst!=1){%>
                           <div class="subline"></div>
                           <%}else{ %>
                           <div class="subline" style="visibility: hidden; margin-bottom: 0px;"></div>
                           <%} %>
                           <table style="width: 100%">
                              <tr>
                                 <td class="item_check">
                                    <input type="checkbox" class="one_check" value="<%=item.get("cart_num") %>">
                                 </td>
                                 <td class="item_img">
                                 	<a href="index.jsp?main=detail/detailView.jsp?item_num=<%=item.get("item_num") %>">
                                    <img src="itemImg/<%=item.get("item_img") %>">
                                    </a>
                                 </td>
                                 <td class="item_name">
                                 	<a href="index.jsp?main=detail/detailView.jsp?item_num=<%=item.get("item_num") %>">
                                    <span><%=item.get("item_name") %></span>
                                    </a>
                                 </td>
                                 <td class="item_cnt">
                                    <div class="cnt_btn_wrapper">
                                       <button class="cnt_btn cnt_minus">
                                          <i class="fa-solid fa-minus"></i>
                                       </button>
                                       <span class="cart_cnt"><%=item.get("cart_cnt") %></span>
                                       <button class="cnt_btn cnt_plus">
                                          <i class="fa-solid fa-plus"></i>
                                       </button>
                                    </div>
                                 </td>
                                 <td class="item_price">
                                    <%
                                    String item_num=item.get("item_num");
                                    //할인하는 상품이라면(아이템이라면)
                                    if(idao.itemIsSale(item_num)){
                                       int total_price2=(idao.getSalePrice(item_num))*(Integer.parseInt(item.get("cart_cnt")));
                                    %>
                                       <span class="total_price" total=<%=total_price2 %> 
                                       one_price="<%=idao.getSalePrice(item_num) %>"><%=nf.format(total_price2) %>원</span>         
                                       <br><strike class="total_price2" total2=<%=total_price %> 
                                       one_price2="<%=idao.getItemData(item_num).getItem_price() %>"><%=nf.format(total_price) %>원</strike>
                                    <%}
                                    //할인하는 상품이(아이템이) 아니라면
                                    else{%>
                                       <span class="total_price" total=<%=total_price %> 
                                       one_price="<%=idao.getItemData(item_num).getItem_price() %>"><%=nf.format(total_price) %>원</span>
                                    <%} %>
                                 </td>
                                 <td class="itemDel">
                                    <button type="button" value=<%=item.get("cart_num") %>>
                                       <i class="fa-solid fa-x" style="color: lightgray"></i>
                                    </button>
                                 </td>
                              </tr>
                           </table>
                        </div>
                  
               <%
                  }
               %>
                  <div class="nextline"></div>
                  <div class="nextitem_line"></div>
               </div>
               <%}
                  ///상온
                  if(freeze.size()!=0 && room.size()!=0 || cold.size()!=0 && room.size()!=0){%>
                  <div class="cartlist_header"></div>
                  <% }
                  if(room.size()!=0){%>
                  <div class="cartlist_room content">
                  <div class="room_title cart_title">
                     <!-- 폰트어썸 -->
                     <span class="icon"><i class="fa-regular fa-sun fa-xl" 
                     style="color: #fea034;"></i></span>
                     <span class="categoryTitle"><b>상온 상품</b></span>
                     <div class="cartClose"><i class="fa-solid fa-chevron-up"></i></div>
                     <div class="cartOpen"><i class="fa-solid fa-chevron-down"></i></div>
                  </div>
               <%
                  int isfirst=0;
                  for(HashMap<String,String> item:room){ 
                     isfirst++;
                     int total_price=Integer.parseInt(item.get("item_price"))*Integer.parseInt(item.get("cart_cnt"));
               %>
                     <!-- 장바구니에 담긴 상온 상품 -->
                        <div class="list_content">
                           <% 
                           if(isfirst!=1){%>
                           <div class="subline"></div>
                           <%}else{ %>
                           <div class="subline" style="visibility: hidden; margin-bottom: 0px;"></div>
                           <%} %>
                           <table style="width: 100%">
                              <tr>
                                 <td class="item_check">
                                    <input type="checkbox" class="one_check" value="<%=item.get("cart_num") %>">
                                 </td>
                                 <td class="item_img">
                                 	<a href="index.jsp?main=detail/detailView.jsp?item_num=<%=item.get("item_num") %>">
                                    <img src="itemImg/<%=item.get("item_img") %>">
                                    </a>
                                 </td>
                                 <td class="item_name">
                                 	<a href="index.jsp?main=detail/detailView.jsp?item_num=<%=item.get("item_num") %>">
                                    <span><%=item.get("item_name") %></span>
                                    </a>
                                 </td>
                                 <td class="item_cnt">
                                    <div class="cnt_btn_wrapper">
                                       <button class="cnt_btn cnt_minus">
                                          <i class="fa-solid fa-minus"></i>
                                       </button>
                                       <span class="cart_cnt"><%=item.get("cart_cnt") %></span>
                                       <button class="cnt_btn cnt_plus">
                                          <i class="fa-solid fa-plus"></i>
                                       </button>
                                    </div>
                                 </td>
                                 <td class="item_price">
                                    <%
                                    String item_num=item.get("item_num");
                                    //할인하는 상품이라면(아이템이라면)
                                    if(idao.itemIsSale(item_num)){
                                       int total_price2=(idao.getSalePrice(item_num))*(Integer.parseInt(item.get("cart_cnt")));
                                    %>
                                       <span class="total_price" total=<%=total_price2 %> 
                                       one_price="<%=idao.getSalePrice(item_num) %>"><%=nf.format(total_price2) %>원</span>         
                                       <br><strike class="total_price2" total2=<%=total_price %> 
                                       one_price2="<%=idao.getItemData(item_num).getItem_price() %>"><%=nf.format(total_price) %>원</strike>
                                    <%}
                                    //할인하는 상품이(아이템이) 아니라면
                                    else{%>
                                       <span class="total_price" total=<%=total_price %> 
                                       one_price="<%=idao.getItemData(item_num).getItem_price() %>"><%=nf.format(total_price) %>원</span>
                                    <%} %>
                                 </td>
                                 <td class="itemDel">
                                    <button type="button" value=<%=item.get("cart_num") %>>
                                       <i class="fa-solid fa-x" style="color: lightgray"></i>
                                    </button>
                                 </td>
                              </tr>
                           </table>
                        </div>
                  
               <%
                  }
               %>
                  <div class="nextline"></div>
                  <div class="nextitem_line"></div>
               </div>
               <%}
               %>
                  </div>
            </div>
            
            <!-- 오른쪽 배송지/금액/주문창  -->
            <div class="order_div">
               
            </div>
         </div>
         
         <!-- (오른쪽)결제 정보 -->
         <div class="buyingwrapper">   
            <div class="buying_div" style="width: 100%;">
               <div class="buying_addr">
                  <i class="fa-solid fa-location-dot fa-lg"></i>
                  <span style="margin-bottom: 15px;">배송지</span>
                  <br>
                  <span id="bying_addr"><%=mdto.getMember_addr() %></span>
                  <br>
                  <button id="find_bying_addr" onclick="sample6_execDaumPostcode()">
                     <i class="fa-solid fa-magnifying-glass"></i>&nbsp;배송지 변경</button>
               </div>
               
               <div class="buying_amount">
                  <div>
                     <span class="buying_title">상품 금액</span>
                     <span item_amount=0 class="buying_content item_amount">원</span>
                  </div>
                  
                  <div class="nextline"></div>
                  
                  <div>
                     <span class="buying_title">상품 할인 금액</span>
                     <span off=0 class="buying_content off">원</span>
                  </div>
                  
                  <div class="nextline"></div>
                  
                  <div>
                     <span class="buying_title">배송비</span>
                     <span delivery=0 class="buying_content delivery">원</span>
                  </div>
                  
                  <div class="nextline"></div>
                  
                  <div>
                     <hr style="border-style: inset;">
                  </div>
                  
                  <div>
                     <span class="buying_title">결제예정금액</span>
                     <span buying_amount=0 class="buying_content buying_amount"><b style="font-size: 17pt;">1000</b>원</span>
                  </div>
                  
                  <div class="nextline"></div>
               </div>
            </div>
            
            <div class="delivery_div">
               <button id="delivery_btn" onclick="sample6_execDaumPostcode()">주문하기</button> 
            </div>
         </div>
      </div>
   </div>
		
	</div>

</body>
</html>