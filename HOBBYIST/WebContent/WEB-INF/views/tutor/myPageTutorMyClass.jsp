<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, classNotice.model.vo.*, member.model.vo.Member, hobbyistClass.model.vo.*, tutor.model.vo.Tutor"%>
<%@ page
	import="hobbyistClass.model.vo.*, hobbyistClass.model.service.*"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
	ArrayList<Member> member = (ArrayList) request.getAttribute("member");
	PageInfo pi = (PageInfo) request.getAttribute("pi");

	ArrayList<HClass> classList = (ArrayList)request.getAttribute("bList");
	ArrayList<HClassFile> fileList = (ArrayList)request.getAttribute("cfList");
	ArrayList<HClass> classAList = (ArrayList)request.getAttribute("aList");
	ArrayList<HClass> classCList = (ArrayList)request.getAttribute("cList");
	Tutor tutor = (Tutor)session.getAttribute("tutor");
%>
<!DOCTYPE html>
<html>
<head>
<style>
#endImage {
    opacity: 0.2;
    filter: alpha(opacity=50); /* msie */
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/css.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
					<li class="nav-item active"><a
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

	<!-- 메인 영역 -->
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<h4 class="page-title">MY CLASS</h4>
				<button type="button" class="btn btn-primary pull-right"
					onclick="location.href = '<%=request.getContextPath()%>/move.co'"
					class="button hollow">+ 클래스 신청하기</button><br><br>
				<div class="row">

					<div class="col-md-4">
						<div class="card card-stats card-primary active">
							<div class="card-body" >
								<div class="row class-card">
								<!-- 수업중 -->
									<h2>강의중인 클래스</h2>
									<% if (classList.isEmpty() || fileList.isEmpty()) { %>
									<h1>등록된 강의가 없습니다.</h1>
									<% } else { %>
									<%	for (int i = 0; i < classList.size(); i++) { %>
									<% HClass hc = classList.get(i); %>
									<div class="col-md-12">
										<div class="box_main">
											<% for (int j = 0; j < fileList.size(); j++) { %>
											<% HClassFile f = fileList.get(j);%>
											<% if (hc.getClassNo() == f.getBoardNo()) { %>
											<div class="thumbnailArea" style="height: 350px; width: 100%;">
												<img style="min-width:100%; height: 100%;" 
													src="<%=request.getContextPath()%>/uploadFiles/<%=fileList.get(j).getChangeName() %>"
													class="thumbnail" alt="Thumbnail">
											</div>
											<%
															}
														%>
											<%
														}
													%>
											<h4 class="shirt_text"><%=classList.get(i).getClassName()%></h4>
											<!-- 좋아요 버튼 -->
											&nbsp; <span class="likeBtnArea"> <input type="hidden"
												class="cNo" name="cNo"
												value="<%=classList.get(i).getClassNo()%>">
												<button class="btn btn-default pull-right" "
													onclick="location.href = '<%=request.getContextPath()%>/classManagement.tt?cNo=<%=classList.get(i).getClassNo()%>'"
													type="button">
													<span>클래스 관리하기</span>
												</button>
											</span> <br> <br> <br> <br>
										</div>
									</div>
									<%
									}
								%>
									<% } %>
								</div>
							</div>
						</div>
					</div>
					<!-- 수강 중인 클래스 -->
					<div class="col-md-4">
						<div class="card card-stats card-success">
							<div class="card-body">
								<div class="row class-card">
									<h2>신청한 클래스</h2>
									<% if (classAList.isEmpty() || fileList.isEmpty()) { %>
									등록된 강의가 없습니다.
									<% } else { %>
									<%	for (int i = 0; i < classAList.size(); i++) { %>
									<% HClass hca = classAList.get(i); %>
									<div class="col-md-12">
										<div class="box_main">
											<% for (int j = 0; j < fileList.size(); j++) { %>
											<% HClassFile f = fileList.get(j);%>
											<% if (hca.getClassNo() == f.getBoardNo()) { %>
											<div class="thumbnailArea" style="height: 350px; width: 100%;">
												<img style="min-width:100%; height: 100%;"
													src="<%=request.getContextPath()%>/uploadFiles/<%=fileList.get(j).getChangeName() %>"
													class="thumbnail" alt="Thumbnail">
											</div>
											<%
															}
														%>
											<%
														}
													%>
											<h4 class="shirt_text"><%=classAList.get(i).getClassName()%></h4>
											<!-- 좋아요 버튼 -->
											&nbsp; <span class="likeBtnArea"> <input type="hidden"
												class="cNo" name="cNo"
												value="<%=classAList.get(i).getClassNo()%>">
												<button class="btn btn-default pull-right" 
													onclick="location.href = '<%=request.getContextPath()%>/classOpenDetail.tt?bId=<%=classAList.get(i).getClassNo()%>'"
													type="button">
													<span>신청서 확인하기</span>
												</button>
											</span> <br> <br> <br> <br>
										</div>
									</div>
									<%
									}
								%>
									<% } %>
									</div>
								</div>
							</div>
						</div>
						<!-- 수강완료 클래스 -->

						<div class="col-md-4">
							<div class="card card-stats card-danger">
								<div class="card-body">
									<div class="row class-card">
										<h2>완료 된 클래스</h2>
										<% if (classCList.isEmpty() || fileList.isEmpty()) { %>
										완료된 강의가 없습니다.
										<% } else { %>
										<%	for (int i = 0; i < classCList.size(); i++) { %>
										<% HClass hcc = classCList.get(i); %>
										<div class="col-md-12">
											<div class="box_main">
												<% for (int j = 0; j < fileList.size(); j++) { %>
												<% HClassFile f = fileList.get(j);%>
												<% if (hcc.getClassNo() == f.getBoardNo()) { %>
												<div class="thumbnailArea" style="height: 350px; width: 100%;">
													<img style="min-width:100%; height: 100%;" id = "endImage"
														src="<%=request.getContextPath()%>/uploadFiles/<%=fileList.get(j).getChangeName() %>"
														class="thumbnail" alt="Thumbnail">
												</div>
												<%
															}
														%>
												<%
														}
													%>
												<h4 class="shirt_text"><%=classCList.get(i).getClassName()%></h4>
											</div>
										</div>
										<%
									}
								%>
									<% } %>	
					
										
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