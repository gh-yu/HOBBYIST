<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="csboard.model.vo.*, java.util.ArrayList" %>
<%
	RequestBoard rb = (RequestBoard)request.getAttribute("board");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/menubar.css">
<!-- <script src="js/menubar.js"></script> -->
<style type="text/css">
	.wrapBaord{
		width:800px; min-height:500px;
		margin-left:auto; margin-right:auto; margin-bottom:50px;
	}
	.contentArea{margin-right: auto; margin-left: auto; align: center; border-collapse: collapse; font-size: small;}
	#boardArea{border-top: 2px solid gray; text-align: left; font-size: small; border-collapse: collapse; font-size: small; min-width: 750px; min-height: 350px;}
	th{font-size: medium;}
	.btn{background: #B0C4DE; font-weight: bold; color: white; border: none; cursor: pointer; width: 100px; height: 40px; box-shadow: 1px 1px 2px lightgray;}
	#deleteBtn{background: #BC8F8F;}
	#listBtn{background: lightgray;}
	
/* 	.buttonArea{margin-right: 50px; margin-bottom: 50px;}
	.buttonArea button{background: #D1B2FF; border-radius: 5px; color: white; width: 80px; heigth: 25px; text-align: center;} */
	button:hover{cursor: pointer;}
	table{align: center;}
	
/* 	.tableArea {width: 450px; height:350px; margin-left:auto; margin-right:auto; align: center;}
	
	#updateBtn{background: #B2CCFF;}
	#menuBtn{background: #D1B2FF;}
	#deleteBtn{background: #D5D5D5;}
	#addReply{background: #B2CCFF;} */
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
							<span aria-hidden="true"><a href="#">
								<i class="large fa fa-angle-double-left"><img
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
							<span class="app-dashboard-sidebar-text"><h3>FAQ</h3></span>
						</a></li>
						<li><a href="">
							<span class="app-dashboard-sidebar-text"><h3>1:1문의</h3></span>
						</a></li>
						<br><br><br>
					</ul>
				</div>
			</div>

			<!-- 본문 영역 -->
			<div class="app-dashboard-body-content off-canvas-content" data-off-canvas-content>
				
				<div class="wrapBaord">
					<br>
					<h2 align="center">1:1문의</h2>
					<h4 align="left">문의 내용</h4>
					<div class="contentArea">
						<form action="<%= request.getContextPath() %>/reqBoardUpdateForm.cs" id="detailForm" method="post">
							<table id="boardArea">
								<thead>
									<tr>
										<th height="20px">제목</th>
										<td colspan="9" height="30px;">
											<%= rb.getReqTitle() %>
											<input type="hidden" name="title" value="<%= rb.getReqTitle() %>">
										</td>
									</tr>
									<tr>
									</tr>
									<tr>
										<th height="50px">분야</th>
										<td>
											<%= rb.getReqCategory() %>
											<input type="hidden" name="category" value="<%= rb.getReqCategory() %>">
										</td>
										<th>작성자</th>
										<td>
											<%= rb.getNickName() %>
											<input type="hidden" name="nickName" value="<%= rb.getNickName() %>">
										</td>
										<th>이메일</th>
										<td>
											<%= rb.getReqWriter() %>
											<input type="hidden" name="email" value="<%= rb.getReqWriter() %>">
										</td>
										<th>작성일</th>
										<td>
											<%= rb.getCreateDate() %>
											<input type="hidden" name="createDate" value="<%= rb.getCreateDate() %>">
										</td>
										<th>수정일</th>
										<td>
											<%= rb.getModifyDate() %>
											<input type="hidden" name="modifyDate" value="<%= rb.getModifyDate() %>">
										</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th colspan="10" height="30px">내용</th>
									</tr>
									<tr>
										<td colspan="10" style="min-height: 250px;">
											<%-- <p><%= rb.getReqContent() %></p> --%>
											<textarea cols="110" rows="15" style="resize:none;"readonly><%= rb.getReqContent() %></textarea>
											<input type="hidden" name="content" value="<%= rb.getReqContent() %>>">
										</td>
									</tr>
								</tbody>

							</table>
							
							<input type="hidden" name="rNo" value="<%= rb.getReqNo() %>">
							
							<div align="center">
							<% if (loginUser != null  && rb.getReqWriter().equals(loginUser.getMemberEmail())) { %>
								<input type="submit" id="updateBtn" value="수정하기" class="btn">
								<input type="button" onclick="deleteBoard();" id="deleteBtn" class="btn" value="삭제">
							<% } %>
								<input type="button" onclick="location.href='<%= request.getContextPath() %>/list.cs'" class="btn" id="listBtn" value="목록으로">
							</div>
						</form>
					</div>
							
				</div>	
			</div>
					<script>
					
						$('#listArea td').mouseenter(function(){
							$(this).parent().css({'text-decoration':'underline', 'cursor':'pointer'})
						}).mouseout(function(){
							$(this).parent().css('text-decoration', 'none');
						}).click(function(){
							var rNo = $(this).parent().children().eq(0).text();
							var userEmail = $(this).parent().children().eq(6).text();
							
							if ('<%= loginUser %>' == 'null') {
								alert('작성자만 열람할 수 있습니다.');
							} else {
								location.href='<%= request.getContextPath() %>/detail.cs?rNo=' + rNo;
							}
						})
						
					</script>				
		</div>
		
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