/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.71
 * Generated at: 2023-03-24 08:15:20 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.login;

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
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">\r\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"login/loginForm.css\">\r\n");
      out.write("<title>loginForm</title>\r\n");
      out.write("\r\n");
      out.write("	<style type=\"text/css\">\r\n");
      out.write("		/*div.login_container{\r\n");
      out.write("			width: 100%;\r\n");
      out.write("			margin-top: 10px;\r\n");
      out.write("		}\r\n");
      out.write("\r\n");
      out.write("		form.login_form{\r\n");
      out.write("			width: 340px;\r\n");
      out.write("			margin: 0 auto;\r\n");
      out.write("		}\r\n");
      out.write("\r\n");
      out.write("		#input_div{\r\n");
      out.write("			text-align: center;\r\n");
      out.write("		}\r\n");
      out.write("\r\n");
      out.write("		#input_div>h4{\r\n");
      out.write("			margin-bottom: 30px;\r\n");
      out.write("		}\r\n");
      out.write("\r\n");
      out.write("		input.login_input{\r\n");
      out.write("			width: 100%;\r\n");
      out.write("			font-size: 10pt;\r\n");
      out.write("			height: 54px;\r\n");
      out.write("			border: 1px solid lightgray;\r\n");
      out.write("			margin-bottom: 10px;\r\n");
      out.write("		}\r\n");
      out.write("\r\n");
      out.write("		input.login_input:active{\r\n");
      out.write("			border: 1px solid gray;\r\n");
      out.write("		}\r\n");
      out.write("\r\n");
      out.write("		#login_search{\r\n");
      out.write("			text-align: right;\r\n");
      out.write("			display: inline-block;\r\n");
      out.write("			float: left;\r\n");
      out.write("			width: 100%;\r\n");
      out.write("		}\r\n");
      out.write("\r\n");
      out.write("		span.search:hover{\r\n");
      out.write("			cursor: pointer;\r\n");
      out.write("		}\r\n");
      out.write("\r\n");
      out.write("		button.login_btn{\r\n");
      out.write("			width: 100%;\r\n");
      out.write("			height: 55px;\r\n");
      out.write("			margin-top: 10px;\r\n");
      out.write("			border-radius: 5px;\r\n");
      out.write("			font-size: 12pt;\r\n");
      out.write("			font-weight: bold;\r\n");
      out.write("		}\r\n");
      out.write("\r\n");
      out.write("		.search {\r\n");
      out.write("			border: 0px;\r\n");
      out.write("			padding: 0px;\r\n");
      out.write("			display: inline-block;\r\n");
      out.write("		}\r\n");
      out.write("\r\n");
      out.write("		#submit_btn{\r\n");
      out.write("			color: white;\r\n");
      out.write("			background-color: #4B62D3;\r\n");
      out.write("			border: 1px solid #4B62D3;\r\n");
      out.write("		}\r\n");
      out.write("\r\n");
      out.write("		#join_btn{\r\n");
      out.write("			color: #4B62D3;\r\n");
      out.write("			background: white;\r\n");
      out.write("			border: 1px solid #4B62D3;\r\n");
      out.write("		}\r\n");
      out.write("*/\r\n");
      out.write("	</style>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");

	String item_num=request.getParameter("item_num");

      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("	<div class=\"login_container\">	\r\n");
      out.write("		<form action=\"../login/loginAction.jsp\" method=\"post\" class=\"login_form\">\r\n");
      out.write("		<input type=\"hidden\" name=\"item_num\" value=\"");
      out.print(item_num );
      out.write("\">\r\n");
      out.write("			<div id=\"input_div\">\r\n");
      out.write("				<h4><b>로그인</b></h4>\r\n");
      out.write("				<input type=\"text\" name=\"id\" placeholder=\"아이디를 입력해주세요\" \r\n");
      out.write("				class=\"input-lg login_input\" required=\"required\">\r\n");
      out.write("				<input type=\"password\" name=\"pass\" placeholder=\"비밀번호를 입력해주세요\" \r\n");
      out.write("				class=\"input-lg login_input\" required=\"required\">\r\n");
      out.write("			</div>\r\n");
      out.write("			<div id=\"login_search\">\r\n");
      out.write("				<a href=\"index.jsp?main=login/searchIdForm.jsp\"><span class=\"searchLogin search_id\">아이디 찾기</span></a> | <a href=\"index.jsp?main=login/searchPassForm.jsp\"><span class=\"searchLogin search_pass\">비밀번호 찾기</span></a></h6>\r\n");
      out.write("			</div>\r\n");
      out.write("			<div id=\"btn_div\">\r\n");
      out.write("				<button type=\"submit\" class=\"login_btn\" id=\"submit_btn\">로그인</button><br>\r\n");
      out.write("				<button type=\"button\" class=\"login_btn\" id=\"join_btn\" \r\n");
      out.write("				onclick=\"location.href='joinForm.jsp'\">회원가입</button>\r\n");
      out.write("			</div>\r\n");
      out.write("		</form>\r\n");
      out.write("	</div>\r\n");
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
