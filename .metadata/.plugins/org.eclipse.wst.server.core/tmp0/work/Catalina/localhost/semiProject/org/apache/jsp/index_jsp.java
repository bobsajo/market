/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.71
 * Generated at: 2023-03-20 05:59:12 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("div.includewrap{\r\n");
      out.write("   width:100%;\r\n");
      out.write("   /* margin:0 auto; */\r\n");
      out.write("   \r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("div.menu{\r\n");
      out.write("   z-index:100;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("div.main{\r\n");
      out.write("   z-index:-1;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("/* div.mainbanner{\r\n");
      out.write("/*    text-align:center; \r\n");
      out.write("   position:absolute;\r\n");
      out.write("   top:20%;\r\n");
      out.write("}*/\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("/* div.layout{\r\n");
      out.write("   border: 0px solid gray;\r\n");
      out.write("   position: absolute;\r\n");
      out.write("   display:inline-flex;\r\n");
      out.write("} */\r\n");
      out.write("\r\n");
      out.write(".btns {\r\n");
      out.write("  display: flex;\r\n");
      out.write("  position: fixed;\r\n");
      out.write("  right: .4rem;\r\n");
      out.write("  bottom: .4rem;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".btns > div {\r\n");
      out.write("  padding: .6rem 1.5rem;\r\n");
      out.write("  background: #111;\r\n");
      out.write("  display: flex;\r\n");
      out.write("  justify-content: center;\r\n");
      out.write("  align-items: center;\r\n");
      out.write("  cursor: pointer;\r\n");
      out.write("  border-radius: 5px;\r\n");
      out.write("  transition: .2s;\r\n");
      out.write("  color: #fff;\r\n");
      out.write("  margin-right: .4rem;\r\n");
      out.write("  \r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".moveTopBtn:hover {\r\n");
      out.write("  color: #000;\r\n");
      out.write("  background: #febf00;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");

   String mainPage = "layout/main.jsp";

   if(request.getParameter("main")!=null)
   {
      mainPage = request.getParameter("main");
   }
   String root = request.getContextPath();

      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("<div class = \"includewrap\">\r\n");
      out.write("\r\n");
      out.write("   <div class=\"layout title\">\r\n");
      out.write("     ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "layout/title2.jsp", out, false);
      out.write("\r\n");
      out.write("   </div>\r\n");
      out.write("\r\n");
      out.write("   <div class=\"layout menu\">\r\n");
      out.write("     ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "layout/menu.jsp", out, false);
      out.write("\r\n");
      out.write("   </div> \r\n");
      out.write("\r\n");
      out.write("   <div class=\"layout main\">\r\n");
      out.write("     ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "layout/main.jsp", out, false);
      out.write("\r\n");
      out.write("   </div>\r\n");
      out.write("\r\n");
      out.write("   <div class=\"layout footer\">\r\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "layout/footer.jsp", out, false);
      out.write("\r\n");
      out.write("   </div>\r\n");
      out.write("   \r\n");
      out.write("   <div class = \"btns\">\r\n");
      out.write("   <div class = \"moveTopBtn\"><span class = \"glyphicon glyphicon-triangle-top\"></span>&nbsp;&nbsp;맨 위로</div>\r\n");
      out.write("   </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("	const $topBtn = document.querySelector(\".moveTopBtn\");\r\n");
      out.write("\r\n");
      out.write("	//버튼 클릭 시 맨 위로 이동\r\n");
      out.write("	$topBtn.onclick = () => {\r\n");
      out.write("	window.scrollTo({ top: 0, behavior: \"smooth\" });  \r\n");
      out.write("	}\r\n");
      out.write("</script>\r\n");
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
