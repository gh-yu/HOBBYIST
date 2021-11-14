<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/menubar.css">
<script src="js/menubar.js"></script>
<style>

/* 	.outer{
		width: 800px; height: 500px; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	} */
	#listArea{border-top: 2px solid gray; text-align: center; font-size: small; border-bottom: 1px solid lightgray;}
	.tableArea{width:650px;	height:350px; margin-right: auto; margin-left: auto;}
	thead{}
	tbody{}	
	#writeBoard{background: #B0C4DE; font-weight: bold; color: white; border: none; cursor: pointer; margin-left: 67%; margin-bottom: 15px; width: 100px; height: 40px; box-shadow: 1px 1px 2px lightgray;}
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
				
				<div class="outer">
					<br>
					<h2 align="center">1:1문의</h2>
					<button id="writeBoard" onclick="">문의하기</button>
					<div class="tableArea">
						<table id="listArea">
							<thead>
								<tr>	
									<th width="100px">NO</th>
									<th width="100px">분류</th>
									<th width="500px">제목</th>
									<th width="200px">답변상태</th>
									<th width="100px">작성자</th>
									<th width="150px">작성일</th>
								</tr>
							 </thead>
							 <tbody>
							 	<tr>
							 		<td colspan="6">조회된 글이 없습니다.</td>
							 	</tr>
<%-- 							<% if (list.isEmpty()) { %>
							<tr>
								<td colspan="6">조회된 리스트가 없습니다.</td>
							</tr>
							<% } else { %>
							<% 		for(Board b : list) { %>
							<tr>	
								<td><%= b.getBoardId() %></td>
								<td><%= b.getCategory() %></td>
								<td><%= b.getBoardTitle() %></td>
								<td><%= b.getNickName() %></td>
								<td><%= b.getBoardCount() %></td>
								<td><%= b.getCreateDate() %></td>
							</tr>	
							<% 		} %>
							<% } %> --%>							 
							 </tbody>

						</table>
					</div>
					
					<div class="pagingArea" align="center">
					

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
					&copy; 2021 HOBBYIST, Inc. &middot; <a href="#">Contact</a>
					<!-- &middot; <a href="#">Terms</a> -->
				</p>
			</footer> 
	</div>
</body>
</html>