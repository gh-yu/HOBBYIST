<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.*, java.util.ArrayList, faq.model.vo.FAQ" %>
<%
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	ArrayList<Member> tuteeList = (ArrayList)request.getAttribute("tuteeList");
	ArrayList<Member> tutorList = (ArrayList)request.getAttribute("tutorList");
	MemberInfo pi = (MemberInfo)request.getAttribute("pi");
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
<title>Admin - 회원조회</title>
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
	<!-- 사이드 바 -->
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
				<li class="nav-item active"><a
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
	<!-- 사이드바 영역 -->

	<!-- 메인 영역 -->
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<h4 class="page-title">HOBBYIST MEMBER LIST</h4>
				<hr>
				<div class="row">
					<div class="col-md-10">
						<div class="card">
							<div class="card-header">
								<div class="card-title"><span style="color: #6682ff">튜티(TUTEE)</span> 리스트
								</div>
							</div>
							<div class="card-body">
							<form>	
								<table class="table table-hover">
									<thead class="table-primary">
										<tr>
											<th scope="col">이름</th>
											<th scope="col">닉네임</th>
											<th scope="col">이메일</th>
											<th scope="col">전화#</th>
<!-- 											<th scope="col">비밀번호</th> -->
											<th scope="col">가입일</th>
											<th scope="col">활동상태</th>
										</tr>
									</thead>
									<tbody>
										<% if(tuteeList.isEmpty()) { %>
											<tr>
												<td colspan = "7"> 조회된 리스트가 없습니다. </td>
											</tr>
										<% } else { %>
											<%	for(int i = 0; i < tuteeList.size(); i++){ %>
												<tr>
													<td>
														<%= tuteeList.get(i).getMemberName() %>
														<input type="hidden" id="tuteeName" name="tuteeName" value="<%= tuteeList.get(i).getMemberName() %>">
													</td>
													<td>
														<%= tuteeList.get(i).getMemberNickName() %>
														<input type="hidden" id="tuteeNickName" name="tuteeNickName" value="<%= tuteeList.get(i).getMemberNickName() %>">	
													</td>
													<td>
														<%= tuteeList.get(i).getMemberEmail() %>
														<input type="hidden" id="tuteeEmail" name="tuteeEmail" value="<%= tuteeList.get(i).getMemberEmail() %>">
													</td>
													<td>
														<%= tuteeList.get(i).getMemberPhone() %>
														<input type="hidden" id="tuteePwd" name="tuteePwd" value="<%= tuteeList.get(i).getMemberPhone() %>">
													</td>
<!-- 													<td> -->
<%-- 														<%= tuteeList.get(i).getMemberPwd() %> --%>
<%-- 														<input type="hidden" id="tuteePwd" name="tuteePwd" value="<%= tuteeList.get(i).getMemberPwd() %>"> --%>
<!-- 													</td> -->
													<td>
														<%= tuteeList.get(i).getMemberEnrollDate() %>
														<input type="hidden" id="tuteeEnrollDate" name="tuteeEnrollDate" value="<%= tuteeList.get(i).getMemberEnrollDate() %>">
													</td>
													<td>
														<%= tuteeList.get(i).getMemberStatus() %>
														<input type="hidden" id="tuteeStatus" name="tuteeStatus" value="<%= tuteeList.get(i).getMemberStatus() %>">
													</td>
												</tr> 
											<% } %>
										<% } %>
									</tbody>
								</table>
							</form>	
						</div>
					</div>
				
					
					<!-- 페이지네이션: 페이징처리시 영역나타남 -->
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item">
								<button class="page-link" id="toFirstBtn" onclick="location.href='<%= request.getContextPath() %>/tuteeList.admin?currentPage=1'">&laquo;</button>
							</li>
						<!-- prev -->
							<li class="page-item">
								<button class="page-link" id="beforeBtn" onclick="<%= request.getContextPath() %>/tuteeList.admin?currentPage=<%= pi.getCurrentPage() -1 %>'" aria-label="Previous">&laquo;</button>
							</li>
							
						<!-- 페이지넘버 -->
							<% for (int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
								<% 		if(p == pi.getCurrentPage()) { %>
									<li class="page-item" id="choosen"><a class="page-link" href=""><%= p %></a></li> <!-- 현재 페이지는 선택 못하게 -->
								<%      } else { %> 
											<li class="page-item" id="numBtn"><a class="page-link" href="<%= request.getContextPath() %>/tuteeList.admin?currentPage=<%= p %>"><%= p %></a></li>
									<% } %>
							<% 	} %>
							
							<!-- next -->
							<li class="page-item">
								<button id="afterBtn" class="page-link" onclick="location.href='<%= request.getContextPath() %>/tuteeList.admin?currentPage=<%= pi.getCurrentPage() + 1 %>'"
									aria-label="Next"> &raquo;</button>
							</li>
							<li class="page-item">
								<button id="toLastBtn" class="page-link" onclick="location.href='<%= request.getContextPath() %>/tuteeList.admin?currentPage=<%= pi.getMaxPage() %>'" 
									aria-label="Next"> &raquo; </button>
							</li>
						</ul>
					
						<script>
							if(<%= pi.getCurrentPage() %> >= <%= pi.getMaxPage() %>){
									$('#afterBtn').prop('disabled', true);
							} 
						</script>
						</nav>
						<br>
					</div>
				</div>
			</div>	
		</div>
	</div>
	
	<script>
		if(<%= pi.getCurrentPage() %> <= 1){
			$('#beforeBtn').prop('disabled', true);
		}
	</script>
		

	<%@ include file="../common/js.jsp"%>
</body>
</html>