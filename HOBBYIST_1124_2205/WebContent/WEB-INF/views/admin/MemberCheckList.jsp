<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, hobbyistClass.model.vo.*" %>
<% 
	ArrayList<Member> mList = (ArrayList)request.getAttribute("mList");
	ApvPageInfo pi = (ApvPageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin - 회원 조회</title>
<style>
	#outer {
		width: 1500px;
		height : 600px;
		margin-left: 10px;
	}
	.tableArea {
		width: 1300px;
		height : 500px;
		margin-left: 0;
 	}
	#listArea {
		text-align: center;
		margin-bottom: 50px;
	}
	
	#writeFaqBtn {
		background: #9ED4C2;
		border: 1px solid white;
		width : 100px;
		height : 35px;
		font-weight: bold;
		color : white;
	}
	
	th {
		border-bottom: 1px solid lightgrey;
		height : 50px;
	}
	
	td {
		height : 30px;
	}
	
	table .div-sub {
		display : none;
	}
	
	button:hover {
		cursor: pointer;
		font-weight: bold;	
	}
	
	#choosen{
		color: #9ED4C2; 
		border: none; 
		font-weight: bold;
		background: none;
	}
	
	#numBtn{ 
		color : gray;
		border: none;
		background: none;
	}
	
	#toFirstBtn, #toLastBtn, #beforeBtn, #afterBtn{
		border : none;
		background: none;
	}
	
		
</style>
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/menubar.css">
<script src="js/menubar.js"></script>
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
								<span class="app-dashboard-sidebar-text"><h3>클래스 관리</h3></span>
							</a></li>
							<li><a href="<%= request.getContextPath() %>/classList.cl">
								<span class="app-dashboard-sidebar-text">클래스 승인</span>
							</a></li>
							<li><a href="#"> 
								<span class="app-dashboard-sidebar-text">클래스 후기 관리</span>
							</a></li>
							<br><br>
							<li><a href="#"> 
								<span class="app-dashboard-sidebar-text"><h3>고객 요청 관리</h3></span>
							</a></li>
							<li><a href="<%= request.getContextPath() %>/list.cs"> 
								<span class="app-dashboard-sidebar-text">1:1 문의</span>
							</a></li>
							<li><a href="<%= request.getContextPath() %>/FAQ.bo"> 
								<span class="app-dashboard-sidebar-text">자주 묻는 질문(FAQ)</h3></span>
							</a></li>
							<br><br>
							<li><a href="#"> 
								<span class="app-dashboard-sidebar-text"><h3>회원 관리</h3></span>
							</a></li>
							<li><a href="#"> 
								<span class="app-dashboard-sidebar-text">튜티(Tutee)목록</span>
							</a></li>
							<li><a href="#"> 
								<span class="app-dashboard-sidebar-text">튜터(Tutor)목록</span>
							</a></li>
										
						</ul>
					</div>
				</div>

			<!-- 본문 영역 -->
 			<div class="app-dashboard-body-content off-canvas-content" data-off-canvas-content>
				<div id="outer">
					<h1> 회원 관리 </h1>
					<h2> TUTEE 목록</h2>
						<div class="tableArea">
							<form method="post"> <!-- action="confirmClass.cl" --> 
								<table id="listArea">
									<tr>
										<th width = 200px> 이메일 </th>
										<th width = 80px> 이름 </th>
										<th width = 80px> 닉네임  </th>
										<th width = 100px> 전화번호  </th>
										<th width = 100px> 비밀번호 </th>
										<th width = 200px> 카카오 </th>
										<th width = 80px> 가입경로 </th>
										<th width = 80px> 가입날짜 </th>
										<th width = 80px> 활동상태 </th>
									</tr>
			 						<% if(mList.isEmpty()) { %>
										<tr>
											<td colspan = "9"> 조회된 리스트가 없습니다. </td>
										</tr>
									<% } else { %>
										<%	for(int i = 0; i < mList.size(); i++){ %>
											<tr> 
												<td>
													<%= mList.get(i).getMemberEmail() %>
													<input type="hidden" id="tuteeEmail" name="tuteeEmail" value="<%= mList.get(i).getMemberEmail() %>">
												</td>
												<td>
													<%= mList.get(i).getMemberName() %>
													<input type="hidden" id="memberName" name="memberName" value="<%= mList.get(i).getMemberName() %>">
												</td>
												<td>
													<%= mList.get(i).getMemberNickName() %>
													<input type="hidden" id="tuteeNickName" name="tuteeNickName" value="<%= mList.get(i).getMemberNickName() %>">	
												</td>
												<td>
													<%= mList.get(i).getMemberPhone() %>
													<input type="hidden" id="tuteePwd" name="tuteePwd" value="<%= mList.get(i).getMemberPhone() %>">
												</td>
												<td>
													<%= mList.get(i).getMemberPwd() %>
													<input type="hidden" id="tuteePwd" name="tuteePwd" value="<%= mList.get(i).getMemberPwd() %>">
												</td>
												<td>
													<%= mList.get(i).getKakaoNo() %>
													<input type="hidden" id="tuteeKakao" name="tuteeKakao" value="<%= mList.get(i).getKakaoNo() %>">
												</td>
												<td>
													<%= mList.get(i).getMemberEnrollType() %>
													<input type="hidden" id="tuteeEnrollType" name="tuteeEnrollType" value="<%= mList.get(i).getMemberEnrollType() %>">
												</td>
												<td>
													<%= mList.get(i).getMemberEnrollDate() %>
													<input type="hidden" id="tuteeEnrollDate" name="tuteeEnrollDate" value="<%= mList.get(i).getMemberEnrollDate() %>">
												</td>
												<td>
													<%= mList.get(i).getMemberStatus() %>
													<input type="hidden" id="tuteeStatus" name="tuteeStatus" value="<%= mList.get(i).getMemberStatus() %>">
												</td>
											</tr> 
										<%  } %>
									<% } %> 
								</table>
							</form>
