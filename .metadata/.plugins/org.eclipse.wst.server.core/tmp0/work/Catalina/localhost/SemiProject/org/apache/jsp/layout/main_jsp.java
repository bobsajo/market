/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.71
 * Generated at: 2023-03-17 08:48:41 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.layout;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import data.dto.ItemDto;
import java.util.List;
import data.dao.ItemDao;

public final class main_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("data.dto.ItemDto");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("org.json.simple.JSONObject");
    _jspx_imports_classes.add("data.dao.ItemDao");
    _jspx_imports_classes.add("org.json.simple.JSONArray");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"ko\">\r\n");
      out.write("<head>\r\n");
      out.write("  <meta charset=\"UTF-8\">\r\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("  <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\r\n");
      out.write("  <script src=\"https://code.jquery.com/jquery-3.6.3.js\"></script>\r\n");
      out.write("  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js\"></script>\r\n");
      out.write("  <title>Slide Project</title>\r\n");
      out.write("  \r\n");
      out.write("  <style>\r\n");
      out.write("    html, body { box-sizing: border-box; padding: 0; margin: 0; text-align: center;  min-height: 100vh;}\r\n");
      out.write("    *, *:before, *:after { box-sizing: inherit; }\r\n");
      out.write("    .clearfix:after { content: ''; display: block; clear: both; float: none; }\r\n");
      out.write("    .title { margin-bottom: 0; text-align: center; font-size: 30px; color: #333; }\r\n");
      out.write("    .link, .link:visited { display: inline-block; margin: 20px 0; color: #555; text-decoration: none; font-weight: bold; }\r\n");
      out.write("    .link:hover, .link:focus { color: #9fd6c2; }\r\n");
      out.write("    /* container - body */\r\n");
      out.write("    #container { width: 100%; margin: auto; }\r\n");
      out.write("    .flex-slide{\r\n");
      out.write("    	width: 100%;\r\n");
      out.write("    	display:flex;\r\n");
      out.write("    	z-index:-1;\r\n");
      out.write("    }\r\n");
      out.write("    .slide_wrap { width: 1220px; padding-bottom: 40px;\r\n");
      out.write("     margin-left: 14.5%;}\r\n");
      out.write("    .slide_box { width: 1220px; margin:auto; overflow-x: hidden; text-align: center; }\r\n");
      out.write("    .slide_content { display: table; float: left; width: 305px; height: 300px;}\r\n");
      out.write("    \r\n");
      out.write("    .slide_btn_box {background:none; width:100%; height:100%; z-index:1; \r\n");
      out.write("     position: relative; top: -300px;}\r\n");
      out.write("    .slide_btn_box > button { position:relative; width: 60px; height: 60px; font-size: 16px;  background: none; border: 0px; cursor: pointer; }\r\n");
      out.write("    .slide_btn_box > .slide_btn_prev {left:-47%;}\r\n");
      out.write("    .slide_btn_box > .slide_btn_next {left:45%;}\r\n");
      out.write("    \r\n");
      out.write("    .slide_pagination { position: absolute; left: 50%; bottom: 0; list-style: none; margin: 0; padding: 0; transform: translateX(-50%); }\r\n");
      out.write("    .slide_pagination .dot { display: inline-block; width: 15px; height: 15px; margin: 0 5px; overflow: hidden; background: #ddd; border-radius: 50%; transition: 0.3s; }\r\n");
      out.write("    .slide_pagination .dot.dot_active { background: #333; }\r\n");
      out.write("    .slide_pagination .dot a { display: block; width: 100%; height: 100%; }\r\n");
      out.write("    \r\n");
      out.write("    .a{\r\n");
      out.write("  	text-decoration : none;\r\n");
      out.write("  	color:black;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	\r\n");
      out.write("	<!-- 메인배너 --/>\r\n");
      out.write("	.banner_container{\r\n");
      out.write("		width: 100%;\r\n");
      out.write("		display: flex;\r\n");
      out.write("		justify-content: center;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	.visual {\r\n");
      out.write("	\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	.visual > .slide{\r\n");
      out.write("	    height: 370px;\r\n");
      out.write("	    /*margin-left: 300px;*/\r\n");
      out.write("	    margin-bottom: 40px;\r\n");
      out.write("	    width: 100%;\r\n");
      out.write("	    display: none;\r\n");
      out.write("	}\r\n");
      out.write("	.slide img{\r\n");
      out.write("		width:100%;\r\n");
      out.write("	}\r\n");
      out.write("	.visual > img {\r\n");
      out.write("	vertical-align: middle;\r\n");
      out.write("	\r\n");
      out.write("	}\r\n");
      out.write("	.visual > .slideshow-container {\r\n");
      out.write("	 \r\n");
      out.write("	  height: 500px;\r\n");
      out.write("	  /* margin-left:500px;\r\n");
      out.write("	  margin-right:500px; */\r\n");
      out.write("	 /*  margin:0 auto; */\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	.visual > .slide.active {\r\n");
      out.write("	  opacity: 1;\r\n");
      out.write("	},\r\n");
      out.write("	/* GOODS */\r\n");
      out.write("	.goods{\r\n");
      out.write("	\r\n");
      out.write("	}\r\n");
      out.write("	.goods > .inner{\r\n");
      out.write("	   \r\n");
      out.write("	}\r\n");
      out.write("	.goods .goods-top{\r\n");
      out.write("	   text-align: center;\r\n");
      out.write("	   margin: 0 auto;\r\n");
      out.write("	    display: block;/* \r\n");
      out.write("	    justify-content: center; */\r\n");
      out.write("	    /* align-items: center; */\r\n");
      out.write("	    padding-top: 40px ;\r\n");
      out.write("	    margin-bottom: 27px;\r\n");
      out.write("	/*       margin-right:80px; */\r\n");
      out.write("	}\r\n");
      out.write("	.goods .goods-top span{\r\n");
      out.write("	    color: rgb(51, 51, 51);\r\n");
      out.write("	    font-size: 28px;\r\n");
      out.write("	    line-height: 1.15;\r\n");
      out.write("	    letter-spacing: -0.26px;\r\n");
      out.write("	    font-weight: 500;\r\n");
      out.write("	    padding: 8px 0;\r\n");
      out.write("	    margin-left: 10px;\r\n");
      out.write("	    margin-right: 50px;\r\n");
      out.write("	}\r\n");
      out.write("	.goods .goods-list{\r\n");
      out.write("	    display: flex;\r\n");
      out.write("	    justify-content: space-between;\r\n");
      out.write("	    padding-bottom: 40px;\r\n");
      out.write("	    float:left;\r\n");
      out.write("	    text-align:\"center\";\r\n");
      out.write("	    margin-left: 500px;\r\n");
      out.write("	    margin-right: 500px;\r\n");
      out.write("	    }\r\n");
      out.write("	.goods .goods-list .goods-card{\r\n");
      out.write("	    margin-right: 18px;\r\n");
      out.write("	   \r\n");
      out.write("	}\r\n");
      out.write("	.goods .goods-list .goods-card .img-container{\r\n");
      out.write("	   \r\n");
      out.write("	    height: 320px;\r\n");
      out.write("	    position: relative;\r\n");
      out.write("	   \r\n");
      out.write("	    \r\n");
      out.write("	}\r\n");
      out.write("	.goods .goods-list .goods-card .img-container img{\r\n");
      out.write("	    height: 100%;\r\n");
      out.write("	    \r\n");
      out.write("	    \r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	.fade {\r\n");
      out.write("	  -webkit-animation-name: fade;\r\n");
      out.write("	  -webkit-animation-duration: 1.5s;\r\n");
      out.write("	  animation-name: fade;\r\n");
      out.write("	  animation-duration: 2.0s;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	@-webkit-keyframes fade {\r\n");
      out.write("	  from {opacity: .1} \r\n");
      out.write("	  to {opacity: 2}\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	@keyframes fade {\r\n");
      out.write("	  from {opacity: .2} \r\n");
      out.write("	  to {opacity: 1}\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	.main_1>h1{\r\n");
      out.write("	     text-align : center;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	.product_list{\r\n");
      out.write("	   display: flex;\r\n");
      out.write("	   float:left;\r\n");
      out.write("	   text-align:\"center\";\r\n");
      out.write("	    margin-left: 500px;\r\n");
      out.write("	    margin-right: 500px;\r\n");
      out.write("	\r\n");
      out.write("	     \r\n");
      out.write("	}\r\n");
      out.write("	.slider-nav {\r\n");
      out.write("	  position: absolute;\r\n");
      out.write("	  bottom: 10px;\r\n");
      out.write("	  left: 50%;\r\n");
      out.write("	  transform: translateX(-50%);\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	.slider-nav button {\r\n");
      out.write("	  margin: 0 10px;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	.ban{\r\n");
      out.write("		margin-left: 10px;\r\n");
      out.write("		\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("  </style>\r\n");
      out.write("  \r\n");
      out.write("  <script>\r\n");
      out.write("   $(function(){\r\n");
      out.write("      \r\n");
      out.write("      var slideIndex = 0;\r\n");
      out.write("      showSlides();\r\n");
      out.write("\r\n");
      out.write("      function showSlides() {\r\n");
      out.write("          var i;\r\n");
      out.write("          \r\n");
      out.write("          var slides = document.getElementsByClassName(\"slide\");\r\n");
      out.write("          for (i = 0; i < slides.length; i++) {\r\n");
      out.write("             slides[i].style.display = \"none\";  \r\n");
      out.write("          }\r\n");
      out.write("          slideIndex++;\r\n");
      out.write("          if (slideIndex > slides.length) {slideIndex = 1}\r\n");
      out.write("          slides[slideIndex-1].style.display = \"block\"; \r\n");
      out.write("          \r\n");
      out.write("          /*\r\n");
      out.write("          var slides = $(\".slide\");\r\n");
      out.write("          slides.each(function(i,ele){\r\n");
      out.write("        	  $(ele).hide();\r\n");
      out.write("          });\r\n");
      out.write("          slideIndex++;\r\n");
      out.write("          if (slideIndex > slides.length) {slideIndex = 1}\r\n");
      out.write("          slides.eq(slideIndex-1).fadeIn('fast');*/\r\n");
      out.write("          \r\n");
      out.write("          setTimeout(showSlides, 2000); // Change image every 2 seconds\r\n");
      out.write("      }\r\n");
      out.write("   });\r\n");
      out.write("</script>\r\n");
      out.write("  \r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<!-- 메인배너 -->\r\n");
      out.write("	<div class=\"banner_container\">\r\n");
      out.write("   \r\n");
      out.write("    <section class=\"visual\">\r\n");
      out.write("    <div class = \"slideshow-container\">\r\n");
      out.write("        \r\n");
      out.write("        <div class=\"slide fade\">\r\n");
      out.write("        <a href = \"https://www.kurly.com/categories/825\">\r\n");
      out.write("        <img alt = \"\" src = \"image3/banner1.jpg\">\r\n");
      out.write("        </a>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"slide fade\">\r\n");
      out.write("        <a href = \"https://www.kurly.com/shop/main/html.php?htmid=event/kurly.htm&name=friend\">\r\n");
      out.write("        <img alt = \"\" src = \"image3/banner2.jpg\">\r\n");
      out.write("        </a>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"slide fade\">\r\n");
      out.write("        <a href = \"https://www.kurly.com/categories/139001\" >\r\n");
      out.write("        <img alt = \"\" src = \"image3/banner3.jpg\">\r\n");
      out.write("        </a>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"slide fade\">\r\n");
      out.write("        <a href = \"https://www.kurly.com/categories/863\">\r\n");
      out.write("        <img alt = \"\" src = \"image3/banner4.jpg\">\r\n");
      out.write("        </a>\r\n");
      out.write("        </div>\r\n");
      out.write("   </div>\r\n");
      out.write("   </section>\r\n");
      out.write("   </div>\r\n");
      out.write("   \r\n");
      out.write("   <div>\r\n");
      out.write("   		<section>\r\n");
      out.write("			<div class = \"ban\">\r\n");
      out.write("				<img src = \"image3/그림1.jpg\" width = \"1300px;\">\r\n");
      out.write("			</div>   		\r\n");
      out.write("   		</section>	\r\n");
      out.write("   </div>\r\n");
      out.write("   <div>\r\n");
      out.write("   	<a href =\"#\"></a>\r\n");
      out.write("   </div>\r\n");
      out.write("\r\n");
      out.write("  <!-- 네비게이터 -->\r\n");
      out.write("\r\n");
      out.write("  <h1 class=\"title\">이 상품 어때요 ?</h1>\r\n");
      out.write("  <a href=\"#\" class=\"link\" target=\"_blank\"></a>\r\n");
      out.write("  \r\n");
      out.write("  <div id=\"container\">\r\n");
      out.write("    <div class=\"slide_wrap slide1\">\r\n");
      out.write("   	<div class=\"flex-slide\">\r\n");
      out.write("      <div class=\"slide_box\">\r\n");
      out.write("        <div class=\"slide_list clearfix\">\r\n");
      out.write("       	");
 
       	int startNum = (int)((Math.random()*29)); // 0 ~ 28
    	
    	ItemDao dao = new ItemDao();
    	List<ItemDto> list = dao.getList(startNum, 12);
    	
    	for(ItemDto dto: list){
    		
       	
      out.write("\r\n");
      out.write("          <div class=\"slide_content slide01\">\r\n");
      out.write("          	<a href = \"#\" class = \"a\">\r\n");
      out.write("          	<img src=\"itemImg/");
      out.print(dto.getItem_img() );
      out.write("\" width=\"275\">\r\n");
      out.write("          	<p>상품명 : ");
      out.print(dto.getItem_name());
      out.write("</p>\r\n");
      out.write("          	<p>가격 : ");
      out.print(dto.getItem_price() );
      out.write("원</p>\r\n");
      out.write("          	</a>\r\n");
      out.write("          </div>\r\n");
      out.write("         ");
 
    	}
          
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- // .slide_list -->\r\n");
      out.write("      </div>\r\n");
      out.write("     </div>\r\n");
      out.write("      <!-- // .slide_box -->\r\n");
      out.write("      <div class=\"slide_btn_box\">\r\n");
      out.write("        <button type=\"button\" class=\"slide_btn_prev\"><img src=\"image/arrow_left.png\" width=\"70\"></button>\r\n");
      out.write("        <button type=\"button\" class=\"slide_btn_next\"><img src=\"image/arrow_right14.png\" width=\"70\"></button>\r\n");
      out.write("      </div>\r\n");
      out.write("      <!-- // .slide_btn_box -->\r\n");
      out.write("      <!-- // .slide_pagination -->\r\n");
      out.write("    </div>\r\n");
      out.write("   	<h2>카테고리별 상품 미리보기</h2>\r\n");
      out.write("    <h1 class=\"title\">육류</h1>\r\n");
      out.write("    <a href=\"#\" class=\"link\" target=\"_blank\"></a>\r\n");
      out.write("   	<div class=\"slide_wrap slide2\">\r\n");
      out.write("      <div class=\"slide_box\">\r\n");
      out.write("        <div class=\"slide_list clearfix\">\r\n");
      out.write("       	");
 
    	ItemDao dao2 = new ItemDao();
    	List<ItemDto> list2 = dao.getListCategory("meat", 0, 8);
    	
    	for(ItemDto dto: list2){
    		
       	
      out.write("\r\n");
      out.write("          <div class=\"slide_content slide01\">\r\n");
      out.write("          	<a href = \"#\" class = \"a\">\r\n");
      out.write("          	<img src=\"itemImg/");
      out.print(dto.getItem_img() );
      out.write("\" width=\"275\">\r\n");
      out.write("          	<p>상품명 : ");
      out.print(dto.getItem_name());
      out.write("</p>\r\n");
      out.write("          	<p>가격 : ");
      out.print(dto.getItem_price());
      out.write("원</p>\r\n");
      out.write("          	</a>\r\n");
      out.write("          </div>\r\n");
      out.write("         ");
 
    	}
          
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- // .slide_list -->\r\n");
      out.write("      </div>\r\n");
      out.write("      <!-- // .slide_box -->\r\n");
      out.write("      <div class=\"slide_btn_box\">\r\n");
      out.write("        <button type=\"button\" class=\"slide_btn_prev\"><img src=\"image/arrow_left.png\" width=\"70\"></button>\r\n");
      out.write("        <button type=\"button\" class=\"slide_btn_next\"><img src=\"image/arrow_right14.png\" width=\"70\"></button>\r\n");
      out.write("      </div>\r\n");
      out.write("      <!-- // .slide_btn_box -->\r\n");
      out.write("      <!-- // .slide_pagination -->\r\n");
      out.write("    </div>\r\n");
      out.write("    <h1 class=\"title\">해산물</h1>\r\n");
      out.write("    <a href=\"#\" class=\"link\" target=\"_blank\"></a>\r\n");
      out.write("   	<div class=\"slide_wrap slide3\">\r\n");
      out.write("      <div class=\"slide_box\">\r\n");
      out.write("        <div class=\"slide_list clearfix\">\r\n");
      out.write("       	");
 
    	ItemDao dao3 = new ItemDao();
    	List<ItemDto> list3 = dao.getListCategory("seafood", 0, 8);
    	
    	for(ItemDto dto: list3){
    		
       	
      out.write("\r\n");
      out.write("          <div class=\"slide_content slide01\">\r\n");
      out.write("          	<a href = \"#\" class = \"a\">\r\n");
      out.write("          	<img src=\"itemImg/");
      out.print(dto.getItem_img() );
      out.write("\" width=\"275\">\r\n");
      out.write("          	<p>상품명 : ");
      out.print(dto.getItem_name());
      out.write("</p>\r\n");
      out.write("          	<p>가격 : ");
      out.print(dto.getItem_price() );
      out.write("원</p>\r\n");
      out.write("          	</a>\r\n");
      out.write("          </div>\r\n");
      out.write("         ");
 
    	}
          
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- // .slide_list -->\r\n");
      out.write("      </div>\r\n");
      out.write("      <!-- // .slide_box -->\r\n");
      out.write("      <div class=\"slide_btn_box\">\r\n");
      out.write("        <button type=\"button\" class=\"slide_btn_prev\"><img src=\"image/arrow_left.png\" width=\"70\"></button>\r\n");
      out.write("        <button type=\"button\" class=\"slide_btn_next\"><img src=\"image/arrow_right14.png\" width=\"70\"></button>\r\n");
      out.write("      </div>\r\n");
      out.write("      <!-- // .slide_btn_box -->\r\n");
      out.write("      <!-- // .slide_pagination -->\r\n");
      out.write("    </div>\r\n");
      out.write("  <h1 class=\"title\">과일</h1>\r\n");
      out.write("    <a href=\"#\" class=\"link\" target=\"_blank\"></a>\r\n");
      out.write("   	<div class=\"slide_wrap slide4\">\r\n");
      out.write("      <div class=\"slide_box\">\r\n");
      out.write("        <div class=\"slide_list clearfix\">\r\n");
      out.write("       	");
 
    	ItemDao dao4 = new ItemDao();
    	List<ItemDto> list4 = dao.getListCategory("fruit", 0, 8);
    	
    	for(ItemDto dto: list4){
    		
       	
      out.write("\r\n");
      out.write("          <div class=\"slide_content slide01\">\r\n");
      out.write("          	<a href = \"#\" class = \"a\">\r\n");
      out.write("          	<img src=\"itemImg/");
      out.print(dto.getItem_img() );
      out.write("\" width=\"275\">\r\n");
      out.write("          	<p>상품명 : ");
      out.print(dto.getItem_name());
      out.write("</p>\r\n");
      out.write("          	<p>가격 : ");
      out.print(dto.getItem_price() );
      out.write("원</p>\r\n");
      out.write("          	</a>\r\n");
      out.write("          </div>\r\n");
      out.write("         ");
 
    	}
          
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- // .slide_list -->\r\n");
      out.write("      </div>\r\n");
      out.write("      <!-- // .slide_box -->\r\n");
      out.write("      <div class=\"slide_btn_box\">\r\n");
      out.write("        <button type=\"button\" class=\"slide_btn_prev\"><img src=\"image/arrow_left.png\" width=\"70\"></button>\r\n");
      out.write("        <button type=\"button\" class=\"slide_btn_next\"><img src=\"image/arrow_right14.png\" width=\"70\"></button>\r\n");
      out.write("      </div>\r\n");
      out.write("      <!-- // .slide_btn_box -->\r\n");
      out.write("      <!-- // .slide_pagination -->\r\n");
      out.write("    </div>\r\n");
      out.write("    \r\n");
      out.write("  \r\n");
      out.write("  <h1 class=\"title\">베이커리</h1>\r\n");
      out.write("    <a href=\"#\" class=\"link\" target=\"_blank\"></a>\r\n");
      out.write("   	<div class=\"slide_wrap slide5\">\r\n");
      out.write("      <div class=\"slide_box\">\r\n");
      out.write("        <div class=\"slide_list clearfix\">\r\n");
      out.write("       	");
 
    	ItemDao dao5 = new ItemDao();
    	List<ItemDto> list5 = dao.getListCategory("bakery", 0, 8);
    	
    	for(ItemDto dto: list5){
    		
       	
      out.write("\r\n");
      out.write("          <div class=\"slide_content slide01\">\r\n");
      out.write("          	<a href = \"#\" class = \"a\">\r\n");
      out.write("          	<img src=\"itemImg/");
      out.print(dto.getItem_img() );
      out.write("\" width=\"275\">\r\n");
      out.write("          	<p>상품명 : ");
      out.print(dto.getItem_name());
      out.write("</p>\r\n");
      out.write("          	<p>가격 : ");
      out.print(dto.getItem_price() );
      out.write("원</p>\r\n");
      out.write("          	</a>\r\n");
      out.write("          </div>\r\n");
      out.write("         ");
 
    	}
          
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- // .slide_list -->\r\n");
      out.write("      </div>\r\n");
      out.write("      <!-- // .slide_box -->\r\n");
      out.write("      <div class=\"slide_btn_box\">\r\n");
      out.write("        <button type=\"button\" class=\"slide_btn_prev\"><img src=\"image/arrow_left.png\" width=\"70\"></button>\r\n");
      out.write("        <button type=\"button\" class=\"slide_btn_next\"><img src=\"image/arrow_right14.png\" width=\"70\"></button>\r\n");
      out.write("      </div>\r\n");
      out.write("      <!-- // .slide_btn_box -->\r\n");
      out.write("      <!-- // .slide_pagination -->\r\n");
      out.write("    </div>\r\n");
      out.write("    \r\n");
      out.write("</div>\r\n");
      out.write("  <!-- // .container -->\r\n");
      out.write("\r\n");
      out.write("  <script> \r\n");
      out.write("  	slide('.slide1');\r\n");
      out.write("  	slide('.slide2');\r\n");
      out.write("  	slide('.slide3');\r\n");
      out.write("  	slide('.slide4');\r\n");
      out.write("  	slide('.slide5');\r\n");
      out.write("  	\r\n");
      out.write("    function slide(root_name) {\r\n");
      out.write("      const root = document.querySelector(root_name);\r\n");
      out.write("      const slideList = root.querySelector('.slide_list');  // Slide parent dom\r\n");
      out.write("      const slideContents = root.querySelectorAll('.slide_content');  // each slide dom\r\n");
      out.write("      const slideBtnNext = root.querySelector('.slide_btn_next'); // next button\r\n");
      out.write("      const slideBtnPrev = root.querySelector('.slide_btn_prev'); // prev button\r\n");
      out.write("      const slideLen = slideContents.length;  // slide length\r\n");
      out.write("      const slideWidth = 1220; // slide width\r\n");
      out.write("      const slideSpeed = 300; // slide speed\r\n");
      out.write("      const startNum = 0; // initial slide index (0 ~ 4)\r\n");
      out.write("      \r\n");
      out.write("      slideList.style.width = slideWidth * (slideLen + 2) + \"px\";\r\n");
      out.write("      \r\n");
      out.write("      // Copy first and last slide\r\n");
      out.write("      let firstChild = slideList.firstElementChild;\r\n");
      out.write("      let lastChild = slideList.lastElementChild;\r\n");
      out.write("      let clonedFirst = firstChild.cloneNode(true);\r\n");
      out.write("      let clonedLast = lastChild.cloneNode(true);\r\n");
      out.write("\r\n");
      out.write("      // Add copied Slides\r\n");
      out.write("      slideList.appendChild(clonedFirst);\r\n");
      out.write("      slideList.insertBefore(clonedLast, slideList.firstElementChild);\r\n");
      out.write("\r\n");
      out.write("      // Add pagination dynamically\r\n");
      out.write("\r\n");
      out.write("      slideList.style.transform = \"translate3d(-\" + (slideWidth)*0 + \"px, 0px, 0px)\";\r\n");
      out.write("\r\n");
      out.write("      let curIndex = startNum; // current slide index (except copied slide)\r\n");
      out.write("      let curSlide = slideContents[curIndex]; // current slide dom\r\n");
      out.write("      \r\n");
      out.write("      var next=0;\r\n");
      out.write("\r\n");
      out.write("      /** Next Button Event */\r\n");
      out.write("      slideBtnNext.addEventListener('click', function() {\r\n");
      out.write("        if (curIndex < slideLen-4) {\r\n");
      out.write("          slideList.style.transition = slideSpeed + \"ms\";\r\n");
      out.write("          slideList.style.transform = \"translate3d(-\" + (slideWidth * (next + 1)) + \"px, 0px, 0px)\";\r\n");
      out.write("\r\n");
      out.write("          if(curIndex<0){\r\n");
      out.write("        	  curIndex=0;\r\n");
      out.write("          }\r\n");
      out.write("          curIndex=curIndex+4;\r\n");
      out.write("          next=next+1;\r\n");
      out.write("          console.log(curIndex);\r\n");
      out.write("        }\r\n");
      out.write("        else if (curIndex >= slideLen-4) {\r\n");
      out.write("          setTimeout(function() {\r\n");
      out.write("            slideList.style.transition = \"1000ms\";\r\n");
      out.write("            slideList.style.transform = \"translate3d(-\" + (slideWidth)*0 + \"px, 0px, 0px)\";\r\n");
      out.write("          }, slideSpeed);\r\n");
      out.write("          curIndex = 0;\r\n");
      out.write("          next=0;\r\n");
      out.write("          console.log(curIndex);\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        curSlide = slideContents[curIndex];\r\n");
      out.write("      });\r\n");
      out.write("\r\n");
      out.write("      /** Prev Button Event */\r\n");
      out.write("      slideBtnPrev.addEventListener('click', function() {\r\n");
      out.write("        if (curIndex > 0) {\r\n");
      out.write("          slideList.style.transition = slideSpeed + \"ms\";\r\n");
      out.write("          slideList.style.transform = \"translate3d(-\" + slideWidth*(next-1) + \"px, 0px, 0px)\";\r\n");
      out.write("          \r\n");
      out.write("          curIndex=curIndex-4;\r\n");
      out.write("          \r\n");
      out.write("          next=next-1;\r\n");
      out.write("          \r\n");
      out.write("          console.log(curIndex);\r\n");
      out.write("        }\r\n");
      out.write("        else if (curIndex <= 0) {\r\n");
      out.write("          setTimeout(function() {\r\n");
      out.write("            slideList.style.transition = \"1000ms\";\r\n");
      out.write("            slideList.style.transform = \"translate3d(-\" + slideWidth*(slideLen/4-1) + \"px, 0px, 0px)\";\r\n");
      out.write("          }, slideSpeed);\r\n");
      out.write("          curIndex = slideLen-4;\r\n");
      out.write("          next= slideLen/4-1;\r\n");
      out.write("          console.log(curIndex);\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        curSlide = slideContents[curIndex];\r\n");
      out.write("      });\r\n");
      out.write("\r\n");
      out.write("    };\r\n");
      out.write("  </script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
