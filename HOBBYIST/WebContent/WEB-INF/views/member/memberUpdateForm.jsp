<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<%
	// Member myInfo = (Member)request.getAttribute("myInfo"); 
	// 내 정보 조회 페이지에서 가져온 정보 대신 세션 저장된 정보를 사용(어차피 로그인 상태이기 때문)
	
	String msg = (String)request.getAttribute("msg");
%>
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
#cancelBtn{
	background: lightgray;
	font-weight: bold;
	cursor: pointer;
	color: white;
	box-shadow: 2px 2px 2px lightgray;
	font-size: large;
}

#checkBtn{background: #9ED4C2; cursor: pointer; color: white; box-shadow: 1px 1px 2px lightgray; border: 1px solid lightgray; border-radius: 10px;}
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
						<li><a href="#">
							<span class="app-dashboard-sidebar-text"><h3>나의 클래스룸</h3></span>
						</a></li>
						<li><a href="#content1">
							<span class="app-dashboard-sidebar-text">수강중인 클래스</span>
						</a></li>
						<li><a href="#content2"> 
							<span class="app-dashboard-sidebar-text">수강완료 클래스</span>
						</a></li>
						<li><a href="#content3"> 
							<span class="app-dashboard-sidebar-text">찜한 클래스</span>
						</a></li>
						<li><a href="#content4"> 
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
							<span class="app-dashboard-sidebar-text">튜티 탈퇴</span>
						</a></li>
						<br><br><br>
						
						<% if(loginUser != null && loginUser.getGrade().equals("B")) { %>  
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
				
				<form action="<%= request.getContextPath() %>/update.me" method="post">
					<div class="info">
					
						<br><br>
						<b>이메일</b><br>
						<input type="text" id="emai" name="email" value="<%= loginUser.getUserEmail() %>" style="background: lightgray" readonly><br>
						
						<b>이름</b><br>
						<input type="text" id="name" name="name" value="<%= loginUser.getUserName() %>" style="background: lightgray" readonly><br>
					
						<b>닉네임</b><span style="color: red;">*</span><br>
						<input type="text" id="nickName" name="nickName" value="<%= loginUser.getNickName() %>"> <button type="button" id="checkBtn" value="중복확인">중복확인</button> <br>

						<b>휴대폰 번호</b><br>
						<input type="text" id="phone" name="phone"  placeholder="(-없이)01012345678" value="<%= loginUser.getPhone() ==  null ? "" : loginUser.getPhone() %>"><br>

						<br>
						<input type="submit" id="btnSub" value="수정하기"> <br>
						<!-- <input type="button" id="cancelBtn" onclick="location.href='javascript:history.go(-1)'" value="취소하기"> -->
						<input type="button" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/myInfo.me'" value="취소하기">			
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
					&copy; 2021 Company, Inc. &middot; <a href="#">Contact</a>
					<!-- &middot; <a href="#">Terms</a> -->
				</p>
			</footer> 
	</div>
	<script>	
			// 닉네임 중복 확인 매시지 팝업창
			document.getElementById('checkBtn').onclick = function(){
				var nickName = document.getElementById('nickName').value;
			
				window.open('checkNick.me?nickName=' + nickName, 'nickCheck', 'width=400, height=200');
			}
				
			// updateform 제출시 기존 닉네임과 변경하려고 하는 닉네임이 다르다면 서블릿에서 중복검사 진행 , 중복된 닉네임 있다면 request에 msg저장해서 이 페이지로 돌아옴
			window.onload = function() { 
				if ('<%= msg %>' != 'null') {
					alert('<%= msg %>'); // alert메시지 출력 -> 사용 중인 닉네임
				}
			}
				
	</script>
</body>
</html>