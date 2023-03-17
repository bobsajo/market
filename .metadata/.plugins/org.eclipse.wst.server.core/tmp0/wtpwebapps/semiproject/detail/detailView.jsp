<%@page import="data.Dto.itemDto"%>
<%@page import="java.util.List"%>
<%@page import="data.Dao.itemDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

    <link rel="stylesheet" href="./css/good_view.css">
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<style type="text/css">
#header, #container, #content {
    position: relative;
}


.section_view {
    width: 1050px;
    margin: 0 auto;
    padding-top: 20px;
    height: 885px;
}


.section_view * {
    font-family: noto sans;
    color: #333;
    letter-spacing: -.5px;
}

#sectionView .thumb {
    float: left;
    background-color: #eee;
    background-position: 50% 50%;
    background-repeat: no-repeat;
    background-size: cover;
}


#sectionView .thumb .bg {
    width: 430px;
    height: 552px;
}

#sectionView .goods_name {
    float: right;
    width: 560px;
    padding: 10px 0 29px;
}

#sectionView .btn_share {
    display: block;
    position: relative;
}

#sectionView #btnShare {
    overflow: hidden;
    position: absolute;
    right: 0;
    top: 0;
    width: 40px;
    height: 40px;
    border: 0;
    background: url(https://res.kurly.com/mobile/service/goodsview/1910/ico_view_sns.png) no-repeat 50% 50%;
    font-size: 0;
    text-indent: -9999px;
}


#sectionView .goods_name .name {
    display: block;
    padding-right: 60px;
    font-weight: 700;
    font-size: 24px;
    line-height: 34px;
    word-break: break-all;
}


#sectionView .goods_name .short_desc {
    display: block;
    padding: 4px 60px 0 0;
    font-size: 14px;
    color: #999;
    line-height: 20px;
    word-break: break-all;
}


#sectionView .goods_price {
    float: right;
    width: 560px;
    padding: 0 20px 0 0;
}

#sectionView .goods_price .dc {
    display: block;
    padding-top: 4px;
}

#sectionView .goods_price .dc_price {
    font-weight: 700;
    font-size: 28px;
    line-height: 30px;
    letter-spacing: 0;
    word-break: break-all;
}


#sectionView .goods_price .dc .won {
    padding: 0 7px 0 2px;
    font-weight: 700;
    font-size: 18px;
    line-height: 30px;
    vertical-align: 2px;
    letter-spacing: 0;
}

#sectionView .goods_price .txt_benefit {
    display: block;
    overflow: hidden;
    padding-top: 11px;
}


#sectionView .goods_price .grade6 {
    border: 1px solid #949296;
    color: #949296;
}


#sectionView .goods_price .ico_grade {
    float: left;
    height: 22px;
    margin-right: 6px;
    padding: 0 8px;
    border-radius: 12px;
    font-weight: 700;
    font-size: 12px;
    
    line-height: 19px;
    text-align: center;
}

#sectionView .goods_price .point {
    float: left;
    padding-top: 1px;
    font-size: 14px;
    line-height: 18px;
}

#sectionView .goods_price .emph {
    font-weight: 700;
}


.emphh{
    font-weight: 700;
}



#sectionView .goods_info {
    float: right;
    width: 560px;
    margin-top: 19px;
    padding-bottom: 19px;
    border-top: 1px solid #f4f4f4;
}

#sectionView .goods_info .list.fst {
    padding-bottom: 0;
    border-bottom: 0;
}

#sectionView .goods_info .list {
    overflow: hidden;
    padding: 18px 0;
    border-bottom: 1px solid #f4f4f4;
}

#sectionView .goods_info .tit {
    float: left;
    width: 150px;
    font-size: 14px;
    color: #666;
    line-height: 20px;
}

#sectionView .goods_info .desc {
    overflow: hidden;
    font-size: 14px;
    line-height: 20px;
    word-break: break-all;
}


#sectionView .goods_info .emph {
    display: block;
    padding-top: 4px;
    font-weight: 400;
    font-size: 12px;
    color: #666;
    line-height: 16px;
}

.emphd{
    display: block;
    padding-top: 4px;
    font-weight: 400;
    font-size: 12px;
    color: #666;
    line-height: 16px;
}


#cartPut .cart_type2 {
    float: right;
    width: 560px;
    padding-bottom: 40px;
}


#cartPut .cart_option {
    background-color: #fff;
}

#cartPut .cart_type2 .list_goods {
    padding-bottom: 18px;
}


#cartPut .cart_type2 .list_nopackage {
    padding: 0;
}


