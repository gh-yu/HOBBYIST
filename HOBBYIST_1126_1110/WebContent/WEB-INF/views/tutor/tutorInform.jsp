<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member, tutor.model.vo.Tutor"%>
<%
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	Tutor tt = (Tutor)request.getSession().getAttribute("tutor");
	String myReport = tt.getTutorReport();
	String mySns = tt.getTutorSns();
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<%@ include file="../common/js.jsp"%>
<%@ include file="../common/css.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
										<li><a href="#" onclick="alert('로그인을 먼저 해주세요.');">LIKED-CLASS</a></li> <!-- 로그인 전이면 LIKED-CLASS 접근 불가 -->
									<% } else if(loginUser.getMemberGrade().equals("A")){ %>
										<!-- 관리자면 LIKED-CLASS버튼 비활성화 -->
									<% } else { %>
										<li></li>
										<li><a href="<%= request.getContextPath() %>/myClass.te">LIKED-CLASS</a></li>
									<% } %>
										<li></li>
								<% if(loginUser == null) { %>
										<li><a href="<%= request.getContextPath() %>/loginForm.me">LOG-IN</a></li> <!-- login전이면 로그인버튼 -->
									<% } else { %>
										<li><a href="<%= request.getContextPath() %>/logout.me">LOG-OUT</a></li> <!-- login된 상태면 로그아웃버튼 -->
									<% } %>
										<li></li>
									<% if(loginUser == null) { %>
										<li><a href="#" onclick="alert('로그인을 먼저 해주세요.');">MY INFO</a></li>
									<% } else { %>
										<li><a href="<%= request.getContextPath() %>/myInfo.me">MY INFO</a></li> <!-- 로그인 전이면 MY INFO 접근 불가 -->
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
	<div class="sidebar">
		<div class="scrollbar-inner sidebar-wrapper">
			<div class="user">
				<div class="photo">
					<img src="../assets/images/iu2.jpg">
				</div>
				<div class="info">
					<a class="" data-toggle="collapse" href="#collapseExample"
						aria-expanded="true"> <span> <b><%= loginUser.getMemberNickName() %></b> <!-- loginUser의 NickName 불러오기 -->
							<span class="user-level">
								<% if(loginUser.getMemberGrade().equals("A")) { %>
									<span class="user-level">관리자(admin)</span>
								<% } else if(loginUser.getMemberGrade().equals("B")) { %>
									<span class="user-level">튜터(Tutor)</span>
								<% } else { %>
									<span class="user-level">튜티(Tutee)</span>
								<% }  %>
							</span> <!-- loginUser의 grade 불러오기 -->
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
								href="<%=request.getContextPath()%>/deleteConfirm.me"> <span
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
						<p>MY CLASS</p> <span class="badge badge-primary">5</span>
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
					href="<%=request.getContextPath()%>/tutorMyPage.tt"> <i
						class="la la-calendar-o"></i>
						<p>TUTOR ON CLASS</p>
				</a></li>
				<li class="nav-item"><a
						href="<%=request.getContextPath()%>/tutorInform.me"> <i
							class="la la-calendar-o"></i>
							<p>TUTOR 정보</p>
				</a></li>
				<!-- DAO가 없기 때문에 빨간줄이 떠서 주석처리 / model단 받아오시면 주석풀면 됩니다. -->
				<%-- <%
							} else {
					%> --%>
<!-- 				<li class="nav-item update-pro"> -->
<!-- 					<button onclick="reservation()"> -->
<!-- 						<i class="la la-hand-pointer-o"></i> -->
<!-- 						<p>튜터 신청하기</p> -->
<!-- 					</button> -->
<!-- 				</li> -->
			</ul>
		</div>
	</div>
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<h4 class="page-title">MY INFORMARION</h4>
				<div class="row justify-content-center">
					<div class="col-md-4">
						<div class="card">
							<div class="card-header">
								<div class="card-body">
									<form action="<%=request.getContextPath()%>/updateTutor.me"
										method="post" encType="multipart/form-data">
										<div class="box">
											<div class="tutorPro">
												<div class="row justify-content-center">
														
													<div id="fileArea" class="col-md-7"><!-- 파일 업로드하는 부분 -->
														<input type="file" class="form-control" id="profileImg"
															multiple="multiple" name="profileImg"
															onchange="LoadImg(this, 1)">
													</div>
													<div class="col-md-7 justify-content-center"> <!-- 실제 프로필 사진 -->
														<img class="userImg" id="target_img" name="target_img"
															src="<%= request.getContextPath() %>/uploadFiles/<%= tt.getTutorImgChangeName() %>" alt="profile-image" />


														<div class="page-content" style="margin: 20px;">
															<%= loginUser.getMemberNickName() %>
															<%-- <%= 세션아이디 %> --%>
														</div>
														</div>
										<div class="col-md-6">
										<div class="justify-content-center">
															
											<i class="la la-facebook"></i> <a href="#" class="card-link">Facebook</a>&nbsp;<br>
											<i class="la la-twitter"></i> <a href="#" class="card-link">Twitter</a>&nbsp;<br>
											<i class="la la-instagram"></i> <a href="#" class="card-link">Instagram</a>&nbsp;<br>
											<i class="la la-youtube"></i> <a href="#" class="card-link">Youtube</a>&nbsp;<br>
									
										</div>
										</div>
										<div class="col-md-8">
										<div class="justify-content-center">
										<h3></h3>
										<label for="exampleFormControlSelect1">MY CLASS</label>
										<input type="text" class="form-control input-pill" id="pillInput" placeholder="김튜티의 아이패드 클래스">
										</div>
										</div>

													
													
												</div>
											</div>
										</div>
									</form>

								</div>
							</div>
						</div>
					</div>
					<div class="col-md-8">
						<div class="card">
							<div class="card-header">
								<div class="card-body">
								<form action="<%=request.getContextPath()%>/updateTutor.me" method="POST" encType="multipart/form-data">
									<div class="form-group">
										<label for="exampleFormControlSelect1">이메일</label> <span
											class="badge badge-danger">필수 </span> 
											<div class="form-floating mb-3">
											<%= loginUser.getMemberEmail() %><%-- <%= 이메일%> --%>
											<input type="hidden" name="mail" class="form-control" id="floatingInput" value="tutee@hobbyist.com<%-- <%= 이메일%> --%>"> 
											<!-- <label for="floatingInput">Which name is the most suitable one for your class?</label> -->
											<small id="selectHelp" class="form-text text-muted">가입하신 이메일은 변경하실 수 없습니다</small>
										</div> 
									</div>
									<!-- 이메일 폼그룹 -->
									
									<div class="form-group">
										<label for="exampleFormControlSelect1">닉네임</label> <span
											class="badge badge-danger">필수 </span>
										<div class="input-group mb-3">
											<span class="input-group-text" id="basic-addon1">@</span> 
											<input type="text" name="nickName" class="form-control" placeholder="<%= loginUser.getMemberNickName() %>" aria-label="Username" aria-describedby="basic-addon1" disabled>
										</div>
										<small id="selectHelp" class="form-text text-muted">닉네임 변경은 중복확인이 필요합니다</small>
									</div>
									<!-- 닉네임 폼그룹 -->



									<div class="form-group">
										<label for="exampleFormControlSelect1">소개</label> <span class="badge badge-danger">필수</span> 
										<div class="input-group mb-3">
											<span class="input-group-text" id="basic-addon1">📞</span> 
											<input type="text" name="report" class="form-control" value="<%= tt.getTutorReport() %>" aria-label="phoneNumber" aria-describedby="basic-addon1" disabled>
										</div>
											<input type="hidden" class="form-control" id="floatingInput" value="<%-- <%=연락처%> --%>"> 
											<!-- <label for="floatingInput">Which name is the most suitable one for your class?</label> -->
											<small id="selectHelp" class="form-text text-muted">자유롭게 튜터 소개를 해주세요!</small>
									</div> 
									
										
									<div class="form-group">
										<label for="exampleFormControlSelect1">SNS</label> <span class="badge badge-danger">필수</span> 
										<div class="input-group mb-3">
											<span class="input-group-text" id="basic-addon1">📞</span> 
											<input type="text" name="sns" class="form-control" value="<%= tt.getTutorSns() %>" aria-label="phoneNumber" aria-describedby="basic-addon1" disabled>
										</div>
											<input type="hidden" class="form-control" id="floatingInput" value="<%-- <%=연락처%> --%>"> 
											<!-- <label for="floatingInput">Which name is the most suitable one for your class?</label> -->
											<small id="selectHelp" class="form-text text-muted">연락처 변경은 인증이 필요합니다</small>
									</div> 
										<!-- 연락처 폼그룹 -->
										
										<div class="row justify-content-center">
										<div class="col-2">
											<button class="btn btn-outline-secondary">취소하기</button>
										</div>
										<div class="col-2">
											<button class="btn btn-outline-primary">수정하기</button>
										</div>
									</div>
										</form>
									</div>
									
									
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	
	<script>
		
		
	/* 파일선택이 안가려져요 ㅠㅠ 그래서 일단 이미지로 넣어두었어요.... */
		
	
		$(document).ready(function() {
			$('#fileArea').hide();
			$('#target_img').click(function() {
				$('#profileImg').click();
			});
		});

		function LoadImg(value, num) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					if (num == 1) {
						$("#target_img").attr("src", e.target.result);
					} else if (num == 2) {
						$("#target_img2").attr("src", e.target.result);
					}
				}

				reader.readAsDataURL(value.files[0]);
			}
		}
		

				
	function updatePwd() {
		
		location.href="<%= request.getContextPath()%>/updatePwd.me";
	}
	</script>




</body>
</html>