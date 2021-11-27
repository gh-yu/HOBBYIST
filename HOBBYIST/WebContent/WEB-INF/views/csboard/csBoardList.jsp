<%@page import="oracle.net.aso.i"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="csBoard.model.vo.*, java.util.ArrayList, member.model.vo.Member, tutor.model.vo.Tutor" %>
<%
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	ArrayList<RequestBoard> list = (ArrayList<RequestBoard>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int countPrev = (int)request.getAttribute("countPrev");
	Tutor tutor = (Tutor)session.getAttribute("tutor");
%>
<!DOCTYPE html>
<html>
<head>
<style>
	th, td, thead{
		text-align: center;
	}
	
	#toFirstBtn, #beforeBtn, #afterBtn, #toLastBtn {
		border-radius: 50%;
	}
	
</style>
<meta charset="UTF-8">
<%@ include file="../common/css.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="js/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="banner_bg_main">
		<div class="container">
			<div class="header_section_top">
				<div class="row">
					<div class="col-sm-12">
						<div class="custom_menu">
							<ul>
								<li><a href="<%= request.getContextPath() %>">MAIN</a></li>
							<% if(loginUser == null) { %>
								<li></li>
								<li><a href="#" onclick="alert('로그인이 필요한 서비스입니다.');">LIKED-CLASS</a></li>
							<% } else if(loginUser.getMemberGrade().equals("A")){ %>
							<!-- 관리자면 LIKED-CLASS버튼 비활성화 -->
							<% } else { %>
								<li></li>
								<li><a href="<%= request.getContextPath() %>/likedClass.te">LIKED-CLASS</a></li>
							<% } %>
								<li></li>
							<% if(loginUser == null) { %>
								<li><a href="<%= request.getContextPath() %>/loginForm.me">LOG-IN</a></li> <!-- 로그인 -->
							<% } else { %>
								<li><a href="<%= request.getContextPath() %>/logout.me">LOG-OUT</a></li> <!-- 로그아웃 -->
							<% } %>
								<li></li>
							<% if(loginUser == null) { %>
								<li><a href="#" onclick="alert('로그인이 필요한 서비스입니다.');">MY INFO</a></li>
							<% } else { %>
								<li><a href="<%= request.getContextPath() %>/myInfo.me">MY INFO</a></li>
							<% } %>
								<li></li>
								<li><a href="<%= request.getContextPath() %>/FAQ.bo">FAQ</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 메인 화면 -->
	<!-- 사이드 바 영역(로그인 상태에 따라 다름. 1:1 문의는 어차피 관리자와 로그인 한 회원만 접근 가능하므로 왼쪽에 사이드 바 있는 양식 사용 -->
	<% if(loginUser.getMemberGrade().equals("A")) {	%>
	<div class="sidebar">
		<div class="scrollbar-inner sidebar-wrapper">
			<div class="user">
				<div class="photo">
					<% if(tutor == null) {  %>
					<img src="assets/images/hlogo_g.png">
					<% } else { %>
					<img src="<%= request.getContextPath() %>/uploadFiles/<%= tutor.getTutorImgChangeName() %>">
					<% } %>
				</div>
				<div class="info">
					<a class="" data-toggle="collapse" href="#collapseExample"
						aria-expanded="true"> <span> <b><%= loginUser.getMemberNickName()  %></b> <!-- loginUser의 NickName 불러오기 -->
							<span class="user-level"><!-- loginUser의 grade 불러오기 -->
								<% if(loginUser.getMemberGrade().equals("A")) { %>
									<span class="user-level">관리자(admin)</span>
								<% } else if(loginUser.getMemberGrade().equals("B")) { %>
									<span class="user-level">튜터(Tutor)</span>
								<% } else { %>
									<span class="user-level">튜티(Tutee)</span>
								<% }  %>
							</span> 
							<span class="caret"></span>
					</span>
					</a>
					<div class="clearfix"></div>

					<div class="collapse in" id="collapseExample" aria-expanded="true"
						style="">
						<ul class="nav">
							<li><a href="<%=request.getContextPath()%>/myInfo.me"> <span
									class="link-collapse"> ADMIN 정보 보기</span>
							</a></li>
							<li><a href="<%=request.getContextPath()%>/updateForm.me">
									<span class="link-collapse"> ADMIN 정보 수정</span>
							</a></li>
							
						</ul>
					</div>
				</div>
			</div>
			<ul class="nav">
				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/tuteeList.admin"> <i
					class="la la-user"></i>
					<p>TUTEE LIST</p>
				</a></li>
				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/tutorList.admin"> <i
					class="la la-user"></i>
					<p>TUTOR LIST</p>
				</a></li>
				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/apvList.cl"> <i
						class="la la-check-circle"></i>
						<p>CLASS APV LIST</p>
				</a></li>
				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/FAQ.bo"> <i
						class="la la-question-circle"></i>
						<p>FAQ</p>
				</a></li>
				<li class="nav-item active"><a
					href="<%=request.getContextPath()%>/list.cs"> <i
						class="la la-question-circle"></i>
						<p>1:1 REQUEST</p><span class="badge badge-primary"><%= countPrev %></span>
				</a></li>
			</ul>
		</div>
	</div>
	<% } else { %>
	<div class="sidebar">
		<div class="scrollbar-inner sidebar-wrapper">
			<div class="user">
				<div class="photo">
					<%  if (tutor == null) { %>
						<img src="<%= request.getContextPath() %>/assets/images/hlogo_g.png">
					<%  } else { %>
						<img src="<%= request.getContextPath() %>/uploadFiles/<%= tutor.getTutorImgChangeName()  %>">
					<%  } %>
				</div>
				<div class="info">
					<a class="" data-toggle="collapse" href="#collapseExample"
						aria-expanded="true"> <span> <b><%= loginUser.getMemberNickName()  %></b> <!-- loginUser의 NickName 불러오기 -->
							<span class="user-level"><!-- loginUser의 grade 불러오기 -->
								<% if(loginUser.getMemberGrade().equals("A")) { %>
									<span class="user-level">관리자(admin)</span>
								<% } else if(loginUser.getMemberGrade().equals("B")) { %>
									<span class="user-level">튜터(Tutor)</span>
								<% } else { %>
									<span class="user-level">튜티(Tutee)</span>
								<% }  %>
							</span> 
						<span class="caret"></span>
					</span>
					</a>
					<div class="clearfix"></div>

					<div class="collapse in" id="collapseExample" aria-expanded="true"
						style="">
						<ul class="nav">
							<li><a href="<%=request.getContextPath()%>/myInfo.me">
									<span class="link-collapse">내 정보 보기</span>
							</a></li>
							<li><a href="<%=request.getContextPath()%>/updateForm.me">
									<span class="link-collapse">내 정보 수정</span>
							</a></li>
							<li><a
								href="<%=request.getContextPath()%>/delete.me"> <span
									class="link-collapse">튜티 탈퇴</span>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
			<ul class="nav">
				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/myClass.te"> <i
						class="la la-toggle-on"></i>
						<p>MY CLASS</p>
				</a></li>
				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/likedClass.te"> <i
						class="la la-gittip"></i>
						<p>LIKED CLASS</p>
				</a></li>
<%-- 				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/review.re"> <i
						class="la la-camera-retro"></i>
						<p>MY REVIEW</p>
				</a></li> --%>

				<li class="nav-item active"><a
					href="<%=request.getContextPath()%>/list.cs"> <i
						class="la la-question-circle"></i>
						<p>1:1 REQUEST</p>
				</a></li>
				<hr>
				<% if (loginUser != null && loginUser.getMemberGrade().equals("B")) { %>
					<hr>
					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/move.co"> <i
							class="la la-pencil"></i>
							<p>APPLY FOR CLASS</p>
					</a></li>
					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/tutorMyPage.tt"> <i
							class="la la-calendar-o"></i>
							<p>TUTOR ON CLASS</p>
					</a></li>
					<li class="nav-item"><a
                        href="<%=request.getContextPath()%>/tutorInform.me"> <i
                            class="la la-user"></i>
                            <p>TUTOR INFO</p>
                    </a></li>
				<% } else { %>
					<li class="nav-item update-pro">
						<button onclick="reservation()">
							<i class="la la-hand-pointer-o"></i>
							<p>튜터 신청하기</p>
						</button>
					</li>
				<% } %>
			</ul>
		</div>
	</div>
			
	<% } %>
	<!-- 사이드바 영역 -->

	<!-- 메인 영역 -->
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<h4 class="page-title">1:1 REQUEST LIST</h4>
				<hr>
				
				<% if (loginUser != null) { %>
					<button id="writeBtn" onclick="location.href='<%= request.getContextPath() %>/writeBoardForm.cs'" class="btn btn-primary pull-right">문의하기</button>
				<% } %>
				<br><br>
				<div class="row justify-content-center">

					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="card-title">1:1 문의 관리</div>
							</div>
							<div class="card-body">
							<form method="post" action="confirmClass.cl">
								<table class="table" id="listArea">
									<thead>
										<tr>
											<th scope="col">문의#</th>
											<th scope="col">분류</th>
											<th scope="col">제목</th>
											<th scope="col">작성자</th>
											<th scope="col">답변 상태</th>
											<th scope="col">작성일</th>
										</tr>
									</thead>
									<tbody>

									 <% if(list.isEmpty()) { %>
										<tr>
											<td colspan = "6"> 조회된 리스트가 없습니다. </td>
										</tr>
									<% } else { %> 
									<%		for(RequestBoard rb: list) { %>  
									<tr>	
										<td><%= rb.getReqNo() %></td>
										<td><%= rb.getReqCategory() %></td>
										<td><%= rb.getReqTitle() %></td>
										<td>
										<%
											String originNick = rb.getNickName();
											String newNick = "";
											if (originNick.length() <= 2) {
												newNick = originNick.charAt(0) + "*";
											} else { // 닉네임의 첫 글자와 마지막 글자를 제외하고 마스킹 처리
												for (int i = 0; i < originNick.length(); i++) {
													if (i == 0 || i == originNick.length() - 1) {
															newNick += originNick.charAt(i);
														} else {
															newNick += "*";
														}
													}
												}
											%>
 										<%= newNick %>
										</td>
										<td><%= rb.getReplyStatus() %></td>
										<td><%= rb.getCreateDate() %></td>
										<td hidden="hidden"><%= rb.getReqWriter() %></td>
										</tr>	
										<% 		} %>
										<% } %> 
									</tbody>
								</table>
								</form>
							</div>
						</div>
					</div>
					
					<!-- 페이징 처리 영역 : 양식 통일을 위해 제가 admin-회원 조회 리스트에 썼던 폼 그대로 복붙했어요. <%= request.getContextPath() %>/뒤에 주소만 수정하시면 됩니당! -->
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item">
							<!-- 맨 처음으로  -->
								<button class="page-link" id="toFirstBtn" onclick="location.href='<%= request.getContextPath() %>/list.cs?currentPage=1'">&laquo;&laquo;</button>
							</li>
							<li class="page-item">
							<!-- 이전 페이지로 -->
								<button class="page-link" id="beforeBtn" onclick="location.href='<%= request.getContextPath() %>/list.cs?currentPage=<%= pi.getCurrentPage() - 1 %>'" aria-label="Previous">&laquo;</button>
							</li>
							
							<!-- 숫자 버튼 -->
							<% for (int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
								<% 		if(p == pi.getCurrentPage()) { %>
											<li class="page-item" id="choosen"><a class="page-link" style="background: #6495ED; color: white;"><%= p %></a></li> <!-- 현재 페이지는 선택 못하게 -->
								<%      } else { %> 
											<li class="page-item" id="numBtn"><a class="page-link" href="<%= request.getContextPath() %>/list.cs?currentPage=<%= p %>"><%= p %></a></li>
									<% } %>
							<% 	} %>
							
							<!-- 다음 페이지로 -->
							<li class="page-item">
								<button id="afterBtn" class="page-link" onclick="location.href='<%= request.getContextPath() %>/list.cs?currentPage=<%= pi.getCurrentPage() + 1 %>'"
									aria-label="Next"> &raquo;</button>
							</li>							
							
							
							<!-- 맨 끝으로 -->
							<li class="page-item">
								<button id="toLastBtn" class="page-link" onclick="location.href='<%= request.getContextPath() %>/list.cs?currentPage=<%= pi.getMaxPage() %>'" 
									aria-label="Next"> &raquo;&raquo;</button>
							</li>
						</ul>
						
						<script>
							if(<%= pi.getCurrentPage() %> <= 1){
								$('#beforeBtn').prop('disabled', true);
								$('#toFirstBtn').prop('disabled', true);
							}
							
							if(<%= pi.getCurrentPage() %> >= <%= pi.getMaxPage() %>){
								$('#afterBtn').prop('disabled', true);
								$('#toLastBtn').prop('disabled', true);
							}
							
							if ('<%= list.isEmpty() %>' == 'false') {
								$('#listArea td').mouseenter(function(){
									$(this).parent().css({'cursor':'pointer'})
								}).mouseout(function(){
									$(this).parent().css('cursor', 'none');
								}).click(function(){
									var rNo = $(this).parent().children().eq(0).text();
									var userEmail = $(this).parent().children().eq(6).text();
									
									if ('<%= loginUser %>' == 'null') {
										alert('작성자만 열람할 수 있습니다.');
									} else {
										location.href='<%= request.getContextPath() %>/detail.cs?rNo=' + rNo;
									}
								})
							}
						</script>
					</nav>

				</div>
			</div>

		</div>
	</div>

	<%@ include file="../common/js.jsp"%>
	
<script>
	function reservation() {
    	location.href = "<%= request.getContextPath() %>/tuteeEnroll.me";
	}
</script>

</body>
</html>