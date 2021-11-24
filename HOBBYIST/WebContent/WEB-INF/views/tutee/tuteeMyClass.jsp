<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/css.jsp" %>
</head>
<body>

<div class="banner_bg_main">
		<div class="container">
			<div class="header_section_top">
				<div class="row">
					<div class="col-sm-12">
						<div class="custom_menu">
							<ul>
								<li><a href="mainPage.jsp">MAIN</a></li>
								<li></li>
								<li><a href="../tutee/likedClass.jsp">LIKED CLASS</a></li>
								<li></li>
								<li><a href="../member/loginPage.jsp">LOG-IN</a></li>
								<li></li>
								<li><a href="../member/myInfo.jsp">MY INFO</a></li>
								<li></li>
								<li><a href="../admin/faq.jsp">FAQ</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="sidebar">
				<div class="scrollbar-inner sidebar-wrapper">
					<div class="user">
						<div class="photo">
							<img src="../assets/images/iu2.jpg">
						</div>
						<div class="info">
							<a class="" data-toggle="collapse" href="#collapseExample" aria-expanded="true">
								<span>
									<b>김샘플</b>
									<!-- loginUser의 NickName 불러오기 -->
									<span class="user-level">튜티(Tutee)</span>
									<!-- loginUser의 grade 불러오기 -->
									<span class="caret"></span>
								</span>
							</a>
							<div class="clearfix"></div>

							<div class="collapse in" id="collapseExample" aria-expanded="true" style="">
								<ul class="nav">
									<li>
										<a href="<%= request.getContextPath() %>/myInfo.me">
											<span class="link-collapse">내 정보 보기</span>
										</a>
									</li>
									<li>
										<a href="<%= request.getContextPath() %>/updateForm.me">
											<span class="link-collapse">내 정보 수정</span>
										</a>
									</li>
									<li>
										<a href="<%= request.getContextPath() %>/deleteConfirm.me">
											<span class="link-collapse">튜티 탈퇴</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<ul class="nav">
					<li class="nav-item active"><a
						href="<%=request.getContextPath()%>/myClass.te"> <i
							class="la la-toggle-on"></i>
							<p>MY CLASS</p><span class="badge badge-primary">5</span>
					</a></li>
					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/likedClass.cl"> <i
							class="la la-gittip"></i>
							<p>LIKED CLASS</p>
					</a></li>
					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/review.re"> <i
							class="la la-camera-retro"></i>
							<p>MY REVIEW</p>
					</a></li>
					<hr>
					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/paymend.pa"> <i
							class="la la-money"></i>
							<p>MY PAYMENT</p>
					</a></li>
					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/notification.no"> <i
							class="la la-bell"></i>
							<p>NOTIFICATIONS</p>
					</a></li>
					<!-- DAO가 없기 때문에 빨간줄이 떠서 주석처리 / model단 받아오시면 주석풀면 됩니다. -->
					<%-- <%
							if (loginUser != null && loginUser.getMemberGrade().equals("B")) {
					%> --%>
					<hr>
					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/tutorSignUp.no"> <i
							class="la la-pencil"></i>
							<p>APPLICATION</p>
					</a></li>
					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/tutorClass.no"> <i
							class="la la-calendar-o"></i>
							<p>TUTOR ON CLASS</p>
					</a></li>
					<!-- DAO가 없기 때문에 빨간줄이 떠서 주석처리 / model단 받아오시면 주석풀면 됩니다. -->
					<%-- <%
							} else {
					%> --%>
					<li class="nav-item update-pro">
							<button onclick="reservation()">
								<i class="la la-hand-pointer-o"></i>
								<p>튜터 신청하기</p>
							</button>
					</li>
				</ul>
				</div>
			</div>
			<!-- 사이드바 영역 -->
			
			<!-- 메인 영역 -->
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<h4 class="page-title">MY CLASS</h4>
						<div class="row">
							<div class="col-md-4">
								<div class="card card-stats card-primary active">
									<div class="card-body" id="beforeClass">
										<div class="row">
											<div class="col-5">
												<div class="icon-big text-center">
													<i class="la la-calendar-plus-o"></i>
												</div>
											</div>
											<div class="col-7 d-flex align-items-center">
												<div class="numbers">
													<p class="card-category">수강 신청 클래스</p>
													<h4 class="card-title">0</h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 수강 중인 클래스 -->
							<div class="col-md-4">
								<div class="card card-stats card-success">
									<div class="card-body" id="onClass">
										<div class="row">
											<div class="col-5">
												<div class="icon-big text-center">
													<i class="la la-video-camera"></i>
												</div>
											</div>
											<div class="col-7 d-flex align-items-center">
												<div class="numbers">
													<p class="card-category">수강 중인 클래스</p>
													<h4 class="card-title">2</h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 수강 중인 클래스 -->
							
							<div class="col-md-4">
								<div class="card card-stats card-danger">
									<div class="card-body" id="closeClass">
										<div class="row">
											<div class="col-5">
												<div class="icon-big text-center">
													<i class="la la-check"></i>
												</div>
											</div>
											<div class="col-7 d-flex align-items-center">
												<div class="numbers">
													<p class="card-category">수강 완료 클래스</p>
													<h4 class="card-title">1</h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 수강완료 클래스 -->
						</div>
						</div>
						</div>
						</div>



<%@ include file="../common/js.jsp" %>
</body>
</html>