<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../common/css.jsp"%>
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
	<!-- 메인 화면 -->
	<div class="sidebar">
		<div class="scrollbar-inner sidebar-wrapper">
			<div class="user">
				<div class="photo">
					<img src="../assets/images/iu3.jpg">
				</div>
				<div class="info">
					<a class="" data-toggle="collapse" href="#collapseExample"
						aria-expanded="true"> <span> <b>운영자</b> <!-- loginUser의 NickName 불러오기 -->
							<span class="user-level">Administrator</span> <!-- loginUser의 grade 불러오기 -->
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
				<!-- 관리자 영역이라서 주석처리 -->
				<%-- <li class="nav-item"><a
						href="<%=request.getContextPath()%>/myClass.te"> <i
							class="la la-toggle-on"></i>
							<p>MY CLASS</p>
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
					</a></li> --%>
				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/notification.no"> <i
						class="la la-key"></i>
						<p>CLASS MANAGEMENT</p>
				</a></li>
				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/notification.no"> <i
						class="la la-question-circle"></i>
						<p>CS BOARD / 1:1 REQUEST</p>
				</a></li>
				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/notification.no"> <i
						class="la la-bell"></i>
						<p>NOTIFICATIONS</p>
				</a></li>
				<!-- <hr> -->
				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/tutorSignUp.no"> <i
						class="la la-user"></i>
						<p>MEMBER LIST</p>
				</a></li>
				<li class="nav-item active"><a
					href="<%=request.getContextPath()%>/tutorClass.no"> <i
						class="la la-check-circle"></i>
						<p>CLASS APV LIST</p>
						<span class="badge badge-primary">10</span>
				</a></li>


				<!-- <li class="nav-item update-pro">
					<button onclick="reservation()">
						<i class="la la-hand-pointer-o"></i>
						<p>튜터 신청하기</p>
					</button>
				</li> 
				이 영역은 운영자이기 때문에 주석처리
				-->

			</ul>
		</div>
	</div>
	<!-- 사이드바 영역 -->

	<!-- 메인 영역 -->
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<h4 class="page-title">CLASS APPROVAL LIST</h4>
				<hr>
				<div class="row justify-content-center">

					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="card-title">클래스 승인 관리</div>
							</div>
							<div class="card-body">
							<form method="post" action="confirmClass.cl">
								<table class="table" id="listArea">
									<thead>
										<tr>
											<th scope="col">신청일자</th>
											<th scope="col">클래스#</th>
											<th scope="col">튜터#</th>
											<th scope="col">카테고리</th>
											<th scope="col">클래스이름</th>
											<th scope="col">클래스신청내용</th>
											<th scope="col">승인/반려</th>
											<th scope="col">승인여부</th>
										</tr>
									</thead>
									<tbody>
									 <%-- 
									 
									 <% if(apvList.isEmpty()) { %>
										<tr>
											<td colspan = "8"> 조회된 리스트가 없습니다. </td>
										</tr>
									<% } else { %> 
									<%	for(int i = 0; i < apvList.size(); i++){ %>  
									
									--%>
										<tr>
											<td>
												<%-- <%= apvList.get(i).getClassEnrollDate() %> --%>
													<input type="hidden" id="classEnrollDate" name="classEnrollDate" value="<%-- <%= apvList.get(i).getClassEnrollDate() %> --%>">
												</td>
												<td>
													<%-- <%= apvList.get(i).getClassNo() %> --%>
													<input type="hidden" id="classNo" name="classNo" value="<%-- <%= apvList.get(i).getClassNo() %> --%>">
												</td>
												<td>
													<%-- <%= apvList.get(i).getTutorNo() %> --%>
													<input type="hidden" id="tutorNo" name="tutorNo" value="<%-- <%= apvList.get(i).getTutorNo() %> --%>">	
												</td>
												<td>
													<%-- <%= apvList.get(i).getcategoryName() %> --%>
													<input type="hidden" id="categoryName" name="categoryName" value="<%-- <%= apvList.get(i).getcategoryName() %> --%>">
												</td>
												<td>
													<%-- <%= apvList.get(i).getClassName() %> --%>
													<input type="hidden" id="className" name="className" value="<%-- <%= apvList.get(i).getClassName() %> --%>">
												</td>
												<td>
													<button type="button" class="btn btn-outline-primary" id="detailClass" onclick="<%= request.getContextPath() %>/classopendetail.me">클래스 신청서 확인</button>
												</td>
												<td>
												<div class="btn-group" role="group" aria-label="Basic mixed styles outlined example">
													<!-- <input type="button" class="APV" value="승인">
													<input type="button" class="REJECT" value="반려"> -->
													<button type="button" id="APV" class="btn btn-outline-success active" onclick="confirmClass();">Y</button>
													<button type="button" id="REJECT" class="btn btn-outline-danger">N</button>
												</div>
											</td>
											 <td>
													<%-- <span><%= apvList.get(i).getClassApvYn() %></span>
													<input type="hidden" id="classApvYn" name="classApvYn" value="<%= apvList.get(i).getClassName() %>"> --%>
												</td> 
										</tr>
										<!-- 여기부터는 예시니까 지워도 돼요 -->
										<tr>
											<td>2021-11-23</td>
											<td>1111</td>
											<td>A11</td>
											<td>개발</td>
											<td>코딩공부하기</td>
											<td><button type="button" class="btn btn-outline-primary" id="detailClass" onclick="<%= request.getContextPath() %>/classopendetail.me">클래스 신청서 확인</button></td>
											<td>
												<div class="btn-group" role="group" aria-label="Basic mixed styles outlined example">
													<button type="button" class="btn btn-outline-success active">Y</button>
													<button type="button" class="btn btn-outline-danger">N</button>
												</div>
											</td>
											<td> Y</td>
											
										</tr>
										<tr>
											<td>2021-11-23</td>
											<td>1111</td>
											<td>A11</td>
											<td>개발</td>
											<td>코딩공부하기 코딩공부하기</td>
											<td><button type="button" class="btn btn-outline-primary" id="detailClass" onclick="<%= request.getContextPath() %>/classopendetail.me">클래스 신청서 확인</button></td>
											<td>
												<div class="btn-group" role="group" aria-label="Basic mixed styles outlined example">
													<button type="button" class="btn btn-outline-success">Y</button>
													<button type="button" class="btn btn-outline-danger active">N</button>
												</div>
											</td>
											<td> N</td>
										</tr>
										<%-- <% } %>
										<% } %> --%>
									</tbody>
								</table>
								</form>
							</div>
						</div>
					</div>
					<!-- 페이지네이션: 페이징처리시 영역나타남 -->
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
						<li class="page-item">
						<a class="page-link" href="location.href='<%-- <%= request.getContextPath() %>/apvList.cl?currentPage=1' --%>">
						<span aria-hidden="true">&laquo;</span>
						</a>
						</li>
						<!-- prev -->
							<li class="page-item">
							<a class="page-link" href=<%-- "<%= request.getContextPath() %>/apvList.cl?currentPage=<%= pi.getCurrentPage() -1 %>'" --%> aria-label="Previous"> 
								<span aria-hidden="true">&laquo;</span>
							</a>
							</li>
							<%-- <script>
							if(<%= pi.getCurrentPage() %> <= 1){
								$('#beforeBtn').prop('disabled', true);
							}
							</script> --%>
							<!-- 페이지넘버 -->
							<%-- <% for (int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
								<% 		if(p == pi.getCurrentPage()) { %> --%>
									<li class="page-item" id="choosen" disabled><a class="page-link" href=""><%-- <%= p %> --%></a></li> <!-- 현재 페이지는 선택 못하게 -->
								<%-- <%      } else { %> --%>
								<li class="page-item" id="numBtn" disabled><a class="page-link" href="<%-- <%= request.getContextPath() %>/apvList.cl?currentPage=<%= p %>' --%>"><%-- <%= p %> --%></a></li>
							<%-- <% } %>
							<% } %> --%>
							
							<!-- next -->
							<li class="page-item">
							<a id="afterBtn" class="page-link" href="location.href='<%-- <%= request.getContextPath() %>/apvList.cl?currentPage=<%= pi.getCurrentPage() + 1 %> --%>'"
								aria-label="Next"> 
								<span aria-hidden="true">&raquo;</span>
							</a>
							</li>
						
						
									<li class="page-item">
							<a id="toLastBtn" class="page-link" href="location.href='<%-- <%= request.getContextPath() %>/apvList.cl?currentPage=<%= pi.getMaxPage() %> --%>'" aria-label="Next"> 
								<span aria-hidden="true">&raquo;</span>
							</a>
							</li>
							</ul>
							<script>
										<%-- if(<%= pi.getCurrentPage() %> >= <%= pi.getMaxPage() %>){
											$('#afterBtn').prop('disabled', true);
										} --%>
						</script>
					</nav>

				</div>
			</div>

		</div>
	</div>
	<!-- 클래스 메인영역 -->





	



	<%@ include file="../common/js.jsp"%>
</body>
</html>