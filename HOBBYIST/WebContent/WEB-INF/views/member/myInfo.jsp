<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/menubar.css">
<link rel="stylesheet" type="text/css" href="css/myInfo.css">
<script src="js/menubar.js"></script>
<style>
	#updatePwdBtn {
		background: #778899;
		font-weight: bold;
		cursor: pointer;
		color: white;
		box-shadow: 2px 2px 2px lightgray;
		font-size: large;
	}
</style>
</head>
<body>
	<div class="app-dashboard shrink-medium">
		
		<!-- 상단바 -->
		<%@ include file="../common/topbar.jsp" %>
	
		<!-- 바디 영역(사이드바, 본문) -->
		<div class="app-dashboard-body off-canvas-wrapper">
		
			<!-- 사이드바 영역 -->
			<div id="app-dashboard-sidebar" class="app-dashboard-sidebar position-left off-canvas off-canvas-absolute reveal-for-medium" data-off-canvas>
				
				<!-- 사이드바 close, open -->
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
						<li><a href="<%= request.getContextPath() %>/myClass.te">
							<span class="app-dashboard-sidebar-text"><h3>나의 클래스룸</h3></span>
						</a></li>
						<li><a href="#">
							<span class="app-dashboard-sidebar-text">수강중인 클래스</span>
						</a></li>
						<li><a href="#"> 
							<span class="app-dashboard-sidebar-text">수강완료 클래스</span>
						</a></li>
						<li><a href="#"> 
							<span class="app-dashboard-sidebar-text">찜한 클래스</span>
						</a></li>
						<li><a href="#"> 
							<span class="app-dashboard-sidebar-text">내가 쓴 후기</span>
						</a></li>
						<br>
						<li><a href="<%= request.getContextPath() %>/myInfo.me"> 
							<span class="app-dashboard-sidebar-text"><h3>내 정보</h3></span>
						</a></li>
						<li><a href="<%= request.getContextPath() %>/updateForm.me"> 
							<span class="app-dashboard-sidebar-text">내 정보 수정</span>
						</a></li>
						<li><a href=""> 
							<span class="app-dashboard-sidebar-text">결제정보</span>
						</a></li>
						<li><a href=""> 
							<span class="app-dashboard-sidebar-text" onclick="deleteMember()">튜티 탈퇴</span>
						</a></li>
						<br><br><br>
						
						<% if(loginUser != null && loginUser.getMemberGrade().equals("B")) { %>  
						<li>
							<span class="app-dashboard-sidebar-text"><h3>튜터</h3></span> 
						</li>
						<li ><a href=""> 
							<span class="app-dashboard-sidebar-text">내 클래스</span>  <%-- 누르고 서블릿 이동하면 tutor정보도 세션에 저장하기? --%>
						</a></li>
						<li style="color: #9ED4C2"><a href="<%= request.getContextPath() %>/tutorInform.me"> 
							<span class="app-dashboard-sidebar-text">튜터 정보</span>
						</a></li>
						<li style="color: #9ED4C2"><a href=""> 
							<span class="app-dashboard-sidebar-text">정산하기</span>
						</a></li>		
						
						<% } else { %>  <%-- 로그인한 유저의 그레이드가 'B'즉 튜터가 아니면 튜터 신청 버튼 활성화 --%>
						<li>
							<span class="app-dashboard-sidebar-text"><button id="apply-tutor-btn">튜터 신청하기</button></span>
						</li> <%-- span class="app-dashboard-sidebar-text"가 있어야 사이드바 닫힐때 안 보임  --%>	
					
						<% }  %>
						<br><br><br>
					</ul>
				</div>
			</div>

			<!-- 본문 영역 -->
			<div class="app-dashboard-body-content off-canvas-content" data-off-canvas-content>
			
			<div class="modify-information">
				<form action="<%= request.getContextPath() %>/updateForm.me" method="post">
					<div class="image-upload info">					    
						<br><br>
						<b>이메일</b><br>
						<%= loginUser.getMemberEmail() %>
						<input type="hidden" id="email" name="email" value="<%= loginUser.getMemberEmail() %>"><br><br>
						
						<b>이름</b><br>
						<%= loginUser.getMemberName() %>
						<input type="hidden" id="name" name="name" value="<%= loginUser.getMemberName() %>"><br><br>
					
						<b>닉네임</b><br>
						<%= loginUser.getMemberNickName() %>
						<input type="hidden" id="nickName" name="nickName" value="<%= loginUser.getMemberNickName() %>"><br><br>
						
						<b>휴대폰 번호</b><br>
						<%= loginUser.getMemberPhone() ==  null ? "-" : loginUser.getMemberPhone()  %>
						<input type="hidden" id="phone" name="phone" value="<%= loginUser.getMemberPhone() %>"><br><br>

						<input type="submit" id="btnSub" value="수정하기"><br>
						<input type="button" id="updatePwdBtn" value="비밀번호 변경하기" onclick="location.href='updatePwdForm.me'">
						
					</div>
				</form>
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

	<!-- 탈퇴 알림창 -->
	<script>
            function deleteMember(){
                var bool = confirm("정말 탈퇴하시겠습니까?");
                if(bool){
                    location.href= '<%= request.getContextPath() %>/delete.me';
                }
            }
        </script>

</body>
</html>