#cartPut .cart_option .list {
    overflow: hidden;
    padding-bottom: 1px;
}

#cartPut .cart_type2 .list_nopackage li {
    float: none;
    width: 100%;
    padding: 0 0 5px;
    margin: 0;
    border: 0;
}

#cartPut .cart_type2 .list_nopackage .tit_item {
    float: left;
    width: 150px;
    font-weight: 400;
    font-size: 14px;
    color: #666;
    line-height: 20px;
    letter-spacing: -.5px;
}

#cartPut .cart_type2 .list_nopackage .option {
    padding-top: 0;
}

#cartPut .cart_option .list .count {
    overflow: hidden;
    float: left;
    width: 88px;
    height: 30px;
    border: 1px solid #dddfe1;
    border-radius: 3px;
}

#cartPut .cart_option .list .down.on {
    background-image: url(https://res.kurly.com/pc/ico/2010/ico_minus_on.svg);
}

#cartPut .cart_option .list .down {
    background: #fff url(https://res.kurly.com/pc/ico/2010/ico_minus.svg) no-repeat 50% 50%;
    background-size: 30px 30px;
}

#cartPut .cart_option .list .inp {
    float: left;
    width: 30px;
    height: 30px;
    margin-right: -1px;
    padding: 0 0 4px;
    border: 0;
    background-color: #fff;
    font-size: 14px;
    color: #000;
    line-height: 18px;
    text-align: center;
}

#cartPut .cart_option .list .up.on {
    background-image: url(https://res.kurly.com/pc/ico/2010/ico_plus_on.svg);
}

#cartPut .cart_option .list .up {
    float: right;
    background: #fff url(https://res.kurly.com/pc/ico/2010/ico_plus.svg) no-repeat 50% 50%;
    background-size: 30px 30px;
}

#cartPut .cart_option .list .btn {
    overflow: hidden;
    float: left;
    width: 28px;
    height: 28px;
    border: 0;
    font-size: 0;
    line-height: 0;
    text-indent: -9999px;
}

#cartPut .cart_type2 .total {
    padding: 30px 0 14px;
    border-top: 1px solid #f4f4f4;
}

#cartPut .cart_option .total .price {
    overflow: hidden;
    text-align: right;
}


#cartPut .cart_option .total .tit {
    font-weight: 700;
    font-size: 13px;
    line-height: 20px;
    vertical-align: 2px;
}

#cartPut .cart_option .total .num {
    padding-left: 8px;
    font-weight: 800;
    font-size: 32px;
    line-height: 32px;
}

#cartPut .cart_option .total .won {
    padding-left: 2px;
    font-size: 20px;
    font-weight: 700;
    line-height: 20px;
    vertical-align: -1px;
}

#cartPut .cart_type2 .in_option .total .txt_point {
    padding-top: 13px;
}

#cartPut .cart_option .total .txt_point {
    display: block;
    padding-top: 14px;
    font-size: 14px;
    color: #666;
    line-height: 20px;
    text-align: right;
}

#cartPut .cart_option .total .ico {
    display: inline-block;
    width: 38px;
    height: 20px;
    margin-right: 2px;
    border: 1px solid #e8a828;
    border-radius: 10px;
    background-color: #ffbf00;
    font-weight: 700;
    font-size: 11px;
    color: #fff;
    line-height: 18px;
    text-align: center;
    vertical-align: 1px;
}

#cartPut .cart_option .total .emph {
    font-weight: 700;
}

#cartPut .cart_option .group_btn {
    overflow: hidden;
    width: 100%;
}

#cartPut .cart_type2 .view_function {
    display: block;
    float: left;
    width: 280px;
}

#cartPut .cart_option .view_function .btn {
    overflow: hidden;
    float: right;
    width: 128px;
    height: 56px;
    margin-right: 12px;
    padding-bottom: 2px;
    border: 1px solid #5f0080;
    border-radius: 3px;
    background: #fff;
    font-weight: 700;
    font-size: 16px;
    color: #5f0080;
    line-height: 52px;
    letter-spacing: -.1px;
    text-align: center;
}

#cartPut .cart_option .group_btn .btn_type1 {
    width: auto;
    height: 56px;
}

#cartPut .cart_option .group_btn .txt_type {
    display: block;
    width: 100%;
    height: 100%;
    padding-bottom: 2px;
    border: 0;
    background: 0 0;
    font-weight: 700;
    color: #fff;
    font-size: 16px;
    line-height: 52px;
    letter-spacing: -.1px;
    text-align: center;
}

