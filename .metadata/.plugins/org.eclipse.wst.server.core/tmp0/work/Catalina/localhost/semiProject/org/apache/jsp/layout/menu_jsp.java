/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.71
 * Generated at: 2023-03-21 02:43:58 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.layout;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class menu_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = null;
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

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"utf-8\">\n");
      out.write("<title>Insert title here</title>\n");
      out.write("<link\n");
      out.write("        href=\"https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap\"\n");
      out.write("        rel=\"stylesheet\">\n");
      out.write("		<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">\n");
      out.write("		<link rel=\"stylesheet\" type=\"text/css\" href=\"menu/css/font-awesome.css\">\n");
      out.write("		<link rel=\"stylesheet\" type=\"text/css\" href=\"menu/css/menu.css\">\n");
      out.write("		<link rel=\"stylesheet\" href=\"iconSource/all.min.css\">	\n");
      out.write("		<script src=\"iconSource/all.min.js\"></script>\n");
      out.write("		<script type=\"text/javascript\" src=\"menu/js/jquery.js\"></script>\n");
      out.write("		<script type=\"text/javascript\" src=\"menu/js/function.js\"></script>\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.6.3.js\"></script>\n");
      out.write("<style type=\"text/css\">\n");
      out.write("#menu {\n");
      out.write("\n");
      out.write("    height: 50px;\n");
      out.write("    background: white;\n");
      out.write("	text-align: center;\n");
      out.write("	\n");
      out.write("}\n");
      out.write("\n");
      out.write(".main1 {\n");
      out.write("\n");
      out.write("    width: 800px;\n");
      out.write("    height: 100%;\n");
      out.write("    margin: 0 auto;\n");
      out.write("\n");
      out.write("}\n");
      out.write("\n");
      out.write(".main1>li {\n");
      out.write("\n");
      out.write("    float: left;\n");
      out.write("    width: 25%;\n");
      out.write("    line-height: 50px;\n");
      out.write("    text-align: center;\n");
      out.write("    position: relative;\n");
      out.write("	list-style: none;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".main1>li:hover .main2 {\n");
      out.write("\n");
      out.write("    left: 0;\n");
      out.write("\n");
      out.write("}\n");
      out.write("\n");
      out.write(".main1>li a {\n");
      out.write("\n");
      out.write("    display: block;\n");
      out.write("	color: black;\n");
      out.write("	\n");
      out.write("}\n");
      out.write("\n");
      out.write(".main1>li a:hover {\n");
      out.write("\n");
      out.write("    background: white;\n");
      out.write("    color: #4B62D3;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".main2 {\n");
      out.write("\n");
      out.write("    position: absolute;\n");
      out.write("    top: 50px;\n");
      out.write("    left: -9999px;\n");
      out.write("    width: 120%;\n");
      out.write("    \n");
      out.write("}\n");
      out.write("\n");
      out.write(".main2>li {\n");
      out.write("\n");
      out.write("    position: relative;\n");
      out.write("    list-style: none;\n");
      out.write("\n");
      out.write("}\n");
      out.write("\n");
      out.write(".main2>li:hover .main3 {\n");
      out.write("\n");
      out.write("    left: 100%;\n");
      out.write("\n");
      out.write("}\n");
      out.write("\n");
      out.write(".main2>li a, .main3>li a {\n");
      out.write("\n");
      out.write("    border-radius: 10px;\n");
      out.write("    margin: 10px;\n");
      out.write("    \n");
      out.write("}\n");
      out.write("\n");
      out.write(".main3 {\n");
      out.write("\n");
      out.write("    position: absolute;\n");
      out.write("    top: 0;\n");
      out.write("    background: ;\n");
      out.write("    width: 80%;\n");
      out.write("    left: -9999px;\n");
      out.write("    /*left: 100%;*/\n");
      out.write("    /*display: none;*/\n");
      out.write("\n");
      out.write("}\n");
      out.write("\n");
      out.write(".main3>li a:hover {\n");
      out.write("\n");
      out.write("    background: white;\n");
      out.write("    color: black;\n");
      out.write("\n");
      out.write("}\n");
      out.write("</style>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write(" \n");
      out.write("	<div id=\"menu\">\n");
      out.write("\n");
      out.write("    <ul class=\"main1\">\n");
      out.write("\n");
      out.write("        <li><a href=\"\"><img alt=\"카데고리 아이콘\" src=\"image/menuicon.png\" style=\"width: 30px; margin-bottom: 5px;\">카테고리</a>\n");
      out.write("\n");
      out.write("            <ul class=\"main2\" style=\"z-index: 100; background: white; text-align: left;\">\n");
      out.write("\n");
      out.write("                <li><a href=\"index.jsp?main=layout/categoryList.jsp?category=fruit\"><i class=\"fa-solid fa-lemon\"></i>&nbsp;&nbsp;과일·견과·쌀</a></li>\n");
      out.write("                \n");
      out.write("                <li><a href=\"index.jsp?main=layout/categoryList.jsp?category=seafood\"><i class=\"fa-solid fa-fish\"></i>&nbsp;&nbsp;수산·해산·건어물</a></li>\n");
      out.write("                \n");
      out.write("                <li><a href=\"index.jsp?main=layout/categoryList.jsp?category=meat\"><i class=\"fa-solid fa-drumstick-bite\"></i>&nbsp;&nbsp;정육·계란</a></li>\n");
      out.write("                \n");
      out.write("                <li><a href=\"index.jsp?main=layout/categoryList.jsp?category=bakery\"><i class=\"fa-solid fa-cake-candles\"></i>&nbsp;&nbsp;베이커리·치즈·델리</a> </li>\n");
      out.write("            </ul>\n");
      out.write("\n");
      out.write("        </li>\n");
      out.write("\n");
      out.write("        <li><a href=\"index.jsp?main=layout/sinSang.jsp\">신상품</a>\n");
      out.write("\n");
      out.write("            <ul class=\"main2\">\n");
      out.write("\n");
      out.write("            </ul>\n");
      out.write("\n");
      out.write("        </li>\n");
      out.write("\n");
      out.write("        <li><a href=\"index.jsp?main=layout/best.jsp\">베스트</a>\n");
      out.write("\n");
      out.write("            <ul class=\"main2\">\n");
      out.write("\n");
      out.write("            </ul>\n");
      out.write("\n");
      out.write("        </li>\n");
      out.write("        \n");
      out.write("    </ul>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("</body>\n");
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