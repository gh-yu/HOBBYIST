<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member, tutor.model.vo.Tutor" %>
<%
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	Tutor tutor = (Tutor)session.getAttribute("tutor");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
										<li><a href="<%= request.getContextPath() %>/likedClass.te">LIKED-CLASS</a></li>
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
	
	<% if(loginUser.getMemberGrade().equals("A")) {	%>
	<div class="sidebar">
		<div class="scrollbar-inner sidebar-wrapper">
			<div class="user">
				<div class="photo">
					<img src="assets/images/hlogo_g.png">	
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
				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/list.cs"> <i
						class="la la-question-circle"></i>
						<p>1:1 REQUEST</p>
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
<!-- 				<li class="nav-item"><a -->
<%-- 					href="<%=request.getContextPath()%>/review.re"> <i --%>
<!-- 						class="la la-camera-retro"></i> -->
<!-- 						<p>MY REVIEW</p> -->
<!-- 				</a></li> -->
				<li class="nav-item"><a
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
			
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<h4 class="page-title">MY INFORMATION</h4>
				<div class="row justify-content-center">
					<div class="col-md-4">
						<div class="card">
							<div class="card-header">
								<div class="card-body">
									<form action=""	method="post" encType="multipart/form-data">
										<div class="box">
											<div class="tutorPro">
												<div class="row justify-content-center">
													<%-- 튜터 프로필 사진 업데이트는 페이지 따로있음				<% if(loginUser.getMemberGrade().equals("B")) { %> --%>
<!-- 여기서 변경 ㄴㄴ														<div id="fileArea" class="col-md-7"> -->
<!-- 															<input type="file" class="form-control" id="profileImg" multiple="multiple" name="profileImg" onchange="LoadImg(this, 1)"> -->
<!-- 														</div> -->
<!-- 														<div class="col-md-7 justify-content-center"> -->
<!-- 														<img class="userImg" id="target_img" name="target_img" src="assets/images/profileAdd.png" alt="profile-image" /> -->
<!-- 															<div class="page-content" style="margin: 20px;"> -->
<%-- 																<%= loginUser.getMemberNickName() %> --%>
<!-- 															</div> -->
<!-- 														</div> -->
<%-- 													<% } else { %> --%>
														<div class="col-md-7 justify-content-center">
														<%  if (tutor == null) { %>
																<img class="userImg" id="target_img" name="target_img" src="assets/images/hlogo_g.png" alt="profile-image" />
														<%  } else { %>
																<img class="userImg" id="target_img" name="target_img" src="<%= request.getContextPath() %>/uploadFiles/<%= tutor.getTutorImgChangeName() %>">
														<%  } %>
																<div class="page-content" style="margin: 20px;">
																	<%= loginUser.getMemberNickName() %>
																</div>
															</div>
<%-- 													<% } %> --%>
													<div class="col-md-6">
<%-- 													<% if(loginUser.getMemberGrade().equals("B")) {%> --%>

<%-- 													<% } %> --%>
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
								<form action="<%= request.getContextPath() %>/updateForm.me" method="POST" encType="multipart/form-data">
									<div class="form-group">
										<label for="exampleFormControlSelect1"><b>이메일</b></label> 
											<div class="form-floating mb-3">
												<%= loginUser.getMemberEmail() %>
												<input type="hidden" name="email" class="form-control" id="floatingInput" value="<%= loginUser.getMemberEmail() %>"> 
												<label for="floatingInput"></label>
												<label for="floatingInput"><small id="selectHelp" class="form-text text-muted"></small></label>
											</div> 		
										<label for="floatingInput"><small id="selectHelp" class="form-text text-muted">가입하신 이메일은 변경하실 수 없습니다</small></label>
									</div>
									
									<div class="form-group">
										<label for="exampleFormControlSelect1"><b>이름</b></label> 
										<div class="input-group mb-3">
											<span class="input-group-text" id="basic-addon1">👩</span> 
											<input type="text" name="name" class="form-control" placeholder="<%= loginUser.getMemberName() %>" 
													value="<%= loginUser.getMemberName() %>" aria-label="Username" aria-describedby="basic-addon1" disabled>
										</div>
										<label for="floatingInput"><small id="selectHelp" class="form-text text-muted">이름 변경은 별도의 절차를 거친 후 가능합니다.</small></label>
									</div>
									
									<div class="form-group">
										<label for="exampleFormControlSelect1"><b>닉네임</b></label> 
										<div class="input-group mb-3">
											<span class="input-group-text" id="basic-addon1">✨</span> 
											<input type="text" name="nickName" class="form-control" placeholder="<%= loginUser.getMemberNickName() %>" 
													value="<%= loginUser.getMemberNickName() %>" aria-label="Username" aria-describedby="basic-addon1" disabled>
										</div>
										<label for="floatingInput"><small id="selectHelp" class="form-text text-muted">닉네임 변경은 중복확인이 필요합니다</small></label>
									</div>
										
									<div class="form-group">
										<label for="exampleFormControlSelect1"><b>연락처</b></label>
											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon1">📞</span> 
												<input type="text" name="phone" class="form-control" placeholder="<%= loginUser.getMemberPhone() %>" 
														value="<%= loginUser.getMemberPhone() %>" aria-label="phoneNumber" aria-describedby="basic-addon1" disabled>
											</div>
										<input type="hidden" class="form-control" id="floatingInput" value="<%= loginUser.getMemberPhone()%>"> 
										<label for="floatingInput"><small id="selectHelp" class="form-text text-muted"></small></label>
									</div>
									<br>
									<div class="row justify-content-center">
										<div class="col-2">
											<button type="button" class="btn btn-default" onclick="location.href='<%=request.getContextPath()%>/updatePwdForm.me'">비밀번호 변경하기</button>
										</div>
										<div class="col-2">
											<button type="submit" class="btn btn-primary">기본 정보 수정하기</button>
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
	<%@ include file="../common/js.jsp"%>

	<script>
	
		$(document).ready(function() {
			$('#fileArea').hide();
			$('#target_img').mouseenter(function(){
				$(this).css({'cursor':'pointer'})
			}).click(function() {
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
		
		function reservation() {
	        location.href = "<%= request.getContextPath() %>/tuteeEnroll.me";
	    }
		

	</script>

</body>
</html>