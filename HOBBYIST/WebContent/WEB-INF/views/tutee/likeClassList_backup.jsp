<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, hobbyistClass.model.vo.*, tutee.model.vo.*, tutor.model.vo.Tutor, java.util.ArrayList"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	Tutor tutor = (Tutor)session.getAttribute("tutor");
	ArrayList<LikeClass> lcList = (ArrayList)request.getAttribute("lcList");
	ArrayList<HClassFile> fileList = (ArrayList)request.getAttribute("fileList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Classroom</title>
<%@ include file="../common/css.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
.class p{color: black;}
.card {
  border-radius: 0px;
  background-color: $white-color;
  margin-bottom: 30px;
  -webkit-box-shadow: 0px 1px 15px 1px rgba(69, 65, 78, 0.08);
  -moz-box-shadow: 0px 1px 15px 1px rgba(69, 65, 78, 0.08);
  box-shadow: 0px 1px 15px 1px rgba(69, 65, 78, 0.08);
  border: 1px solid #eee;
  min-width:  100%;
  min-height: 100%;
 }
 .class-card{height: 320px;}
 .col-md-4{min-width: 350px;}
</style>
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
							<a class="" data-toggle="collapse" href="#collapseExample" aria-expanded="true">
								<span>
									<!-- loginUser의 NickName 불러오기 -->
									<b><%= loginUser.getMemberNickName() %></b>
									<!-- loginUser의 grade 불러오기 -->
								<% if(loginUser.getMemberGrade().equals("A")) { %>
									<span class="user-level">관리자(admin)</span>
								<% } else if(loginUser.getMemberGrade().equals("B")) { %>
									<span class="user-level">튜터(Tutor)</span>
								<% } else { %>
									<span class="user-level">튜티(Tutee)</span>
								<% }  %>
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
										<a href="<%= request.getContextPath() %>/delete.me">
											<span class="link-collapse">튜티 탈퇴</span>
										</a>
									</li>
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
					<li class="nav-item  active"><a
						href="<%=request.getContextPath()%>/likedClass.te"> <i
							class="la la-gittip"></i>
							<p>LIKED CLASS</p>
					</a></li>
<%-- 					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/review.re"> <i
							class="la la-camera-retro"></i>
							<p>MY REVIEW</p>
					</a></li> --%>
					
					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/list.cs"> <i
						class="la la-question-circle"></i>
							<p>1:1 REQUEST</p>
					</a></li>
					<hr>
					<% if(loginUser != null && loginUser.getMemberGrade().equals("B")) { %>
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
			<!-- 사이드바 영역 -->
			
			<!-- 메인 영역 -->
			<div class="main-panel">
				<div class="content class_content">
		 			<div class="container-fluid"> 
						<h4 class="page-title">찜한 클래스</h4>
						<div class="row class likeClass">
					<% if (!lcList.isEmpty()) { %>
							<% 	for (LikeClass c : lcList) { %>
							<div class="col-md-4">
							<div class="card card-stats card-primary active">
									<div class="card-body">
										<div class="row class-card">
<!-- 											<div class="col-5"> 
											
											</div> -->
									<% if (!fileList.isEmpty()) { %>
									<%		for(HClassFile f : fileList) { %>
									<%			if(c.getClassNo() == f.getBoardNo()) { %>
											<div class="thumbnailArea" style="height: 225px; width: 100%;">
												<img style="min-width:100%; height: 100%;" src="<%= request.getContextPath() %>/uploadFiles/<%= f.getChangeName() %>"
													class="thumbnail" alt="Thumbnail">
											</div>
									<%			} %>
									<% 		} %>
									<% } %>
	 										<div class="icon-big text-center">
	 											<h5><%= c.getClassName() %></h5>				
											</div>
											<br><br><br>
											<div class="btn_main">
												<div class="buy_bt">
													<a href="<%= request.getContextPath() %>/detail.hcl?cNo=<%= c.getClassNo() %>">Buy Now</a> 
												</div>
												<div class="seemore_bt">
													<a href="<%= request.getContextPath() %>/detail.hcl?cNo=<%= c.getClassNo() %>">See More</a> 
												</div>
											</div>											
										</div>
									</div>
								</div>
							</div> 
					<% 		}  %>
					<% }  %>	
						</div>			
					</div>				
				</div>
			</div>

<%@ include file="../common/js.jsp" %>
<script>
	function reservation() {
    	location.href = "<%= request.getContextPath() %>/tuteeEnroll.me";
	}
</script>
</body>
</html>