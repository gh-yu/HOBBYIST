<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="member.model.vo.Member, java.util.ArrayList, faq.model.vo.FAQ"%>
<%
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	ArrayList<FAQ> list = (ArrayList)request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="us">
<head>
<!-- basic -->
<meta charset="utf-8">
<%@ include file="../common/css.jsp"%>
</head>
<body>
	<!-- 상단 메뉴 -->
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
								<li><a href="#" onclick="alert('로그인을 먼저 해주세요.');">LIKED-CLASS</a></li>
								<!-- 로그인 전이면 LIKED-CLASS 접근 불가 -->
								<% } else if(loginUser.getMemberGrade().equals("A")){ %>
								<!-- 관리자면 LIKED-CLASS버튼 비활성화 -->
								<% } else { %>
								<li></li>
								<li><a href="<%= request.getContextPath() %>/myClass.te">LIKED-CLASS</a></li>
								<% } %>
								<li></li>
								<% if(loginUser == null) { %>
								<li><a href="<%= request.getContextPath() %>/loginForm.me">LOG-IN</a></li>
								<!-- login전이면 로그인버튼 -->
								<% } else { %>
								<li><a href="<%= request.getContextPath() %>/logout.me">LOG-OUT</a></li>
								<!-- login된 상태면 로그아웃버튼 -->
								<% } %>
								<li></li>
								<% if(loginUser == null) { %>
								<li><a href="#" onclick="alert('로그인을 먼저 해주세요.');">MY
										INFO</a></li>
								<% } else { %>
								<li><a href="<%= request.getContextPath() %>/myInfo.me">MY
										INFO</a></li>
								<!-- 로그인 전이면 MY INFO 접근 불가 -->
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
	<% if(loginUser == null || !loginUser.getMemberGrade().equals("A")){ %>
	<!-- 로그인하지 않은 유저는 사이드 바 없음 -->
	<% } else if(loginUser.getMemberGrade().equals("A")) {	%>
	<div class="sidebar">
		<div class="scrollbar-inner sidebar-wrapper">
			<div class="user">
				<div class="photo">
					<img src="../assets/images/iu3.jpg">
				</div>
				<div class="info">
					<a class="" data-toggle="collapse" href="#collapseExample"
						aria-expanded="true"> <span> <b><%= loginUser.getMemberNickName()  %></b>
							<!-- loginUser의 NickName 불러오기 --> <span class="user-level">
								<!-- loginUser의 grade 불러오기 --> <% if(loginUser.getMemberGrade().equals("A")) { %>
								<span class="user-level">관리자(admin)</span> <% } else if(loginUser.getMemberGrade().equals("B")) { %>
								<span class="user-level">튜터(Tutor)</span> <% } else { %> <span
								class="user-level">튜티(Tutee)</span> <% }  %>
						</span> <span class="caret"></span>
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
					href="<%=request.getContextPath()%>/memberCheck.admin"> <i
						class="la la-user"></i>
						<p>MEMBER LIST</p>
				</a></li>
				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/apvList.cl"> <i
						class="la la-check-circle"></i>
						<p>CLASS APV LIST</p>
				</a></li>
				<li class="nav-item active"><a
					href="<%=request.getContextPath()%>/FAQ.bo"> <i
						class="la la-question-circle"></i>
						<p>FAQ</p>
				</a></li>
				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/list.cs"> <i
						class="la la-question-circle"></i>
						<p>1:1 REQUEST</p>
				</a></li>
			</ul>
		</div>
	</div>
	<% } %>

	<!-- 메인 영역 -->
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<h4 class="page-title">자주 하는 질문(FAQ)</h4>
				<hr>
				<div class="row">
					<div class="col-md-2">
						<div class="card">
							<div class="card-header">
								<div class="card-title">카테고리</div>
							</div>
							<div class="card-body">
								<!-- 카테고리 내용 -->

								<ul class="list-group">
									<li
										class="list-group-item list-group-item-action d-flex justify-content-between align-items-center list-group-item-primary">
										<a href=""> 가입</a> <span class="badge bg-primary rounded-pill">14</span>
									</li>
									<li
										class="list-group-item list-group-item-action d-flex justify-content-between align-items-center list-group-item-light">
										<a href=""> 수강</a> <span class="badge bg-primary rounded-pill">30</span>
									</li>
									<li
										class="list-group-item list-group-item-action d-flex justify-content-between align-items-center list-group-item-primary">
										<a href=""> 결제</a> <span class="badge bg-primary rounded-pill">15</span>
									</li>
									<li
										class="list-group-item list-group-item-action d-flex justify-content-between align-items-center list-group-item-light">
										<a href=""> 서비스</a> <span
										class="badge bg-primary rounded-pill">15</span>
									<li
										class="list-group-item list-group-item-action d-flex justify-content-between align-items-center list-group-item-primary">
										<a href=""> 기타</a> <span class="badge bg-primary rounded-pill">78</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-10">
						<div class="card">
							<div class="card-header">
								<div class="card-title">FAQ</div>
							</div>
							<div class="card-body">
								<!-- 본문영역 -->
								<div class="accordion accordion-flush"
									id="accordionFlushExample">
									<div class="accordion-item">
										<h2 class="accordion-header" id="flush-headingOne">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse"
												data-bs-target="#flush-collapseOne" aria-expanded="false"
												aria-controls="flush-collapseOne">[회원] 회원가입은 어떻게
												하나요?</button>
										</h2>
										<div id="flush-collapseOne"
											class="accordion-collapse collapse"
											aria-labelledby="flush-headingOne"
											data-bs-parent="#accordionFlushExample">
											<div class="accordion-body">
												Placeholder content for this accordion, which is intended to
												demonstrate the
												<code>.accordion-flush</code>
												class. This is the first item's accordion body.
											</div>
										</div>
									</div>
									<div class="accordion-item">
										<h2 class="accordion-header" id="flush-headingTwo">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse"
												data-bs-target="#flush-collapseTwo" aria-expanded="false"
												aria-controls="flush-collapseTwo">[회원] 이메일 가입과 카카오
												가입은 무엇이 다른가요?</button>
										</h2>
										<div id="flush-collapseTwo"
											class="accordion-collapse collapse"
											aria-labelledby="flush-headingTwo"
											data-bs-parent="#accordionFlushExample">
											<div class="accordion-body">
												Placeholder content for this accordion, which is intended to
												demonstrate the
												<code>.accordion-flush</code>
												class. This is the second item's accordion body. Let's
												imagine this being filled with some actual content.
											</div>
										</div>
									</div>

									<div class="accordion-item">
										<h2 class="accordion-header" id="flush-headingThree">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse"
												data-bs-target="#flush-collapseThree" aria-expanded="false"
												aria-controls="flush-collapseThree">[회원] 아이디는 어떻게
												찾나요?</button>
										</h2>
										<div id="flush-collapseThree"
											class="accordion-collapse collapse"
											aria-labelledby="flush-headingThree"
											data-bs-parent="#accordionFlushExample">
											<div class="accordion-body">
												Placeholder content for this accordion, which is intended to
												demonstrate the
												<code>.accordion-flush</code>
												class. This is the third item's accordion body. Nothing more
												exciting happening here in terms of content, but just
												filling up the space to make it look, at least at first
												glance, a bit more representative of how this would look in
												a real-world application.
											</div>
										</div>
									</div>

									<div class="accordion-item">
										<h2 class="accordion-header" id="flush-heading4">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse" data-bs-target="#flush-collapse4"
												aria-expanded="false" aria-controls="flush-collapse4">
												[회원] 비밀번호는 어떻게 찾나요?</button>
										</h2>
										<div id="flush-collapse4" class="accordion-collapse collapse"
											aria-labelledby="flush-heading4"
											data-bs-parent="#accordionFlushExample">
											<div class="accordion-body">
												Placeholder content for this accordion, which is intended to
												demonstrate the
												<code>.accordion-flush</code>
												class. This is the third item's accordion body. Nothing more
												exciting happening here in terms of content, but just
												filling up the space to make it look, at least at first
												glance, a bit more representative of how this would look in
												a real-world application.
											</div>
										</div>
									</div>
									<!-- 5 : data-bs-target과 답변영역의 id가 같아야지 열림, 나머지는 달라도 상관없음-->
									<div class="accordion-item">
										<h2 class="accordion-header" id="flush-headingOne">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse"
												data-bs-target="#flush-collapsefive" aria-expanded="false"
												aria-controls="flush-collapseOne">[회원] 회원가입은 어떻게
												하나요?</button>
										</h2>
										<div id="flush-collapsefive"
											class="accordion-collapse collapse"
											aria-labelledby="flush-headingOne"
											data-bs-parent="#accordionFlushExample">
											<div class="accordion-body">
												Placeholder content for this accordion, which is intended to
												demonstrate the
												<code>.accordion-flush</code>
												class. This is the first item's accordion body.
											</div>
										</div>
									</div>
									<!-- 6 -->
									<div class="accordion-item">
										<h2 class="accordion-header" id="flush-headingOne">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse" data-bs-target="#flush-collapse6"
												aria-expanded="false" aria-controls="flush-collapseOne">
												[회원] 정지된 회원인데 다시 활동하고 싶어요?</button>
										</h2>
										<div id="flush-collapse6" class="accordion-collapse collapse"
											aria-labelledby="flush-headingOne"
											data-bs-parent="#accordionFlushExample">
											<div class="accordion-body">정지 회원은 이메일 인증을 통해 다시 활동을 하실
												수 있습니다.</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/js.jsp"%>
</body>
</html>