.btn_type1 {
    border: 1px solid #5f0081;
    background-color: #5f0080;
}

.btn_type1, .btn_type2 {
    display: block;
    overflow: hidden;
    width: 100%;
    height: 54px;
    border-radius: 3px;
    font-size: 0;
    text-align: center;
}

.layout-wrapper.goods-view-area {
    padding-right: 40px;
}

.layout-wrapper {
    position: relative;
    width: 1050px;
    height: 100%;
    margin: 0 auto;
}

.goods-add-product {
    position: relative;
}

.goods-add-product-title {
    font-size: 13px;
    font-weight: 900;
    line-height: 1.8;
}

.goods-add-product-title::before {
    width: 20px;
    height: 5px;
    background-color: #000;
    display: block;
    content: '';
}

h3 {
    display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

.__slide-wrapper {
    position: relative;
    overflow: hidden;
}

.goods-add-product-wrapper {
    position: relative;
    margin-top: 20px;
}

.goods-add-product-move.goods-add-product-move-left {
    left: 0;
    background-image: url(https://res.kurly.com/pc/etc/old/images/common/slide-sub-left-button-black.png);
    background-position: left;
}

.goods-add-product-move {
    position: absolute;
    text-indent: -9999px;
    background-color: transparent;
    border: 0;
    height: 100%;
    top: 0;
    bottom: 0;
    margin: auto;
    background-repeat: no-repeat;
    z-index: 3;
    width: 30px;
    background-position: 50% 50%;
}


.goods-add-product-move.goods-add-product-move-right {
    right: 0;
    background-image: url(https://res.kurly.com/pc/etc/old/images/common/slide-sub-right-button-black.png);
    background-position: right;
}

.goods-add-product-list-wrapper {
    position: relative;
    overflow: hidden;
    width: 940px;
    margin: 0 auto;
    height: 350px;
}

.__slide-mover {
    position: absolute;
    left: 0;
    width: 10000%;
    height: 100%;
}

.goods-add-product-list {
    width: 10000%;
    position: absolute;
    left: 0;
    top: 0;
    height: 100%;
}

.__slide-item {
    float: left;
    height: 100%;
}


.goods-add-product-item {
    float: left;
    width: 180px;
    height: 100%;
    margin-right: 10px;
    border: 1px solid #ddd;
}

.goods-add-product-item-figure {
    position: relative;
    height: 230px;
    overflow: hidden;
}

.goods-add-product-item-figure a {
    display: block;
}

.goods-add-product-item-image {
    width: 100%;
    height: 100%;
}

.goods-add-product-item-content {
    height: 120px;
}

.goods-add-product-item-content-wrapper {
    padding: 10px;
    position: relative;
    min-height: 75px;
}

.goods-add-product .goods-add-product-item-name {
    overflow: hidden;
    width: 100%;
    height: 35px;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    word-wrap: break-word;
}

.goods-add-product-item-name {
    font-size: 14px;
    font-weight: 700;
    color: #4c4c4c;
    line-height: 18px;
}

.goods-add-product-item-price {
    font-size: 14px;
    position: absolute;
    left: 10px;
    bottom: 10px;
}


.goods-view-infomation {
    margin-top: 50px;
}

.goods-view-infomation-tab-group {
    border-bottom: 10xp solid #bfbfbf;
    margin-top: 200px;
   margin-left: 100px;
   list-style: none;
}

.goods-view-infomation-tab {
    float: left;
    vertical-align: top;
}

.goods-view-infomation-tab:first-child .goods-view-infomation-tab-anchor {
    border-left: 1px solid #bfbfbf;
    width: 170px;
}

.goods-view-infomation-tab-anchor.__active {
    background-color: #fff;
    height: 47px;
}

.goods-view-infomation-tab-anchor {
    position: relative;
    top: 1px;
    width: 168px;
    height: 46px;
    line-height: 46px;
    text-align: center;
    display: block;
    color: #4c4c4c;
    font-size: 14px;
    font-family: noto sans;
    background-color: #f0eef1;
    border: 1px solid #bfbfbf;
    border-bottom: 0;
    border-left: none;
}

.goods-view-infomation-tab-anchor span {
    font-size: 12px;
    color: #434343;
}

.goods-view-infomation-tab-group::after {
    display: block;
    content: '';
    clear: both;
}


.goods-view-infomation-content.__active {
    display: block;
}


.goods-view-infomation-content {
    padding-top: 60px;
    min-height: 500px;
    margin-bottom: 50px;
}

.goods_wrap {
    width: 1010px;
    margin: 0 auto;
    font-family: noto sans;
    font-weight: 200;
    letter-spacing: 0;
}

.goods_wrap .context.last {
    margin-bottom: 170px;
}

.goods_wrap .context {
    margin-bottom: 130px;
}

.goods_wrap .goods_intro .context h3 {
    display: block;
    margin: 75px 0 0;
    padding-bottom: 35px;
    font-size: 38px;
    line-height: 46px;
    text-align: center;
    border-bottom: 1px solid #c1c1c1;
    color: #666;
}

.goods_wrap .goods_intro .context h3 small {
    display: block;
    font-size: 24px;
    margin-bottom: 14px;
    line-height: 15px;
}

.goods_wrap .goods_intro .context .words {
    margin-top: 28px;
}

.goods_wrap .context .words {
    margin-top: 55px;
    font-size: 18px;
    line-height: 32px;
    color: #373737;
}

.goods_wrap .goods_pick h3, .goods_point h3 {
    display: inline-block;
    position: relative;
    z-index: 10;
    font-size: 50px;
    width: 100%;
    margin-bottom: 70px;
    font-weight: 700;
    font-family: noto sans;
    font-weight: 700;
    color: #666;
    margin-top:0px;
}

.goods_point h3::before {
    width: 1010px;
}

.goods_point h3 span {
    position: relative;
    z-index: 10;
    display: inline-block;
    margin-left: 260px;
    padding: 0 15px;
    background: #fff;
    text-shadow: 2px 0;
}

.goods_wrap .goods_pick h3:before, .goods_point h3:before {
    content: " ";
    position: absolute;
    z-index: 1;
    top: 28px;
    width: 100%;
    height: 1px;
    background: #b9b9b9;
}

.goods_wrap .goods_tip {
    margin-bottom: 170px;
}

.goods_wrap .goods_tip h3 {
    display: inline-block;
    position: relative;
    z-index: 10;
    font-size: 30px;
    padding-left: 48px;
    font-weight: 700;
    font-family: noto sans;
    font-weight: 700;
    color: #666;
    letter-spacing: 1px;
}

.goods_wrap .goods_tip h3 span {
    position: relative;
    z-index: 10;
    display: inline-block;
    padding: 0 10px;
    font-size: 36px;
    background: #fff;
    text-shadow: 2px 0;
}

.goods_wrap .goods_tip .tip_box {
    margin-top: -15px;
    border: 1px solid #b9b9b9;
}

.goods_wrap .goods_tip .tip_box .context {
    margin: 60px 62px;
}

.goods_wrap .tip_box .context .pic {
    margin: 66px 0;
}

.goods_wrap .goods_pick h3, .goods_point h3 {
    display: inline-block;
    position: relative;
    z-index: 10;
    font-size: 50px;
    width: 100%;
    margin-bottom: 70px;
    font-weight: 700;
    font-family: noto sans;
    font-weight: 700;
    color: #666;
}

.goods_wrap .goods_pick h3:before, .goods_point h3:before {
    content: " ";
    position: absolute;
    z-index: 1;
    top: 28px;
    width: 100%;
    height: 1px;
    background: #b9b9b9;
}

.goods_wrap .goods_pick h3 span {
    position: relative;
    z-index: 10;
    display: inline-block;
    margin-left: 354px;
    padding: 0 15px;
    background: #fff;
    text-shadow: 2px 0;
}

.goods_wrap .context.last {
    margin-bottom: 170px;
}

.goods_wrap .context .words {
    margin-top: 55px;
    font-size: 18px;
    line-height: 32px;
    color: #373737;
}

.goods_wrap .sub_tit {
    display: block;
    margin-bottom: 20px;
    font-size: 30px;
    line-height: 38px;
}

.goods_wrap .option_tit {
    display: table-cell;
}

b, strong {
    font-weight: 700;
}

.goods_wrap .goods_tip {
    margin-bottom: 170px;
}

.goods_wrap .goods_tip h3 {
    display: inline-block;
    position: relative;
    z-index: 10;
    font-size: 30px;
    padding-left: 48px;
    font-weight: 700;
    font-family: noto sans;
    font-weight: 700;
    color: #666;
    letter-spacing: 1px;
}

.goods_wrap .goods_tip h3 span {
    position: relative;
    z-index: 10;
    display: inline-block;
    padding: 0 10px;
    font-size: 36px;
    background: #fff;
    text-shadow: 2px 0;
}

.goods_wrap .goods_tip .tip_box {
    margin-top: -15px;
    border: 1px solid #b9b9b9;
}

.goods_wrap .goods_tip .tip_box .context {
    margin: 60px 62px;
}

.goods_wrap .tip_box .context .pic {
    margin: 66px 0;
}

.goods_wrap .tip_box .context .words {
    margin: 0;
    font-size: 18px;
    line-height: 32px;
}

.goods_wrap .tip_box strong {
    display: block;
    font-size: 25px;
    line-height: 38px;
    margin-bottom: 10px;
}

.goods_wrap .about_brand h3 {
    display: inline-block;
    position: relative;
    z-index: 10;
    width: 100%;
    margin-bottom: 70px;
    font-size: 50px;
    font-family: noto sans;
    font-weight: 700;
    color: #666;
}

.goods_wrap .about_brand h3::before {
    content: " ";
    position: absolute;
    z-index: 1;
    top: 28px;
    width: 100%;
    height: 1px;
    background: #b9b9b9;
}

.goods_wrap .about_brand h3 span {
    position: relative;
    z-index: 10;
    display: inline-block;
    margin-left: 341px;
    padding: 0 15px;
    background: #fff;
    text-shadow: 2px 0;
}

.goods_wrap .about_brand .context.last {
    margin-bottom: 170px;
}

.goods_wrap .about_brand .context .pic {
    margin-bottom: 60px;
}

.goods_wrap .about_brand .context .words {
    margin: 0 0 100px;
}

.goods_wrap .context .words {
    margin-top: 55px;
    font-size: 18px;
    line-height: 32px;
    color: #373737;
}
.goods-view-infomation-tab-group {
    border-bottom: 1px solid #bfbfbf;
}

.goods-view-infomation-tab {
    float: left;
    vertical-align: top;
    
}

.goods-view-infomation-tab:first-child .goods-view-infomation-tab-anchor {
    border-left: 1px solid #bfbfbf;
    width: 170px;
}

.goods-view-infomation-tab-anchor {
    position: relative;
    top: 1px;
    width: 168px;
    height: 46px;
    line-height: 46px;
    text-align: center;
    display: block;
    color: #4c4c4c;
    font-size: 14px;
    font-family: noto sans;
    background-color: #f0eef1;
    border: 1px solid #bfbfbf;
    border-bottom: 0;
    border-left: none;
}

.goods-view-infomation-tab-anchor.__active {
    background-color: #fff;
    height: 47px;
}

.goods-view-infomation-tab-anchor span {
    font-size: 12px;
    color: #434343;
}

.goods-view-infomation-content {
    padding-top: 60px;
    min-height: 500px;
    margin-bottom: 50px;
}

#goods-infomation {
    margin-bottom: 100px;
}

.goods-view-infomation-content {
    padding-top: 60px;
    min-height: 500px;
    margin-bottom: 50px;
}

table.extra-information {
    background: #e0e0e0;
    margin: 30px 0 60px;
    width: 100%!important;
}

table {
    border-collapse: collapse;
    border-spacing: 0;
}

table.extra-information th {
    width: 15%;
    background: #f5f5f5;
    color: #515151;
}

table.extra-information th, table.extra-information td {
    font-weight: 400;
    text-align: left;
    padding-left: 15px;
    background: #fff;
    font-family: Dotum;
    font-size: 11px;
    height: 28px;
    padding: 5px 0 5px 10px;
    border-width: 1px;
    line-height: 20px;
}

table.extra-information td {
    width: 35%;
    color: #666;
}

table.extra-information th {
    width: 15%;
    background: #f5f5f5;
    color: #515151;
}

.whykurly_area {
    width: 1000px;
    margin: 0 auto;
    color: #000;
    letter-spacing: -.045em;
}

.whykurly_area .row:first-child {
    border-top: 0;
    padding-top: 44px;
}

.whykurly_area .tit_whykurly {
    display: block;
    font-size: 33px;
    font-weight: 500;
    color: #666;
    text-align: center;
}

.whykurly_area .txt_area {
    overflow: hidden;
    margin-top: 45px;
    text-align: center;
}

.whykurly_area .why-kurly .col:first-child {
    margin-left: 0;
}

.whykurly_area .txt_area .col {
    width: 315px;
    display: inline-block;
    margin: 43px 0 0 10px;
    vertical-align: top;
}

.whykurly_area .txt_area .col .icon {
    width: 100%;
    text-align: center;
}

.whykurly_area .why-kurly .col .icon {
    display: block;
    width: 100%;
    text-align: center;
}

.whykurly_area .why-kurly .col .icon img {
    width: 40px;
    height: 40px;
}

.whykurly_area .why-kurly .col .info .title {
    color: #5f0080;
    font-weight: 600;
    display: block;
    font-size: 18px;
    text-align: center;
    line-height: 27px;
    margin-top: 10px;
}

.whykurly_area .why-kurly .col .info .desc {
    display: block;
}

.whykurly_area .why-kurly .col .info .desc p {
    display: block;
    margin-top: 22px;
    color: #333;
    padding: 0;
    font-size: 16px;
    font-weight: 100;
    line-height: 1.56;
    letter-spacing: -.4px;
    text-align: center;
}

.whykurly_area .why-kurly .col .info .desc .etc {
    display: block;
    width: 100%;
    height: 19px;
    margin: 16px 0;
    font-size: 13px;
    font-weight: 300;
    letter-spacing: -.29px;
    text-align: center;
    color: #666;
}

.happy_center.fst {
    padding-top: 59px;
    border-top: 2px solid #ddd;
}


.happy_center {
    overflow: hidden;
    padding: 0 5px;
    border-bottom: 1px solid #ddd;
    font: normal 16px/23px 'Noto Sans';
    color: #333;
    letter-spacing: 0;
}

.happy_center .happy .tit {
    font-weight: 700;
    font-size: 28px;
    color: #666;
    line-height: 41px;
    letter-spacing: .8px;
}

.happy_center .happy .sub {
    font-weight: 200;
    padding-top: 31px;
}

.happy_center .happy .emph {
    display: block;
    padding-bottom: 6px;
    font-weight: 700;
    font-size: 18px;
    color: #666;
}

.happy_center .list {
    overflow: hidden;
    width: 100%;
    padding: 59px 0 72px;
}

.happy_center .list li {
    float: left;
    width: 340px;
}

.happy_center .list .tit {
    font-weight: 700;
    font-size: 18px;
    color: #5f0080;
    line-height: 27px;
}

.happy_center .list .tit::before {
    content: "";
    float: left;
    width: 3px;
    height: 20px;
    margin: 5px 10px 0 0;
    background-color: #5f0080;
}

.happy_center .list .sub {
    font-weight: 200;
    padding-top: 9px;
    font-size: 17px;
    line-height: 25px;
}

.happy_center .list .expend {
    padding-top: 13px;
    font-weight: 200;
    font-size: 15px;
    color: #666;
    line-height: 22px;
    letter-spacing: -.4px;
}

.happy_center .list li:last-child {
    width: 212px;
}

.happy_center .unfold {
    overflow: hidden;
    position: relative;
    padding: 16px 0 17px;
}

.happy_center .unfold .tit {
    float: left;
    width: 175px;
    padding: 0 0 0 13px;
    font-weight: 700;
    font-size: 16px;
    color: #666;
    line-height: 27px;
    letter-spacing: 0;
}


.happy_center .unfold .sub {
    float: left;
    width: 650px;
    padding: 0;
    line-height: 27px;
}

.happy_center .happy .sub {
    font-weight: 200;
    
}

.happy_center .unfold .emph {
    display: inline;
    padding: 0 8px 0 0;
    font-weight: 700;
    font-size: 16px;
    color: #666;
}

.inp{
    
    position: relative;
    left: 8px;
    
}

.goods-view-infomation-content {
    padding-top: 60px;
    min-height: 500px;
    margin-bottom: 50px;
}

.goods-view-infomation-board {
    width: 100%;


</style>

</head>
<%
	String item_num=request.getParameter("item_num");
    itemDao dao=new itemDao();
     itemDto dto=dao.getItemData(item_num); 
    

%>
<body>
<!-- 시작 -->
<div id="container" class="container">
        

        <div id="main">
            <div id="content" style="opacity: 1;">
                <div class="section_view">
                    <div id="sectionView">
                        <div class="inner_view">
                            <div class="thumb" style="background-image: url(https://res.kurly.com/mobile/img/1808/img_none_x2.png);">
                                <img src="<%=dto.getItem_info_img() %>" alt="상품 대표 이미지" class="bg">

                            </div>
                            <p class="goods_name">
                               
                                <strong class="name"><%=dto.getItem_name() %></strong>
                                <span class="short_desc"><%=dto.getItem_sub_title() %></span>
                            </p>
                            <p class="goods_price">
                                <span class="position">
                                    <span class="dc">
                                        <span class="dc_price">
                                             <%=dto.getItem_price() %>
                                            <input type="hidden" value=0>  <!-- 여기 벨류에다가 가격데이터 넣어줘야댐-->
                                            
                                        </span>
                                        <span class="won">원</span>
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
                                                    <span class="num"><%=dto.getItem_price() %></span>
                                                    <span class="won">원</span>
                                                </span>
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <div class="group_btn off">
                                        <div class="view_function" >
                                            <button type="button" class="btn btn_save"><img alt="찜 목록" src="/image/heart.png " style="width: 30px; margin-bottom: 10px ;"  ></button>
                                        </div>
                                        <span class="btn_type1">
                                            <button type="submit" class="txt_type" style="background-color: #4B62D3;">장바구니 담기</button>
                                        </span>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="layout-wrapper goods-view-area"> <!-- $$$$$ -->
                   

                    <div class="goods-view-infomation detail_wrap_outer" id="goods-view-infomation">
                        <ul class="goods-view-infomation-tab-group" style="margin-left: 20%;" >
                            <li class="goods-view-infomation-tab">
                                <a href="#goods-description" class="goods-view-infomation-tab-anchor __active">상품설명</a>
                            </li>
                            
                            <li class="goods-view-infomation-tab">
                                <a href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a>
                            </li>
                            <li class="goods-view-infomation-tab">
                                <a href="#goods-review" class="goods-view-infomation-tab-anchor">
                                    고객후기
                                    <span class="count_review">(0)</span>
                                </a>
                            </li>
                         
                        </ul>
                        <div class="goods-view-infomation-content __active" id="goods-description">
                            <div class="goods_wrap">
                                <div class="goods_intro">
                                    <div class="pic">
                                        <img src="https://res.kurly.com/mobile/img/1808/img_none_x2.png" style="width:1010px; height:671px;">
                                    </div>
                                    <div class="context last">
                                        <h3>
                                            <small>
                                                제목 부연설명
                                            </small>
                                            제목
                                        </h3>
                                        <p class="words">
                                            샬라샬라 설명
                                        </p>

                                    </div>
                                </div>
                                <div class="goods_point">
                                    <h3>
                                        <span>새벽마켓's Check Point</span>
                                    </h3>
                                    <div class="context last">
                                        <div class="pic">
                                            <img src="">
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
                                                <img src="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="goods_pick">
                                    <h3>
                                        <span>새벽마켓`s Pick</span>
                                    </h3>

                                    <div class="context last">
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
                                </div>
                                <div class="goods_tip">
                                    <h3>
                                        <span>Kurly's Tip</span>
                                    </h3>
                                    <div class="tip_box">
                                        <div class="context">
                                            <div class="pic">
                                                <img src="">
                                            </div>
                                            <p class="words">
                                                <strong>요리 어떻게하는지 적는칸</strong>
                                                
                                                자세한설명 적는칸
                                                
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="about_brand">
                                    <h3>
                                        <span>About Brand</span>
                                    </h3>
                                    <div class="context last">
                                        <div class="context_about">
                                            <div class="pic">
                                                <img src="">
                                            </div>
                                            <p class="words">
                                                
                                              브랜드 설명 적는칸
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <ul class="goods-view-infomation-tab-group">
                            <li class="goods-view-infomation-tab">
                                <a href="#goods-description" class="goods-view-infomation-tab-anchor">상품설명</a>
                            </li>
                            
                            <li class="goods-view-infomation-tab">
                                <a href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a>
                            </li>
                            <li class="goods-view-infomation-tab">
                                <a href="#goods-review" class="goods-view-infomation-tab-anchor">
                                    고객후기
                                    <span class="count_review">(0)</span>
                                </a>
                            </li>
                            
                        </ul>
                        <div class="goods-view-infomation-content" id="goods-image">
                            <div id="goods_pi">
                                <p class="pic">
                                    <img src="">
                                </p>
                            </div>
                        </div>
                        <ul class="goods-view-infomation-tab-group">
                            <li class="goods-view-infomation-tab">
                                <a href="#goods-description" class="goods-view-infomation-tab-anchor">상품설명</a>
                            </li>
                           
                            <li class="goods-view-infomation-tab">
                                <a href="#goods-infomation" class="goods-view-infomation-tab-anchor __active">상세정보</a>
                            </li>
                            <li class="goods-view-infomation-tab">
                                <a href="#goods-review" class="goods-view-infomation-tab-anchor">
                                    고객후기
                                    <span class="count_review">(0)</span>
                                </a>
                            </li>
                            
                        </ul>
                        <div class="goods-view-infomation-content" id="goods-infomation">
                            <table class="extra-information">
                                <tbody>
                                    <tr>
                                        <th scope="row" class="goods-view-form-table-heading">포장단위별 용량(중량), 수량, 크기</th>
                                        <td>1봉/200g</td>
                                        <th scope="row" class="goods-view-form-table-heading">관련법상 표시사항</th>
                                        <td>GAP, 무농약 인증</td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="goods-view-form-table-heading">생산자, 수입품의 경우 수입자를 함께 표기</th>
                                        <td>제품 별도 라벨 표기 참조</td>
                                        <th scope="row" class="goods-view-form-table-heading">상품구성</th>
                                        <td>무농약 콩나물</td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="goods-view-form-table-heading">농수산물의 원산지 표시에 관한 법률에 따른 원산지</th>
                                        <td>국산</td>
                                        <th scope="row" class="goods-view-form-table-heading">보관방법 또는 취급방법</th>
                                        <td>냉장 보관</td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="goods-view-form-table-heading">제조연월일(포장일 또는 생산연도), 유통기한 또는 품질유지기한</th>
                                        <td>제품 별도 라벨 표기 참조</td>
                                        <th scope="row" class="goods-view-form-table-heading">소비자상담 관련 전화번호</th>
                                        <td>새벽마켓 고객행복센터(1644-1107)</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="whykurly_area">
                                <div class="row">
                                    <strong class="tit_whykurly">WHY 새벽마켓</strong>
                                    <div id="why_kurly" class="txt_area">
                                        <div class="why-kurly">
                                            <div class="col">
                                                <div class="icon">
                                                    <img src="https://res.kurly.com/pc/ico/1910/01_check.svg">
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
                                                    <img src="https://res.kurly.com/pc/ico/1910/02_only.svg" >
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
                                                    <img src="https://res.kurly.com/pc/ico/1910/03_cold.svg">
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
                                                    <img src="https://res.kurly.com/pc/ico/1910/04_price.svg">
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
                                                    <img src="https://res.kurly.com/pc/ico/1910/05_eco.svg">
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
                                    <h4 class="tit">고객행복센터</h4>
                                    <p class="sub">
                                        <span class="emph">궁금하신 점이나 서비스 이용에 불편한 점이 있으신가요?</span>
                                        <span class="bar"></span>
                                        문제가 되는 부분을 사진으로 찍어 아래 중 편하신 방법으로 접수해 주시면 빠르게 도와드리겠습니다.
                                    </p>
                                </div>
                                <ul class="list">
                                    <li>
                                        <div  >
                                        <b style="font-weight:bolder; color:#4B62D3; font-size:14pt;">|</b>
                                            전화 문의 
                                        </div>
                                        <div class="sub">오전 7시~오후 7시 (연중무휴)</div>
                                    </li>
                                    <li style="list-style: none;">
                                        <div><b style="font-weight:bolder; color:#4B62D3; font-size:14pt;" >|</b>
                                            카카오톡 문의
                                        </div>
                                        <div class="sub">오전 7시~오후 7시 (연중무휴)</div>
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
                                           <b style="font-weight:bolder; color:#4B62D3; font-size:14pt;">|</b> 홈페이지 문의
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
                                    <h4 class="tit">주문 취소 안내</h4>
                                    <ul class="sub" style="list-style: none;">
                                        <li >
                                            <strong class="emph" >[입금 확인] 단계</strong>                                            
                                            마이컬리 > 주문 내역 상세페이지에서 직접 취소하실 수 있습니다.
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
                                    <h4 class="tit">교환 및 환불 안내</h4>
                                    <p class="sub">
                                        고객님의 단순 변심으로 인한 반품은 어려울 수 있으니 양해 부탁드립니다.</p>
                                </div>
                            </div>
                        </div>
                        <ul class="goods-view-infomation-tab-group">
                            <li class="goods-view-infomation-tab">
                                <a href="#goods-description" class="goods-view-infomation-tab-anchor">상품설명</a>
                            </li>
                            
                            <li class="goods-view-infomation-tab">
                                <a href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a>
                            </li>
                            <li class="goods-view-infomation-tab">
                                <a href="#goods-review" class="goods-view-infomation-tab-anchor __active">
                                    고객후기
                                    <span class="count_review">(0)</span>
                                </a>
                            </li>
                            
                        </ul>
                        <div class="goods-view-infomation-content" id="goods-review"> <!-- 아래 주소창에 good_review_list.html url 넣어주면 됩니당-->
                            <iframe src="http://127.0.0.1:5500/good_review_list.html" id="inreview" frameborder="0" class="goods-view-infomation-board" height="733"></iframe>
                        </div>
                        
                    </div>
                </div>
            </div>

        </div>




















        




    </div>

</body>
</html>