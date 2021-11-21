<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, hobbyistClass.model.vo.*, member.model.vo.Member"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
	Member member = (Member)request.getAttribute("member");
	HClass h = (HClass) request.getAttribute("hclass");
	ArrayList<HClassFile> f = (ArrayList)request.getAttribute("fileList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/menubar.css">
<link rel="stylesheet" type="text/css" href="css/tutorBoard.css">
<script>
	$(function() {
		// 사이드바 토글 기능
		$('[data-app-dashboard-toggle-shrink]').on(
				'click',
				function(e) {
					e.preventDefault();
					$(this).parents('.app-dashboard').toggleClass(
							'shrink-medium').toggleClass('shrink-large');
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
</head>
<body>
	<div class="app-dashboard shrink-medium">
		<!-- 상단바 -->
		<div class="row expanded app-dashboard-top-nav-bar">
			<div class="columns medium-2">
				<a class="app-dashboard-logo" href="<%=request.getContextPath()%>"><img
					src="images/logo.png" width="70px" height="55px"></a>
			</div>
			<div class="columns shrink app-dashboard-top-bar-actions">
				<div class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/myInfo.me"><img
						src="images/myPage.png"></a>
				</div>
				<!-- 마이페이지아이콘 -->
				<div class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/contact.co"><img
						src="images/contact.png"></a>
				</div>
				<!-- 콘택트아이콘 -->
				<div class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/myClass.me"><img
						src="images/like.png"></a>
				</div>
				<!-- 찜아이콘  -->

				<%
					if (loginUser == null) {
				%>
				<div class="nav-item">
					<a class="nav-link"
						href="<%=request.getContextPath()%>/loginForm.me"><button
							id="logBtn">Login</button></a>
				</div>
				<!-- 로그인 -->
				<%
					} else {
				%>
				<div class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/logout.me"><button
							id="logBtn">LogOut</button></a>
				</div>
				<!-- 로그아웃 -->
				<%
					}
				%>



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
				<!-- 상세 내용 -->
				<div class="outer">
					<table class="detail" id="thumbTable">
						<tr>
							<th width="50px">제목</th>
							<td colspan="5"><%=h.getClassName()%></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><%= member.getMemberNickName()%></td>
							<th>작성일</th>
							<td><%= h.getClassApvDate() %></td>
						</tr>
						<tr>
							<th>썸네일<br>사진
							</th>
							<td colspan="4">
								<div id="titldImgArea" align="center">
									<%
										if (!f.isEmpty()) {
									%>
									<%
										for (int i = 0; i < f.size(); i++) { // for문 안 돌려도 첫번째 사진이 썸네일이기 때문에 f.get(0)으로 접근해서 가져와도 됨
									%>
									<%
										if (f.get(i).getFileThumbYn().equals('Y')) { // fileLevel이 0이면 썸네일임
									%>
									<a
										href="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=f.get(i).getChangeName()%>"
										download="<%=f.get(i).getOriginName()%>"> <!-- 파일 다운받을 수 있게 a태그 링크에 파일경로, download속성 값으로 원래파일명 할당 -->
										<img id="titleImg"
										src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=f.get(i).getChangeName()%>">
									</a>
									<%
										}
									%>
									<%
										}
									%>
									<%
										} else {
									%>
									<img id="titleImg"
										src="<%=request.getContextPath()%>uploadFiles/">
									<%
										}
									%>
								</div>
							</td>
						</tr>
						<tr>
							<th>클래스 소개<br>
							</th>
							<td colspan="6">
								<p id="contentArea">
									<%=h.getClassContent()%>
								</p>
							</td>
						</tr>
					</table>

					<table class="detail">
						<tr>
							<%
								if (!f.isEmpty()) {
							%>
							<%
								for (int i = 0; i < f.size(); i++) {
							%>
							<%
								if (f.get(i).getFileThumbYn().equals("N")) { // fileLevel이 0이 아니면 썸네일 아님
							%>
							<td>
								<div class="detailImgArea">
									<a
										href="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=f.get(i).getChangeName()%>"
										download="<%=f.get(i).getOriginName()%>"> <img
										class="detailImg" id="detailImg<%=i%>"
										src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=f.get(i).getChangeName()%>">
										<!-- id 반복되지 않게 i를 붙임 -->
									</a>
								</div>
							</td>
							<% 			} %>
							<% 		} %>
							<% } %>
						</tr>
					</table>
					
					<table>
						<th>클래스 신청 날짜</th>
						<td>시작일<%=h.getClassStartDate()%> ~ 종료일 <%=h.getClassEndDate()%></td>
					</table>
					<table>
						<th>클래스 강의 시간</th>
						<td><%= h.getClassTime() %></td>
					</table>
					<table>
						<th>수강료</th>
						<td><%=h.getClassFee()%></td>
					</table>
					<table>
						<th>클래스 모집 인원 </th>
						<td>최소 인원 <%= h.getClassTuteeMin() %> ~ 최대 인원 <%= h.getClassTuteeMax() %></td>
					</table>
				</div>
</body>
</html>