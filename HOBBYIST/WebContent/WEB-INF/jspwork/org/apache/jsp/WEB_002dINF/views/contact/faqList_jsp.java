/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.54
 * Generated at: 2021-11-11 09:49:22 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.contact;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import member.model.vo.Member;
import member.model.vo.Member;

public final class faqList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/WEB-INF/views/contact/../common/topbar.jsp", Long.valueOf(1636621575883L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("member.model.vo.Member");
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
      response.setContentType("text/html; charset=UTF-8");
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
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<script src=\"js/jquery-3.6.0.min.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/menubar.css\">\r\n");
      out.write("<script src=\"js/menubar.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<div class=\"app-dashboard shrink-medium\">\r\n");
      out.write("	\r\n");
      out.write("		<!-- 상단바 -->\r\n");
      out.write("		");
      out.write('\r');
      out.write('\n');

	Member loginUser = (Member)session.getAttribute("loginUser");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/menubar.css\">\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print( request.getContextPath() );
      out.write("/js/jquery-3.6.0.min.js\"></script> <!-- 여기다 연결하면 jquery 어디에서나 쓸수 있음 -->\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<header>\r\n");
      out.write("	  <nav>\r\n");
      out.write("		<!-- 상단바 -->\r\n");
      out.write("			<div class=\"row expanded app-dashboard-top-nav-bar\">\r\n");
      out.write("				<div class=\"topbar columns medium-2\">\r\n");
      out.write("					<a class=\"app-dashboard-logo\" href=\"");
      out.print( request.getContextPath() );
      out.write("\"><img\r\n");
      out.write("						src=\"images/logo.png\" width=\"70px\" height=\"55px\"></a>\r\n");
      out.write("				</div>\r\n");
      out.write("				<div class=\"topbar columns shrink app-dashboard-top-bar-actions\">\r\n");
      out.write("				\r\n");
      out.write("					");
 if(loginUser == null) { 
      out.write("\r\n");
      out.write("					<div class=\"nav-item\"><a class=\"nav-link\"><img src=\"images/myPage.png\" onclick=\"alert('로그인을 먼저 해주세요.');\"></a></div>\r\n");
      out.write("					");
 } else { 
      out.write("\r\n");
      out.write("					<div class=\"nav-item\"><a class=\"nav-link\" href=\"");
      out.print( request.getContextPath() );
      out.write("/myInfo.me\"><img src=\"images/myPage.png\"></a></div> <!-- 마이페이지아이콘 -->\r\n");
      out.write("					");
 }  
      out.write("\r\n");
      out.write("					\r\n");
      out.write("					<div class=\"nav-item\"><a class=\"nav-link\" href=\"");
      out.print( request.getContextPath() );
      out.write("/contact.co\"><img src=\"images/contact.png\"></a></div> <!-- 콘택트아이콘 -->\r\n");
      out.write("							\r\n");
      out.write("					");
 if(loginUser == null) { 
      out.write("\r\n");
      out.write("						<div class=\"nav-item\"><a class=\"nav-link\"><img src=\"images/like.png\" onclick=\"alert('로그인을 먼저 해주세요.');\"></a></div>\r\n");
      out.write("					");
 } else { 
      out.write("\r\n");
      out.write("						<div class=\"nav-item\"><a class=\"nav-link\" href=\"");
      out.print( request.getContextPath() );
      out.write("/myClass.te\"><img src=\"images/like.png\"></a></div> <!-- 찜아이콘  -->\r\n");
      out.write("					");
 }  
      out.write("\r\n");
      out.write("					\r\n");
      out.write("						\r\n");
      out.write("					");
 if(loginUser == null) { 
      out.write("\r\n");
      out.write("						<div class=\"nav-item\"><a class=\"nav-link\" href=\"");
      out.print( request.getContextPath() );
      out.write("/loginForm.me\"><button id=\"logBtn\">Login</button></a></div> <!-- 로그인 -->\r\n");
      out.write("					");
 } else { 
      out.write("\r\n");
      out.write("						<div class=\"nav-item\"><a class=\"nav-link\" href=\"");
      out.print( request.getContextPath() );
      out.write("/logout.me\"><button id=\"logBtn\">Logout</button></a></div> <!-- 로그아웃 -->\r\n");
      out.write("					");
 } 
      out.write("\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("		</nav>\r\n");
      out.write("	</header>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("		\r\n");
      out.write("		<!-- 바디 영역(사이드바, 본문) -->\r\n");
      out.write("		<div class=\"app-dashboard-body off-canvas-wrapper\">\r\n");
      out.write("		\r\n");
      out.write("			<!-- 사이드바 영역 -->\r\n");
      out.write("			<div id=\"app-dashboard-sidebar\" class=\"app-dashboard-sidebar position-left off-canvas off-canvas-absolute reveal-for-medium\" data-off-canvas>\r\n");
      out.write("				\r\n");
      out.write("				<!-- 사이드바 close, open -->\r\n");
      out.write("				<div class=\"app-dashboard-sidebar-title-area\">\r\n");
      out.write("					<div class=\"app-dashboard-close-sidebar\">\r\n");
      out.write("						<!-- Close button -->\r\n");
      out.write("						<button id=\"close-sidebar\" data-app-dashboard-toggle-shrink\r\n");
      out.write("							class=\"app-dashboard-sidebar-close-button show-for-medium\"\r\n");
      out.write("							aria-label=\"Close menu\" type=\"button\">\r\n");
      out.write("							<span aria-hidden=\"true\"><a href=\"#\"><i\r\n");
      out.write("									class=\"large fa fa-angle-double-left\"><img\r\n");
      out.write("								src=\"images/three-dots-vertical.svg\"></i></a></span> \r\n");
      out.write("						</button>\r\n");
      out.write("					</div>\r\n");
      out.write("					<!-- open button -->\r\n");
      out.write("					<div class=\"app-dashboard-open-sidebar\">\r\n");
      out.write("						<button id=\"open-sidebar\" data-app-dashboard-toggle-shrink\r\n");
      out.write("							class=\"app-dashboard-open-sidebar-button show-for-medium\"\r\n");
      out.write("							aria-label=\"open menu\" type=\"button\">\r\n");
      out.write("							<span aria-hidden=\"true\"><a href=\"#\"><i\r\n");
      out.write("									class=\"large fa fa-angle-double-right\"><img\r\n");
      out.write("								src=\"images/three-dots-vertical.svg\"></i></a></span> \r\n");
      out.write("						</button>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("				\r\n");
      out.write("				<!-- 사이드바 -->\r\n");
      out.write("				<div class=\"app-dashboard-sidebar-inner\">\r\n");
      out.write("					<ul class=\"menu vertical\">\r\n");
      out.write("						<li><a href=\"");
      out.print( request.getContextPath() );
      out.write("/contact.co\">\r\n");
      out.write("							<span class=\"app-dashboard-sidebar-text\"><h3>FAQ</h3></span>\r\n");
      out.write("						</a></li>\r\n");
      out.write("						<li><a href=\"\">\r\n");
      out.write("							<span class=\"app-dashboard-sidebar-text\"><h3>1:1문의</h3></span>\r\n");
      out.write("						</a></li>\r\n");
      out.write("						<br><br><br>\r\n");
      out.write("					</ul>\r\n");
      out.write("					\r\n");
      out.write("					\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("\r\n");
      out.write("			<!-- 본문 영역 -->\r\n");
      out.write("			<div class=\"app-dashboard-body-content off-canvas-content\" data-off-canvas-content>\r\n");
      out.write("				\r\n");
      out.write("						faqlist\r\n");
      out.write("						여기다 본문 내용 적기\r\n");
      out.write("						adsfadsfasdf\r\n");
      out.write("						<p>adsfadsf</p>\r\n");
      out.write("			</div>\r\n");
      out.write("			\r\n");
      out.write("			\r\n");
      out.write("		</div>\r\n");
      out.write("		\r\n");
      out.write("			<!-- FOOTER -->\r\n");
      out.write("			<footer class=\"container\" style=\"text-align: center; background: #F5F5F5;\">\r\n");
      out.write("			\r\n");
      out.write("				<p class=\"float-end\">\r\n");
      out.write("					<a href=\"#\">Back to top</a>\r\n");
      out.write("				</p>\r\n");
      out.write("				<p>\r\n");
      out.write("					&copy; 2021 HOBBYIST, Inc. &middot; <a href=\"");
      out.print( request.getContextPath() );
      out.write("/contact.co\">Contact</a>\r\n");
      out.write("					<!-- &middot; <a href=\"#\">Terms</a> -->\r\n");
      out.write("				</p>\r\n");
      out.write("			</footer> \r\n");
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
