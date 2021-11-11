<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	/* Tutor tutor = (Tutor)session.getAttribute("tutor"); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Classroom</title>
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/menubar.css">
<link rel="stylesheet" type="text/css" href="css/tuteeMyClass.css">
<style>
	#logBtn{
		/* 임시로 상단바의 로그인버튼 폰트 적용 */
		font-family: monospace;
		font-weight: bold;
	}
</style>
</head>
<body>
	<div class="app-dashboard shrink-medium">
	
		<!-- 상단바 -->
		<div class="row expanded app-dashboard-top-nav-bar">
			<div class="columns medium-2">
				<a class="app-dashboard-logo" href="<%= request.getContextPath() %>"><img
					src="images/logo.png" width="70px" height="55px"></a>
			</div>
			<div class="columns shrink app-dashboard-top-bar-actions">
							<div class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/myInfo.me"><img src="images/myPage.png"></a></div> <!-- 마이페이지아이콘 -->
							<div class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/contact.co"><img src="images/contact.png"></a></div> <!-- 콘택트아이콘 -->
							<div class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/myClass.me"><img src="images/like.png"></a></div> <!-- 찜아이콘  -->
							
							<% if(loginUser == null) { %>
								<div class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/loginForm.me"><button id="logBtn">Login</button></a></div> <!-- 로그인 -->
							<% } else { %>
								<div class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/logout.me"><button id="logBtn">LogOut</button></a></div> <!-- 로그아웃 -->
							<% } %>
			
			
			
				<!-- <button href="#" class="button hollow">Logout</button> 로그아웃 버튼 -->
				<!-- <a href="#" height="30" width="30" alt=""><i class="fa fa-info-circle"></i></a> -->
			</div>
		</div>


		<div class="app-dashboard-body off-canvas-wrapper">
			<div id="app-dashboard-sidebar"
				class="app-dashboard-sidebar position-left off-canvas off-canvas-absolute reveal-for-medium"
				data-off-canvas>
				<div class="app-dashboard-sidebar-title-area">
					<div class="app-dashboard-close-sidebar">
						<!-- Close button -->
						<button id="close-sidebar" data-app-dashboard-toggle-shrink
							class="app-dashboard-sidebar-close-button show-for-medium"
							aria-label="Close menu" type="button">
							<span aria-hidden="true"><a href="#"><i
									class="large fa fa-angle-double-left"><img
								src="images/three-dots-vertical.svg"></i></a></span> 
						</button>
					</div>
					<!-- open button -->
					<div class="app-dashboard-open-sidebar">
						<button id="open-sidebar" data-app-dashboard-toggle-shrink
							class="app-dashboard-open-sidebar-button show-for-medium"
							aria-label="open menu" type="button">
							<span aria-hidden="true"><a href="#"><i
									class="large fa fa-angle-double-right"><img
								src="images/three-dots-vertical.svg"></i></a></span> 
						</button>
					</div>
				</div>
				<!-- 사이드바 -->
				<div class="app-dashboard-sidebar-inner">
					<ul class="menu vertical">
						<li><a href="#">
							<span class="app-dashboard-sidebar-text"><h3>나의 클래스룸</h3></span> <!-- 누르면 나의 클래스룸 -> 수강중/수강완료/찜한클래스/후기 전체 볼 수 있는 페이지 -->
						</a></li>
						<li><a href="#">
							<span class="app-dashboard-sidebar-text">수강중인 클래스</span> <!-- 누르면 수강중인 클래스 페이지로 이동(페이지 따로 만들기) -->
						</a></li>
						<li><a href="#"> 
							<span class="app-dashboard-sidebar-text">수강완료 클래스</span> <!-- 누르면 수강완료 클래스 페이지로 이동 -->
						</a></li>
						<li><a href="#"> 
							<span class="app-dashboard-sidebar-text">찜한 클래스</span> <!-- 누르면 찜한 클래스 페이지로 이동 -->
						</a></li>
						<li><a href="#"> 
							<span class="app-dashboard-sidebar-text">내가 쓴 후기</span> <!-- 누르면 내가 쓴 후기 페이지로 이동 -->
						</a></li>
						<br>
						<li><a href=""> 
							<span class="app-dashboard-sidebar-text"><h3>내 정보</h3></span> <!-- 내 정보 조회 페이지  -->
						</a></li>
						<li><a href=""> 
							<span class="app-dashboard-sidebar-text">내 정보 수정</span> <!--  내 정보 수정 페이지-->
						</a></li>
						<li><a href=""> 
							<span class="app-dashboard-sidebar-text">결제정보</span>  
						</a></li>
						<li><a href=""> 
							<span class="app-dashboard-sidebar-text">튜티 탈퇴</span>
						</a></li>
						<br><br><br>
						
						<%-- <% if(tutor == null) { %> 로그인할때 tutor정보도 세션에 저장하고 상단에서 객체 생성하기 --%>
						<% if(loginUser != null && loginUser.getGrade().equals("B")) { %>  <%-- 로그인한 유저의 그레이드가 'B'즉 튜터가 아니면 튜터 신청 버튼 활성화 --%>
						<li>
							<span class="app-dashboard-sidebar-text"><h3>튜터</h3></span> 
						</li>
						<li ><a href=""> 
							<span class="app-dashboard-sidebar-text">내 클래스</span>  <%-- 누르고 서블릿 이동하면 tutor정보도 세션에 저장하기? --%>
						</a></li>
						<li style="color: #9ED4C2"><a href=""> 
							<span class="app-dashboard-sidebar-text">튜터 정보</span>
						</a></li>
						<li style="color: #9ED4C2"><a href=""> 
							<span class="app-dashboard-sidebar-text">정산하기</span>
						</a></li>		
						
						<% } else { %>
						<li>
							<span class="app-dashboard-sidebar-text"><button id="apply-tutor-btn">튜터 신청하기</button></span>
						</li> <%-- span class="app-dashboard-sidebar-text"가 있어야 사이드바 닫힐때 안 보임  --%>	
					
						<% }  %>
						<br><br><br>
					</ul>
					
					
				</div>
			</div>

			<!-- 본문 내용 -->
			<div class="app-dashboard-body-content off-canvas-content"
				data-off-canvas-content>
			
				<!-- 수강중인 클래스 -->
				<h3 id="content1" class="text-center">수강중인 클래스</h3>
				<div id="class-room">
					<%-- <% for (int i = 0; i < list.size(); i++) { %> --%>
					<div class="card news-card">
						<img src="images/drawing.png">
						<div class="card-section">
							<div class="news-card-author">
								<div class="news-card-author-name">
									<div class="hidden-class-no" style="display: none;">글번호</div>
									<a href="">오일파스텔로 그리는 꽃그림</a>
								</div>
							</div>
						</div>
					</div>
				  <%-- <% } %> --%>
					<div class="card news-card">
						<img src="images/drawing.png">
						<div class="card-section">
							<div class="news-card-author">
								<div class="news-card-author-name">
									<a href="#">오일파스텔로 그리는 꽃그림</a>
								</div>
							</div>
						</div>
					</div>

					<div class="card news-card">
						<img src="images/drawing.png">
						<div class="card-section">
							<div class="news-card-author">
								<div class="news-card-author-name">
									<a href="#">오일파스텔로 그리는 꽃그림</a>
								</div>
							</div>
						</div>
					</div>

				</div>

				<br>

				<h3 id="content2">수강완료 클래스</h3>
				<div id="class-end">
					<div class="card news-card">
						<img src="../../images/drawing.png">
						<div class="card-section">
							<div class="news-card-author">
								<div class="news-card-author-name">
									<a href="#">Harry Manchanda</a>
								</div>
							</div>
						</div>	
						<a href=""><button class="review-button write">후기 작성하기</button></a>
					</div>

					<div class="card news-card">
						<img src="../../images/drawing.png">
						<div class="card-section">
							<div class="news-card-author">
								<div class="news-card-author-name">
									<a id="1" href="#">Harry Manchanda</a>
								</div>
							</div>
						</div>
						<a href=""><button class="review-button write">후기 작성하기</button></a>
					</div>

				</div>
				<br>

				<!-- 찜한 클래스 -->
				<h3 id="content3">찜한 클래스</h3>
				<div id="class-liked">
				
					<div class="card news-card">
						<img src="images/drawing.png">
						<div class="card-section">
							<div class="news-card-author">
								<div class="news-card-author-name">
									<a href="<%= request.getContextPath() %>/classDetail.cl">꽃그림 클래스</a>
								</div>
							</div>
						</div>
						<!-- like버튼 -->
						<button class="button button-like liked">
							<i class="fa fa-heart">❤</i> <!-- 아이콘 태그  -->
							<span>Like 취소</span>
						</button>
					</div>
					
					<div class="card news-card">
						<img src="../../images/drawing.png">
						<div class="card-section">
							<div class="news-card-author">
								<div class="news-card-author-name">
									<a href="#">오일파스텔 클래스</a>
								</div>
							</div>
						</div>
						<!-- like버튼 -->
						<button class="button button-like liked">
							<i class="fa fa-heart">❤</i> <!-- 아이콘 태그  -->
							<span>Like 취소</span>
						</button>

					</div>
				</div>
				<br>

				<!-- 내가 쓴 후기 -->
				<h3 id="content4">내가 쓴 후기</h3>
				<div id="review">
					<div class="card news-card review">
						<h4>첫 수강 후기입니다</h4>
						<img src="../../images/drawing.png">
						<div class="card-section">
							<div class="news-card-date">Sunday, 16th April</div>
							<p class="news-card-description">Lorem ipsum dolor sit amet,
								consectetur adipisicing elit. Recusandae facere, ipsam quae sit,
								eaque perferendis commodi!...</p>
							<a href="review_modify.html"><button class="review-button modify">수정</button></a>
							<button class="review-button remove">삭제</button>
						</div>
					</div>
					<div class="card news-card review">
						<h4>첫 수강 후기입니다</h4>
						<img src="../../images/drawing.png">
						<div class="card-section">
							<div class="news-card-date">Sunday, 16th April</div>
							<p class="news-card-description">Lorem ipsum dolor sit amet,
								consectetur adipisicing elit. Recusandae facere, ipsam quae sit,
								eaque perferendis commodi!...</p>
							<a href="review_modify.html"><button class="review-button modify">수정</button></a>
							<button class="review-button remove">삭제</button>
						</div>
					</div>
					<div class="card news-card review">
						<h4>첫 수강 후기입니다</h4>
						<img src="../../images/drawing.png">
						<div class="card-section">
							<div class="news-card-date">Sunday, 16th April</div>
							<p class="news-card-description">Lorem ipsum dolor sit amet,
								consectetur adipisicing elit. Recusandae facere, ipsam quae sit,
								eaque perferendis commodi!...</p>
							<a href="review_modify.html"><button class="review-button modify">수정</button></a>
							<button class="review-button remove">삭제</button>
						</div>
					</div>
					<div class="card news-card review">
						<h4>첫 수강 후기입니다</h4>
						<img src="../../images/drawing.png">
						<div class="card-section">
							<div class="news-card-date">Sunday, 16th April</div>
							<p class="news-card-description">Lorem ipsum dolor sit amet,
								consectetur adipisicing elit. Recusandae facere, ipsam quae sit,
								eaque perferendis commodi!...</p>
							<a href="review_modify.html"><button class="review-button modify">수정</button></a>
							<button class="review-button remove">삭제</button>
						</div>
					</div>
					<div class="card news-card review">
						<h4>첫 수강 후기입니다</h4>
						<img src="../../images/drawing.png">
						<div class="card-section">
							<div class="news-card-date">Sunday, 16th April</div>
							<p class="news-card-description">Lorem ipsum dolor sit amet,
								consectetur adipisicing elit. Recusandae facere, ipsam quae sit,
								eaque perferendis commodi!...</p>
							<a href="review_modify.html"><button class="review-button modify">수정</button></a>
							<button class="review-button remove">삭제</button>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
			<!-- FOOTER -->
			<footer class="container" style="text-align: center; background: #F5F5F5;">
			
				<p class="float-end">
					<a href="#">Back to top</a>
				</p>
				<p>
					&copy; 2021 HOBBYIST, Inc. &middot; <a href="<%= request.getContextPath() %>/contact.co">Contact</a>
					<!-- &middot; <a href="#">Terms</a> -->
				</p>
			</footer> 
	</div>
	<script>
		$(function() {
			// 사이드바 토글 기능
			$('[data-app-dashboard-toggle-shrink]').on('click',function(e) {
				e.preventDefault();
				$(this).parents('.app-dashboard').toggleClass('shrink-medium').toggleClass('shrink-large');
			});
			
			// like취소-button클릭시 찜한 클래스 삭제 기능
	 		$('.button-like').bind('click', function(event) {
				if (confirm('취소하시겠습니까?')) { // 확인 누를시에만 삭제
					// $(this).toggleClass("liked"); //여기선 없어도 됨
					/* $(this).parent().remove(); */
					// 삭제하는 서블릿으로 이동  location.href="" -> 삭제하고 다시 이 페이지로 돌아오기
				}
			}); 
	
			// 후기 삭제 버튼 누를시
	 		$('.remove').click(function() {
				if (confirm('삭제하시겠습니까?')) { // 확인 누를시에만 삭제
					/* $(this).parent().parent().remove(); */
					// 삭제하는 서블릿으로 이동  location.href="" -> 삭제하고 다시 이 페이지로 돌아오기
				}
			});
		});
	</script>
</body>
</html>