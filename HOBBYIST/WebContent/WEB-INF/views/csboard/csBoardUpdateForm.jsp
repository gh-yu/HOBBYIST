<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="csBoard.model.vo.*, java.util.ArrayList" %>
<%
	RequestBoard rb = (RequestBoard)request.getAttribute("board");
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
	#boardArea{border-top: 2px solid gray; text-align: left; font-size: small; border-collapse: collapse; font-size: small; min-width: 800px; min-height: 350px;}
	th{font-size: medium;}
	.btn{font-weight: bold; color: white; border: none; cursor: pointer; width: 100px; height: 40px; box-shadow: 1px 1px 2px lightgray;}
	#writeBtn{background: #B0C4DE;}
	#listBtn{background: lightgray;}
	button:hover{cursor: pointer;}
	table{align: center;}
	
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
						<li><a href="<%= request.getContextPath() %>/list.cs">
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
						<form action="<%= request.getContextPath() %>/updateBoard.cs" id="detailForm" method="post" onsubmit="return validate();">
							<table id="boardArea">
								<thead>
									<tr>
										<th height="20px">제목</th>
										<td colspan="9" height="30px;">
											<input type="text" id="title" name="title" value="<%= rb.getReqTitle() %>" required style="width: 98%;">
										</td>
									</tr>
									<tr>
									</tr>
									<tr>
										<th height="50px">분야</th>
										<td>
											<select name="category">
												<option class="cate" value="계정">계정</option>
												<option class="cate" value="수강">수강</option>
												<option class="cate" value="서비스">서비스</option>
												<option class="cate" value="기타">기타</option>
											</select>
										</td>
 										<th>작성자</th>
										<td>
											<%= loginUser.getMemberNickName() %>
										</td>
										<th>이메일*</th>
										<td>
											<input type="email" name="contactEmail" value="<%= rb.getContactEmail() %>" required>
										</td>
										<th>작성일</th>
										<td>
											<%= rb.getCreateDate() %>
										</td>
										<th>수정일</th>
										<td>
											<%= rb.getModifyDate() %>
										</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th colspan="10" height="30px">내용</th>
									</tr>
									<tr>
										<td colspan="10" style="min-height: 250px;">
											<textarea id="content" name="content" cols="120" rows="15" style="resize:none;" required><%= rb.getReqContent() %></textarea>
										</td>
									</tr>
								</tbody>
	
							</table>
							
							<input type="hidden" name="rNo" value="<%= rb.getReqNo() %>"> <%-- 게시글 update위해 글번호 type=hidden인 input태그의 value로 두기--%>
							
							<div align="center">
								<input type="submit" class="btn" id="writeBtn" value="작성완료">
								<input type="button" onclick="location.href='<%= request.getContextPath() %>/list.cs'" class="btn" id="listBtn" value="목록으로">
							</div>
						</form>
						<script>
							// DB의 카테고리로 선택되어 있게 함
							window.onload = function() {
								var inputCate = document.getElementsByClassName('cate');
								var category = '<%= rb.getReqCategory() %>';
								
								for (var i in inputCate) {
									if (inputCate[i].value == category) {
										inputCate[i].selected = 'selected';
									}
								}
							}
							
							function validate(){
								if ($('#title').val().trim() == '') {
									alert('제목을 입력해주세요.');
									return false;
								} else if ($('#content').val().trim() == '') {
									alert('내용을 입력해주세요.');
									return false;
								} else {
									return true;
								}
							}
							
						</script>
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