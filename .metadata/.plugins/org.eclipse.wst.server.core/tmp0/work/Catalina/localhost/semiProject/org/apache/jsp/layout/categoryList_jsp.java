/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.71
 * Generated at: 2023-03-22 06:52:55 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.layout;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import data.dao.ItemDao;
import data.dto.ItemDto;
import java.text.NumberFormat;

public final class categoryList_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes.add("data.dao.ItemDao");
    _jspx_imports_classes.add("java.text.NumberFormat");
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">\r\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-3.6.3.js\"></script>\r\n");
      out.write("    <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js\"></script>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write(".title{\r\n");
      out.write("	display: flex;\r\n");
      out.write("	margin: 0 20px;\r\n");
      out.write("	\r\n");
      out.write("}\r\n");
      out.write(".tb1{\r\n");
      out.write("	margin:50px 25px;\r\n");
      out.write("	\r\n");
      out.write("}\r\n");
      out.write(".cartbtn{\r\n");
      out.write("		background-color:#4B62D3;\r\n");
      out.write("		opacity : 0.8;\r\n");
      out.write("		border-radius: 100px;\r\n");
      out.write("		border: 0px;\r\n");
      out.write("		position: relative;\r\n");
      out.write("		top:-70px;\r\n");
      out.write("		left:225px;\r\n");
      out.write("	}\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("<!-- <script>\r\n");
      out.write("   $(function(){\r\n");
      out.write("      $(\"a.godetail\").click(function(){\r\n");
      out.write("         \r\n");
      out.write("         var item_num = $(this).attr(\"item_num\");\r\n");
      out.write("         \r\n");
      out.write("         location.href=\"index.jsp?main=layout/categoryList.jsp?item_num=\" + item_num;\r\n");
      out.write("      });\r\n");
      out.write("   });\r\n");
      out.write("\r\n");
      out.write("</script> -->\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<div class = \"container\">\r\n");
      out.write("    <div class = \"tab-content\">\r\n");
      out.write("     	<div id = \"tabs-1\" class = \"tab-pane fade in active\">\r\n");
      out.write("		<p>\r\n");
      out.write("			<table class = \"tb1\">\r\n");
      out.write("			<caption><b>전체상품목록</b></caption>\r\n");
      out.write("				<tr>\r\n");
      out.write("					");

					
					String category=request.getParameter("category");
					
					NumberFormat nf=NumberFormat.getCurrencyInstance();
					ItemDao dao = new ItemDao();
					List<ItemDto> list = dao.getAllCategory(category);
					int i=0;
					
					for(ItemDto dto:list)
					{
						String item_img = dto.getItem_img();
						
						
      out.write("\r\n");
      out.write("	                	<td>\r\n");
      out.write("	                	<div style=\"margin:0px 30px 30px 0px; height: 500px;\">\r\n");
      out.write("	                      <a item_num=\"");
      out.print(dto.getItem_num());
      out.write("\" style=\"cursor: pointer;\" class=\"godetail\">\r\n");
      out.write("	                      <img src=\"itemImg/");
      out.print(dto.getItem_img());
      out.write("\" class=\"photo\" style=\"width: 300px;\"></a>\r\n");
      out.write("	                      <button type = \"button\" class = \"cartbtn\" value=\"");
      out.print(dto.getItem_num());
      out.write("\"><img src=\"image/cart.png\" width=\"50\";></button>\r\n");
      out.write("          				  <a href=\"detail/detailView.jsp?item_num=");
      out.print(dto.getItem_num() );
      out.write("\" class = \"a\" style = \"text-decoration: none;\">\r\n");
      out.write("	                        <div style=\"color: black; font-size: 16px; text-align: left; \">\r\n");
      out.write("	                          <span>상품명: ");
      out.print(dto.getItem_name() );
      out.write("</span>\r\n");
      out.write("	                          <span>가격: ");
      out.print(nf.format(dto.getItem_price()));
      out.write("원</span>\r\n");
      out.write("	                        </div>\r\n");
      out.write("	                      </a> \r\n");
      out.write("	                      </div>\r\n");
      out.write("	                   </td>  \r\n");
      out.write("	                   ");

	                   if((i+1)%4==0)
	                   {
      out.write("\r\n");
      out.write("	                	   </tr>\r\n");
      out.write("	                	   <tr>\r\n");
      out.write("	                   ");
}
	                   i++;
					}
					
					
      out.write("\r\n");
      out.write("				</tr>	\r\n");
      out.write("			</table> 	\r\n");
      out.write("     	</p>\r\n");
      out.write("     	</div>\r\n");
      out.write("    </div>	\r\n");
      out.write("</div>\r\n");
      out.write("	<!-- Modal -->\r\n");
      out.write("  <div class=\"modal fade\" id=\"myModal\" role=\"dialog\">\r\n");
      out.write("    <div class=\"modal-dialog\">\r\n");
      out.write("    \r\n");
      out.write("      <!-- Modal content-->\r\n");
      out.write("      <div class=\"modal-content\">\r\n");
      out.write("        <div class=\"modal-header\">\r\n");
      out.write("          <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\r\n");
      out.write("          <h4 class=\"modal-title\"></h4>\r\n");
      out.write("          <br><br><br>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"modal-body\">\r\n");
      out.write("         <div class=\"pricewrapper\">\r\n");
      out.write("\r\n");
      out.write("		<button class=\"cnt_btn cnt_minus\">\r\n");
      out.write("\r\n");
      out.write("		<i class=\"fa-solid fa-minus\"></i>\r\n");
      out.write("	\r\n");
      out.write("		</button>\r\n");
      out.write("		\r\n");
      out.write("		<span class=\"cart_cnt\">1</span>\r\n");
      out.write("\r\n");
      out.write("		<button class=\"cnt_btn cnt_plus\">\r\n");
      out.write("\r\n");
      out.write("		<i class=\"fa-solid fa-plus\"></i>\r\n");
      out.write("\r\n");
      out.write("		</button>\r\n");
      out.write("		<h3 class = \"total_price\" total = \"\"></h3>\r\n");
      out.write("		</div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"modal-footer\">\r\n");
      out.write("          <button type=\"button\" class=\"btn btn-default cancel\" data-dismiss=\"modal\">취소</button>\r\n");
      out.write("          <button type=\"button\" class=\"btn btn-default add\" data-dismiss=\"modal\">장바구니 담기</button>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("      \r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("  \r\n");
      out.write("  <script type=\"text/javascript\">\r\n");
      out.write("  $(\".cnt_plus\").each(function(i,ele){\r\n");
      out.write("	  $(ele).click(function(){\r\n");
      out.write("	  var cnt=Number($(\".cart_cnt\").eq(i).text());\r\n");
      out.write("\r\n");
      out.write("	  //해당 상품의 하나의 값\r\n");
      out.write("\r\n");
      out.write("	  var one_price=$(\".total_price\").eq(i).attr(\"total\")/cnt;\r\n");
      out.write("	  $(\".cart_cnt\").eq(i).text(cnt+1);\r\n");
      out.write("	  $(\".cnt_minus\").eq(i).css(\"color\",\"black\");\r\n");
      out.write("	  $(\".cnt_minus\").eq(i).css(\"cursor\",\"pointer\");\r\n");
      out.write("\r\n");
      out.write("	  //가격 하나 더한 가격\r\n");
      out.write("\r\n");
      out.write("	  var total_price=one_price*(cnt+1);\r\n");
      out.write("	  $(\".total_price\").eq(i).text(total_price.toLocaleString('ko-KR')+\"원\");\r\n");
      out.write("	  var one_price=$(\".total_price\").eq(i).attr(\"total\",total_price);\r\n");
      out.write("	  });\r\n");
      out.write("	  });\r\n");
      out.write("	  //-버튼\r\n");
      out.write("\r\n");
      out.write("	  $(\".cnt_minus\").each(function(i,ele){\r\n");
      out.write("	  $(ele).click(function(){\r\n");
      out.write("	  var cnt=Number($(\".cart_cnt\").eq(i).text());\r\n");
      out.write("	  if(cnt!=1){\r\n");
      out.write("	  //해당 상품의 하나의 값\r\n");
      out.write("	  var one_price=$(\".total_price\").eq(i).attr(\"total\")/cnt;\r\n");
      out.write("\r\n");
      out.write("	  //console.log(one_price)\r\n");
      out.write("	  //개수 -1, 가격도 하나 뺀  가격으로\r\n");
      out.write("	  $(\".cart_cnt\").eq(i).text(cnt-1);\r\n");
      out.write("	  var total_price=one_price*(cnt-1);\r\n");
      out.write("	  $(\".total_price\").eq(i).text(total_price.toLocaleString('ko-KR')+\"원\");\r\n");
      out.write("	  var one_price=$(\".total_price\").eq(i).attr(\"total\",total_price);\r\n");
      out.write("	  }\r\n");
      out.write("\r\n");
      out.write("	  if(cnt==1){\r\n");
      out.write("	  //1이라면\r\n");
      out.write("	  $(\".cnt_minus\").eq(i).css(\"color\",\"lightgray\");\r\n");
      out.write("	  $(\".cnt_minus\").eq(i).css(\"cursor\",\"default\");\r\n");
      out.write("	  }\r\n");
      out.write("	  });\r\n");
      out.write("	});\r\n");
      out.write("  \r\n");
      out.write("  	$(\".cartbtn\").each(function(i,ele){\r\n");
      out.write("  		$(ele).click(function(){\r\n");
      out.write("  			$('#myModal').modal(); //열기 \r\n");
      out.write("  			var item_num = $(ele).val();\r\n");
      out.write("  			$.ajax({\r\n");
      out.write("  				type:\"get\",\r\n");
      out.write("  				dataType:\"json\",\r\n");
      out.write("  				data:{\"item_num\":item_num},\r\n");
      out.write("  				url:\"common/itemInfo.jsp\",\r\n");
      out.write("  				success:function(res){\r\n");
      out.write("  					$('.modal-header').html(res.item_name);\r\n");
      out.write("  					\r\n");
      out.write("  					$('.total_price').text(res.item_price.toLocaleString('ko-KR') + \"원\");\r\n");
      out.write("  					$('.total_price').attr(\"total\", res.item_price);\r\n");
      out.write("  				}\r\n");
      out.write("  			});\r\n");
      out.write("  			\r\n");
      out.write("  		});\r\n");
      out.write("  	});\r\n");
      out.write("  	$(\".cancel\").click(function(){\r\n");
      out.write("  		$('#myModal').modal(\"hide\"); //닫기 \r\n");
      out.write("  	});\r\n");
      out.write("  \r\n");
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
