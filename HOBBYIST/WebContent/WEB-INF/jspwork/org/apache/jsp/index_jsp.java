/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.54
 * Generated at: 2021-11-12 15:47:34 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import member.model.vo.Member;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/views/main/mainPage.jsp", Long.valueOf(1636731455333L));
    _jspx_dependants.put("/WEB-INF/views/main/../common/mainPageTopbar.jsp", Long.valueOf(1636720971936L));
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
      out.write("<title>mainPage</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>mainPage</title>\r\n");
      out.write("<script src=\"js/jquery-3.6.0.min.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/mainPage.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<!-- 상단바 소스코드 include -->\r\n");
      out.write("	");
      out.write('\r');
      out.write('\n');

	 Member loginUser = (Member)session.getAttribute("loginUser");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>top navbar</title>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print( request.getContextPath() );
      out.write("/js/jquery-3.6.0.min.js\"></script> <!-- 여기다 연결하면 jquery 어디에서나 쓸수 있음 -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("	<!-- Required meta tags -->\r\n");
      out.write("	<meta charset=\"utf-8\">\r\n");
      out.write("	<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("	<meta name=\"description\" content=\"\">\r\n");
      out.write("	<meta name=\"author\"\r\n");
      out.write("		content=\"Mark Otto, Jacob Thornton, and Bootstrap contributors\">\r\n");
      out.write("	<meta name=\"generator\" content=\"Hugo 0.88.1\">\r\n");
      out.write("	\r\n");
      out.write(" 	<!-- Bootstrap CSS CDN -->\r\n");
      out.write(" 	<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\"\r\n");
      out.write("		rel=\"stylesheet\" integrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\" crossorigin=\"anonymous\">\r\n");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("	#top{\r\n");
      out.write("		background: #9ED4C2;\r\n");
      out.write("		display: inline-block;\r\n");
      out.write("		text-align: right;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	#logo img{\r\n");
      out.write("		position: absolute;\r\n");
      out.write("		margin-left: 46.91%; /* 메인페이지의 로고위치를 다른 페이지들과 맞춤 */\r\n");
      out.write("		top: 10%;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	.nav-item img{\r\n");
      out.write("		heigh: 25px;\r\n");
      out.write("		width: 25px; \r\n");
      out.write("		margin-right: 10px;\r\n");
      out.write("		margin-top: 25%;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	#logBtn{\r\n");
      out.write("		background: none;\r\n");
      out.write("		border: 1px solid white;\r\n");
      out.write("		color: white;\r\n");
      out.write("		width: 80px;\r\n");
      out.write("		height: 40px;\r\n");
      out.write("		font-size: large;\r\n");
      out.write("		font-weight: bold;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	#logBtn:hover{\r\n");
      out.write("		background: white;\r\n");
      out.write("		color: #5F9EA0; /* CadetBlue */\r\n");
      out.write("		border: 1px solid #5F9EA0;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	header {\r\n");
      out.write("		/* 상단바의 폰트 적용 */\r\n");
      out.write("		font-family: monospace;\r\n");
      out.write("		\r\n");
      out.write("	}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<header>\r\n");
      out.write("		<nav id=\"top\" class=\"navbar navbar-expand-md navbar-dark fixed-top\"> <!-- fixed-top : 상단에 고정 -->\r\n");
      out.write("	 		<div class=\"container-fluid\"> \r\n");
      out.write("	 				<div id=\"logo\">\r\n");
      out.write("						<a href=\"");
      out.print( request.getContextPath() );
      out.write("\">\r\n");
      out.write("							<img src=\"");
      out.print( request.getContextPath() );
      out.write("/images/logo.png\" width=\"70px\"height=\"55px\">\r\n");
      out.write("						</a>\r\n");
      out.write("					</div>\r\n");
      out.write("			 \r\n");
      out.write("					<div id=\"navList\">\r\n");
      out.write("						<ul class=\"navbar-nav me-auto mb-2 mb-md-0\"> <!-- navbar-nav me-auto mb-2 mb-md-0 : li 옆에 나열하는 효과  -->\r\n");
      out.write("							");
 if(loginUser == null) { 
      out.write("\r\n");
      out.write("							<li class=\"nav-item\"><a class=\"nav-link\"><img src=\"images/myPage.png\" onclick=\"alert('로그인을 먼저 해주세요.');\"></a></li>\r\n");
      out.write("							");
 } else { 
      out.write("\r\n");
      out.write("							<li class=\"nav-item\"><a class=\"nav-link\" href=\"");
      out.print( request.getContextPath() );
      out.write("/myInfo.me\"><img src=\"images/myPage.png\"></a></li> <!-- 마이페이지 정보조회 아이콘 -->\r\n");
      out.write("							");
 }  
      out.write("\r\n");
      out.write("							<li class=\"nav-item\"><a class=\"nav-link\" href=\"");
      out.print( request.getContextPath() );
      out.write("/contact.co\"><img src=\"images/contact.png\"></a></li> <!-- 콘택트아이콘 -->\r\n");
      out.write("							\r\n");
      out.write("							");
 if(loginUser == null) { 
      out.write("\r\n");
      out.write("							<li class=\"nav-item\"><a class=\"nav-link\"><img src=\"images/like.png\" onclick=\"alert('로그인을 먼저 해주세요.');\"></a></li><!-- 내클래스(찜한클래스) 아이콘  -->	\r\n");
      out.write("							");
 } else { 
      out.write("\r\n");
      out.write("							<li class=\"nav-item\"><a class=\"nav-link\" href=\"");
      out.print( request.getContextPath() );
      out.write("/myClass.te\"><img src=\"images/like.png\"></a></li> \r\n");
      out.write("							");
 }  
      out.write("\r\n");
      out.write("							\r\n");
      out.write("							");
 if(loginUser == null) { 
      out.write("\r\n");
      out.write("								<li class=\"nav-item\"><a class=\"nav-link\" href=\"");
      out.print( request.getContextPath() );
      out.write("/loginForm.me\"><button id=\"logBtn\">Login</button></a></li> <!-- 로그인 -->\r\n");
      out.write("							");
 } else { 
      out.write("\r\n");
      out.write("								<li class=\"nav-item\"><a class=\"nav-link\" href=\"");
      out.print( request.getContextPath() );
      out.write("/logout.me\"><button id=\"logBtn\">Logout</button></a></li> <!-- 로그아웃 -->\r\n");
      out.write("							");
 } 
      out.write("\r\n");
      out.write("						</ul>\r\n");
      out.write("					</div>\r\n");
      out.write("			</div>\r\n");
      out.write("		</nav>\r\n");
      out.write("	</header>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write(" \r\n");
      out.write("	\r\n");
      out.write("	<!-- 본문 -->\r\n");
      out.write("	<main>\r\n");
      out.write("		<div id=\"myCarousel\" class=\"carousel slide\" data-bs-ride=\"carousel\">\r\n");
      out.write("			<div class=\"carousel-indicators\">\r\n");
      out.write("				<button type=\"button\" data-bs-target=\"#myCarousel\"\r\n");
      out.write("					data-bs-slide-to=\"0\" class=\"active\" aria-current=\"true\"\r\n");
      out.write("					aria-label=\"Slide 1\"></button>\r\n");
      out.write("				<button type=\"button\" data-bs-target=\"#myCarousel\"\r\n");
      out.write("					data-bs-slide-to=\"1\" aria-label=\"Slide 2\"></button>\r\n");
      out.write("				<button type=\"button\" data-bs-target=\"#myCarousel\"\r\n");
      out.write("					data-bs-slide-to=\"2\" aria-label=\"Slide 3\"></button>\r\n");
      out.write("			</div>\r\n");
      out.write("\r\n");
      out.write("			<div class=\"carousel-inner\">\r\n");
      out.write("				<div class=\"carousel-item active\">\r\n");
      out.write("					<!-- 배경화면 : svg태그 끝을 알리는 태그 옆에 img태그 삽입 -->\r\n");
      out.write("					<svg class=\"bd-placeholder-img\" width=\"100%\" height=\"100%\"\r\n");
      out.write("						xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\"\r\n");
      out.write("						preserveAspectRatio=\"xMidYMid slice\" focusable=\"false\">\r\n");
      out.write("						<rect width=\"100%\" height=\"100%\" fill=\"#777\" />\r\n");
      out.write("						<img src=\"images/pastel.png\"></svg>\r\n");
      out.write("\r\n");
      out.write("					<div class=\"container\">\r\n");
      out.write("						<div class=\"carousel-caption text-end\">\r\n");
      out.write("\r\n");
      out.write("							<h1>Example headline.</h1>\r\n");
      out.write("							<p>Some representative placeholder content for the first\r\n");
      out.write("								slide of the carousel.</p>\r\n");
      out.write("							<!-- 검색창 -->\r\n");
      out.write("							<form class=\"d-flex search-class\">\r\n");
      out.write("								<input class=\"search-class form-control me-2\" type=\"search\"\r\n");
      out.write("									placeholder=\"어떤 클래스를 원하시나요?\" aria-label=\"Search\">\r\n");
      out.write("								<button class=\"btn btn-outline-success\" type=\"submit\">Search</button>\r\n");
      out.write("							</form>\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("\r\n");
      out.write("				<div class=\"carousel-item\">\r\n");
      out.write("\r\n");
      out.write("					<svg class=\"bd-placeholder-img\" width=\"100%\" height=\"100%\"\r\n");
      out.write("						xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\"\r\n");
      out.write("						preserveAspectRatio=\"xMidYMid slice\" focusable=\"false\">\r\n");
      out.write("						<rect width=\"100%\" height=\"100%\" fill=\"#777\" />\r\n");
      out.write("						<img src=\"images/mint.jpg\"></svg>\r\n");
      out.write("\r\n");
      out.write("					<div class=\"container\">\r\n");
      out.write("						<div class=\"carousel-caption text-end\">\r\n");
      out.write("							<h1>Another example headline.</h1>\r\n");
      out.write("							<p>Some representative placeholder content for the second\r\n");
      out.write("								slide of the carousel.</p>\r\n");
      out.write("							<!--  <p><a class=\"btn btn-lg btn-primary\" href=\"#\">Learn more</a></p> -->\r\n");
      out.write("							<!-- 검색창 -->\r\n");
      out.write("							<form class=\"d-flex search-class\">\r\n");
      out.write("								<input class=\"form-control me-2\" type=\"search\"\r\n");
      out.write("									placeholder=\"어떤 클래스를 원하시나요?\" aria-label=\"Search\">\r\n");
      out.write("								<button class=\"btn btn-outline-success\" type=\"submit\">Search</button>\r\n");
      out.write("							</form>\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("				<div class=\"carousel-item\">\r\n");
      out.write("\r\n");
      out.write("					<svg class=\"bd-placeholder-img\" width=\"100%\" height=\"100%\"\r\n");
      out.write("						xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\"\r\n");
      out.write("						preserveAspectRatio=\"xMidYMid slice\" focusable=\"false\">\r\n");
      out.write("						<rect width=\"100%\" height=\"100%\" fill=\"#777\" />\r\n");
      out.write("						<img src=\"images/green.jpg\"></svg>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("					<div class=\"container\">\r\n");
      out.write("						<div class=\"carousel-caption text-end\">\r\n");
      out.write("							<h1>One more for good measure.</h1>\r\n");
      out.write("							<p>Some representative placeholder content for the third\r\n");
      out.write("								slide of this carousel.</p>\r\n");
      out.write("\r\n");
      out.write("							<form class=\"d-flex search-class\">\r\n");
      out.write("								<input class=\"search-class form-control me-2 search\" type=\"search\"\r\n");
      out.write("									placeholder=\"어떤 클래스를 원하시나요?\" aria-label=\"Search\">\r\n");
      out.write("								<button class=\"btn btn-outline-success\" type=\"submit\">Search</button>\r\n");
      out.write("							</form>\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("			<button class=\"carousel-control-prev\" type=\"button\"\r\n");
      out.write("				data-bs-target=\"#myCarousel\" data-bs-slide=\"prev\">\r\n");
      out.write("				<span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>\r\n");
      out.write("				<span class=\"visually-hidden\">Previous</span>\r\n");
      out.write("			</button>\r\n");
      out.write("			<button class=\"carousel-control-next\" type=\"button\"\r\n");
      out.write("				data-bs-target=\"#myCarousel\" data-bs-slide=\"next\">\r\n");
      out.write("				<span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>\r\n");
      out.write("				<span class=\"visually-hidden\">Next</span>\r\n");
      out.write("			</button>\r\n");
      out.write("		</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("		<!-- Marketing messaging and featurettes\r\n");
      out.write("  ================================================== -->\r\n");
      out.write("		<!-- Wrap the rest of the page in another container to center all the content. -->\r\n");
      out.write("\r\n");
      out.write("		<div class=\"container marketing\">\r\n");
      out.write("\r\n");
      out.write("			<div class=\"album py-5 bg-light\">\r\n");
      out.write("				<div class=\"container\">\r\n");
      out.write("\r\n");
      out.write("					<div class=\"row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3\">\r\n");
      out.write("						<div class=\"col\">\r\n");
      out.write("							<div class=\"card shadow-sm\">\r\n");
      out.write("								<svg class=\"bd-placeholder-img card-img-top\" width=\"100%\"\r\n");
      out.write("									height=\"225\" xmlns=\"http://www.w3.org/2000/svg\" role=\"img\"\r\n");
      out.write("									aria-label=\"Placeholder: Thumbnail\"\r\n");
      out.write("									preserveAspectRatio=\"xMidYMid slice\" focusable=\"false\">\r\n");
      out.write("									<title>Placeholder</title><rect width=\"100%\" height=\"100%\"\r\n");
      out.write("										fill=\"#55595c\" />\r\n");
      out.write("									<text x=\"50%\" y=\"50%\" fill=\"#eceeef\" dy=\".3em\">Thumbnail</text></svg>\r\n");
      out.write("\r\n");
      out.write("								<div class=\"card-body\">\r\n");
      out.write("									<p class=\"card-text\">This is a wider card with supporting\r\n");
      out.write("										text below as a natural lead-in to additional content. This\r\n");
      out.write("										content is a little bit longer.</p>\r\n");
      out.write("									<div class=\"d-flex justify-content-between align-items-center\">\r\n");
      out.write("										<small class=\"text-muted\">조회수</small>\r\n");
      out.write("											");
      out.write("\r\n");
      out.write("											");
 if (loginUser != null) { 
      out.write("\r\n");
      out.write("											<button class=\"button-like\"> \r\n");
      out.write("												<!-- i : 아이콘 태그 -->\r\n");
      out.write("												<i class=\"fa fa-heart\">\r\n");
      out.write("													<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"13\" height=\"12\" fill=\"currentColor\" class=\"bi bi-heart-fill\" viewBox=\"0 0 16 16\">\r\n");
      out.write("  														<path fill-rule=\"evenodd\" d=\"M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z\" />\r\n");
      out.write("													</svg>\r\n");
      out.write("												</i>\r\n");
      out.write("												<span>Like</span>\r\n");
      out.write("											</button>											\r\n");
      out.write("											");
 } else {  
      out.write("\r\n");
      out.write("											<button class=\"button-like\" disabled onclick=\"alert('로그인을 먼저 해주세요')\"> \r\n");
      out.write("												<!-- i : 아이콘 태그 -->\r\n");
      out.write("												<i class=\"fa fa-heart\">\r\n");
      out.write("													<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"13\" height=\"12\" fill=\"currentColor\" class=\"bi bi-heart-fill\" viewBox=\"0 0 16 16\">\r\n");
      out.write("  														<path fill-rule=\"evenodd\" d=\"M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z\" />\r\n");
      out.write("													</svg>\r\n");
      out.write("												</i>\r\n");
      out.write("												<span>Like</span>\r\n");
      out.write("											</button>													\r\n");
      out.write("											");
 } 
      out.write("\r\n");
      out.write("											<script>\r\n");
      out.write("												// like-button js\r\n");
      out.write("												$(function() {\r\n");
      out.write("													$('.button-like').bind('click',\r\n");
      out.write("															function(event) {\r\n");
      out.write("																$(this).toggleClass(\"liked\");\r\n");
      out.write("															});\r\n");
      out.write("												});\r\n");
      out.write("											</script>\r\n");
      out.write("										<!-- </div> -->\r\n");
      out.write("									</div>\r\n");
      out.write("								</div>\r\n");
      out.write("							</div>\r\n");
      out.write("						</div>\r\n");
      out.write("						<div class=\"col\">\r\n");
      out.write("							<div class=\"card shadow-sm\">\r\n");
      out.write("								<svg class=\"bd-placeholder-img card-img-top\" width=\"100%\"\r\n");
      out.write("									height=\"225\" xmlns=\"http://www.w3.org/2000/svg\" role=\"img\"\r\n");
      out.write("									aria-label=\"Placeholder: Thumbnail\"\r\n");
      out.write("									preserveAspectRatio=\"xMidYMid slice\" focusable=\"false\">\r\n");
      out.write("									<title>Placeholder</title><rect width=\"100%\" height=\"100%\"\r\n");
      out.write("										fill=\"#55595c\" />\r\n");
      out.write("									<text x=\"50%\" y=\"50%\" fill=\"#eceeef\" dy=\".3em\">Thumbnail</text></svg>\r\n");
      out.write("\r\n");
      out.write("								<div class=\"card-body\">\r\n");
      out.write("									<p class=\"card-text\">This is a wider card with supporting\r\n");
      out.write("										text below as a natural lead-in to additional content. This\r\n");
      out.write("										content is a little bit longer.</p>\r\n");
      out.write("									<div class=\"d-flex justify-content-between align-items-center\">\r\n");
      out.write("										<small class=\"text-muted\">조회수</small>\r\n");
      out.write("										\r\n");
      out.write("											");
      out.write("\r\n");
      out.write("											");
 if (loginUser != null) { 
      out.write("\r\n");
      out.write("											<button class=\"button-like\"> \r\n");
      out.write("												<!-- i : 아이콘 태그 -->\r\n");
      out.write("												<i class=\"fa fa-heart\">\r\n");
      out.write("													<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"13\" height=\"12\" fill=\"currentColor\" class=\"bi bi-heart-fill\" viewBox=\"0 0 16 16\">\r\n");
      out.write("  														<path fill-rule=\"evenodd\" d=\"M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z\" />\r\n");
      out.write("													</svg>\r\n");
      out.write("												</i>\r\n");
      out.write("												<span>Like</span>\r\n");
      out.write("											</button>											\r\n");
      out.write("											");
 } else {  
      out.write("\r\n");
      out.write("											<button class=\"button-like\" disabled onclick=\"alert('을 먼저 해주세요')\"> \r\n");
      out.write("												<!-- i : 아이콘 태그 -->\r\n");
      out.write("												<i class=\"fa fa-heart\">\r\n");
      out.write("													<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"13\" height=\"12\" fill=\"currentColor\" class=\"bi bi-heart-fill\" viewBox=\"0 0 16 16\">\r\n");
      out.write("  														<path fill-rule=\"evenodd\" d=\"M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z\" />\r\n");
      out.write("													</svg>\r\n");
      out.write("												</i>\r\n");
      out.write("												<span>Like</span>\r\n");
      out.write("											</button>													\r\n");
      out.write("											");
 } 
      out.write("\r\n");
      out.write("											<script>\r\n");
      out.write("												// like-button js\r\n");
      out.write("												$(function() {\r\n");
      out.write("													$('.button-like').bind('click',\r\n");
      out.write("															function(event) {\r\n");
      out.write("																$(this).toggleClass(\"liked\");\r\n");
      out.write("															});\r\n");
      out.write("												});\r\n");
      out.write("											</script>\r\n");
      out.write("										<!-- </div> -->\r\n");
      out.write("										\r\n");
      out.write("									</div>\r\n");
      out.write("								</div>\r\n");
      out.write("							</div>\r\n");
      out.write("						</div>\r\n");
      out.write("						<div class=\"col\">\r\n");
      out.write("							<div class=\"card shadow-sm\">\r\n");
      out.write("								<svg class=\"bd-placeholder-img card-img-top\" width=\"100%\"\r\n");
      out.write("									height=\"225\" xmlns=\"http://www.w3.org/2000/svg\" role=\"img\"\r\n");
      out.write("									aria-label=\"Placeholder: Thumbnail\"\r\n");
      out.write("									preserveAspectRatio=\"xMidYMid slice\" focusable=\"false\">\r\n");
      out.write("									<title>Placeholder</title><rect width=\"100%\" height=\"100%\"\r\n");
      out.write("										fill=\"#55595c\" />\r\n");
      out.write("									<text x=\"50%\" y=\"50%\" fill=\"#eceeef\" dy=\".3em\">Thumbnail</text></svg>\r\n");
      out.write("\r\n");
      out.write("								<div class=\"card-body\">\r\n");
      out.write("									<p class=\"card-text\">This is a wider card with supporting\r\n");
      out.write("										text below as a natural lead-in to additional content. This\r\n");
      out.write("										content is a little bit longer.</p>\r\n");
      out.write("									<div class=\"d-flex justify-content-between align-items-center\">\r\n");
      out.write("										<small class=\"text-muted\">조회수</small>	\r\n");
      out.write("											\r\n");
      out.write("											");
      out.write("\r\n");
      out.write("											");
 if (loginUser != null) { 
      out.write("\r\n");
      out.write("											<button class=\"button-like\"> \r\n");
      out.write("												<!-- i : 아이콘 태그 -->\r\n");
      out.write("												<i class=\"fa fa-heart\">\r\n");
      out.write("													<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"13\" height=\"12\" fill=\"currentColor\" class=\"bi bi-heart-fill\" viewBox=\"0 0 16 16\">\r\n");
      out.write("  														<path fill-rule=\"evenodd\" d=\"M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z\" />\r\n");
      out.write("													</svg>\r\n");
      out.write("												</i>\r\n");
      out.write("												<span>Like</span>\r\n");
      out.write("											</button>											\r\n");
      out.write("											");
 } else {  
      out.write("\r\n");
      out.write("											<button class=\"button-like\" disabled onclick=\"alert('을 먼저 해주세요')\"> \r\n");
      out.write("												<!-- i : 아이콘 태그 -->\r\n");
      out.write("												<i class=\"fa fa-heart\">\r\n");
      out.write("													<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"13\" height=\"12\" fill=\"currentColor\" class=\"bi bi-heart-fill\" viewBox=\"0 0 16 16\">\r\n");
      out.write("  														<path fill-rule=\"evenodd\" d=\"M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z\" />\r\n");
      out.write("													</svg>\r\n");
      out.write("												</i>\r\n");
      out.write("												<span>Like</span>\r\n");
      out.write("											</button>													\r\n");
      out.write("											");
 } 
      out.write("\r\n");
      out.write("											<script>\r\n");
      out.write("												// like-button js\r\n");
      out.write("												$(function() {\r\n");
      out.write("													$('.button-like').bind('click',\r\n");
      out.write("															function(event) {\r\n");
      out.write("																$(this).toggleClass(\"liked\");\r\n");
      out.write("															});\r\n");
      out.write("												});\r\n");
      out.write("											</script>\r\n");
      out.write("										<!-- </div> -->\r\n");
      out.write("\r\n");
      out.write("									</div>\r\n");
      out.write("								</div>\r\n");
      out.write("							</div>\r\n");
      out.write("\r\n");
      out.write("						</div>\r\n");
      out.write("\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("			<!-- /.container -->\r\n");
      out.write("\r\n");
      out.write("			<hr class=\"featurette-divider\">\r\n");
      out.write("			<!-- FOOTER -->\r\n");
      out.write("			<footer class=\"container\">\r\n");
      out.write("				<p class=\"float-end\">\r\n");
      out.write("					<a href=\"#\">Back to top</a>\r\n");
      out.write("				</p>\r\n");
      out.write("				<p>\r\n");
      out.write("					&copy; 2021 HOBBYIST, Inc. &middot; <a href=\"");
      out.print( request.getContextPath() );
      out.write("/contact.co\">Contact</a>\r\n");
      out.write("					<!-- &middot; <a href=\"#\">Terms</a> -->\r\n");
      out.write("				</p>\r\n");
      out.write("			</footer>\r\n");
      out.write("		</div>\r\n");
      out.write("	</main>\r\n");
      out.write("	\r\n");
      out.write("	<!-- Bootstrap JS CDN --> <!-- JS CDN은 body 하단에  -->\r\n");
      out.write(" 	<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js\"\r\n");
      out.write("		integrity=\"sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p\"\r\n");
      out.write("		crossorigin=\"anonymous\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write(" \r\n");
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