<%-- 							<div class="pagingArea" align="center">
			
								<!-- 처음으로 -->
								<button id="toFirstBtn" onclick="location.href='<%= request.getContextPath() %>/apvList.cl?currentPage=1'">&lt;&lt; 첫 페이지로</button>
								
								<!-- 이전페이지로 -->
								<button id="beforeBtn" onclick="location.href='<%= request.getContextPath() %>/apvList.cl?currentPage=<%= pi.getCurrentPage() -1 %>'">&lt; 이전</button>
								<script>
									if(<%= pi.getCurrentPage() %> <= 1){
										$('#beforeBtn').prop('disabled', true);
									}
								</script>
								
								<!-- 숫자버튼 -->
								<% for (int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
								<% 		if(p == pi.getCurrentPage()) { %>
									<button id="choosen" disabled><%= p %></button> <!-- 현재 페이지는 선택 못하게 -->
								<%      } else { %>
									<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/apvList.cl?currentPage=<%= p %>'"><%= p %></button>
								<%		 } %>
								<%	} %>
								
								<!-- 다음페이지로 -->
								<button id="afterBtn" onclick="location.href='<%= request.getContextPath() %>/apvList.cl?currentPage=<%= pi.getCurrentPage() + 1 %>'">다음 &gt;</button>
									<script>
										if(<%= pi.getCurrentPage() %> >= <%= pi.getMaxPage() %>){
											$('#afterBtn').prop('disabled', true);
										}
									</script>
								
								<!-- 맨 끝으로 -->
								<button id="toLastBtn" onclick="location.href='<%= request.getContextPath() %>/apvList.cl?currentPage=<%= pi.getMaxPage() %>'">마지막으로  &gt;&gt;</button>
							
							</div> --%>
							
						</div>
					
					</div>
				</div> 
			</div>
			
			
			
			<script>
				$('#listArea td').mouseenter(function(){
					$(this).parent().css({'background':'#9ED4C2', 'font-weight' :'bold', 'color' : 'white'});
				}).mouseout(function(){
					$(this).parent().css({'background':'none', 'font-weight' :'normal', 'color' : 'black'});
				});
				
			</script>
				
			
			
			<!-- FOOTER -->
			<footer class="container" style="text-align: center; background: #F5F5F5;">
			
				<p class="float-end">
					<a href="#">Back to top</a>
				</p>
				<p>
					&copy; 2021 HOBBYIST, Inc. &middot; <a href="#">Contact</a>
					<!-- &middot; <a href="#">Terms</a> -->
				</p>
			</footer> 
		</div>
</body>
</html>