<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, java.util.ArrayList, hobbyistClass.model.vo.*, java.text.DecimalFormat" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	ArrayList<HClass> searchList = (ArrayList)request.getAttribute("searchList");
	String searchWord = (String)request.getAttribute("searchWord"); //? 얘 왜 Object?
	ArrayList<HClassFile> list = (ArrayList)request.getAttribute("list");
	DecimalFormat dc = new DecimalFormat("##,###,###");
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>HOBBYIST</title>

<%@ include file="../common/css.jsp" %>
<script src="js/jquery-3.6.0.min.js"></script>

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
								<li><a href="#" onclick="alert('로그인을 먼저 해주세요.');">LIKED-CLASS</a></li>
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
								<li><a href="#" onclick="alert('로그인을 먼저 해주세요.');">MY INFO</a></li>
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
		<div class="logo_section">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="logo">
							<a href="index.jsp"><img src="assets/images/hlogo.png"
								style="width: 120px"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="header_section">
			<div class="container">
				<div class="containt_main">
					<div id="mySidenav" class="sidenav">
						<a href="" class="closebtn" onclick="">&times;</a>
						<a class="category" id="개발/코딩" href="">Coding</a> <a class="category" id="인테리어" href="">Decoration</a>
						<a class="category" id="요리" href="">Cooking</a> <a class="category" id="악기" href="">Music</a>
						<a class="category" id="건강/헬스" href="">Health</a> <a class="category" id="글쓰기" href="">Writing</a>
						<a class="category" id="사진" href="">Picture</a> <a class="category" id="드로잉" href="">Drawing</a>
						<a class="category" id="영상편집" href="">Making Video</a> <a class="category" id="주식" href="">Stock</a>
						<a class="category" id="사주/타로" href="">Tarot</a>
					</div>
					<span class="toggle_icon" onclick="openNav()"><img
						src="assets/images/toggle-icon.png"></span>		
					<script>
						$('.category').on('click', function(){
							console.log($(this).attr('id'));
							var cateName = $(this).attr('id');
							var queryStr = "<%= request.getContextPath() %>/classListByCate?cate=" + cateName;
							$(this).attr('href',  queryStr);
						});
					</script>		
<!-- 					<span class="toggle_icon" onclick="openNav()"><img -->
<!-- 						src="assets/images/toggle-icon.png"></span> -->
<!-- 					<div class="dropdown"> -->
<!-- 						<button class="btn btn-secondary dropdown-toggle" type="button" -->
<!-- 							id="dropdownMenuButton" data-toggle="dropdown" -->
<!-- 							aria-haspopup="true" aria-expanded="false">카테고리</button> -->
<!-- 						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton"> -->
<!-- 							<a class="dropdown-item" href="#">카테고리별</a> <a -->
<!-- 								class="dropdown-item" href="#">클래스별</a> <a class="dropdown-item" -->
<!-- 								href="#">후기별</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<div class="main">
						<form action = "classSearch.cl" method = "post">
							<div class="input-group">
								<input type="search" class="form-control" name="searchWord" placeholder="<%= request.getAttribute("searchWord") %>">
								<div class="input-group-append">
									<button class="btn btn-secondary" type="submit" style="background-color: #9ed4c2; border-color: #9ed4c2">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="banner_section layout_padding">
			<div class="container">
				<div id="my_slider" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						
						
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 클래스 섹션 1 -->

	<div class="fashion_section">
		<div id="main_slider" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="container">
						<br><br>
						<h1 class="fashion_taital">클래스 검색 결과</h1>
						<div class="fashion_section_2">
							<div class="row">
								<% if (searchList.isEmpty()) { %>
									<div class="tshirt_img">
										<h3>일치하는 클래스가 없습니다😥</h3>
									</div>
								<% } else { %>
										<%	for(int i = 0; i < searchList.size(); i++) { %>
											<div class="col-lg-4 col-sm-4">
												<div class="box_main">
													<h4 class="shirt_text"><%= searchList.get(i).getClassName() %></h4>
														<p class="price_text">
															<span style= "color: #9ED4C2">PRICE_ </span><span style="color: #ff0000;"><%= dc.format(searchList.get(i).getClassFee()) %> 🛒</span> &nbsp;
																<span class="likeBtnArea">
																	<input type="hidden" class="cNo" name="cNo" value="<%= searchList.get(i).getClassNo() %>"> 
																	<button class="button-like button visually-hidden position-absolute top-0 start-100 translate-middle badge"> 
																		<i class="fa fa-heart"></i>
																		<span>Like</span>
																	</button>
																</span>
															</p>
															<br><br>				
												<%	for(int j = 0; j < list.size(); j++) { %>			
												<%		if(searchList.get(i).getClassNo() == list.get(j).getBoardNo()) { %> 
														<div class="thumbnailArea" style="height: 300px; width: 100%;">
																<img style="min-width:100%; height: 100%;" src="<%= request.getContextPath() %>/uploadFiles/<%= list.get(j).getChangeName() %>"
																	class="thumbnail" alt="Thumbnail">
														</div>
												<%		} %>
												<% 	} %>
														<br>	
															<div class="btn_main">
																<div class="buy_bt">
																	<a href="<%= request.getContextPath() %>/detail.hcl?cNo=<%= searchList.get(i).getClassNo() %>">Buy Now</a>
																</div>
																<div class="seemore_bt">
																	<a href="<%= request.getContextPath() %>/detail.hcl?cNo=<%= searchList.get(i).getClassNo() %>">See More</a>
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
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 클래스 섹션 1 -->

	<!-- footer -->
	<div class="footer_section layout_padding">
		<div class="container">
			<div class="footer_logo">
				<a href="index.jsp"><img src="assets/images/hlogo.png"
					style="width: 120px"></a>
			</div>
			<div class="input_bt">
				<input type="text" class="mail_bt" placeholder="Your Email"
					name="Your Email"> <span class="subscribe_bt"
					id="basic-addon2"><a href="#">Subscribe</a></span>
			</div>
			<div class="footer_menu">
				<ul>
					<li><a href="#">Introduction</a></li>
					<li><a href="#">Income</a></li>
					<li><a href="#">Class Application</a></li>
					<li><a href="admin/faq.jsp">FAQ</a></li>
					<li><a href="#">Customer Service</a></li>
				</ul>
			</div>
			<div class="location_main">
				HOBBYIST HOT LINE : <a href="#">+82 2 1234 5678</a>
			</div>
		</div>
	</div>
	<!-- footer section end -->
	<!-- copyright section start -->
	<div class="copyright_section">
		<div class="container">
			<p class="copyright_text">
				© 2021 All Rights Reserved. Design by <a href="index.jsp">HOBBYIST</a>
			</p>
		</div>
	</div>
	
	<!-- Javascript files-->
	<%@ include file="../common/js.jsp"%>
	 
	 <script>  
         function openNav() {
           document.getElementById("mySidenav").style.width = "250px";
         }
         
         function closeNav() {
           document.getElementById("mySidenav").style.width = "0";
         }
                
		// like-button js, ajax
		$(function() {
			// 화면 로드될때 실행되는 함수, window.onload = function(){}과 같음
			// 로그인이 되어 있고, 클래스리스트가 존재하면 실행
			<% if(loginUser != null && !searchList.isEmpty()) { %>
				// memberEmail이 일치하는 likeClassList를 select해와서  
				// classNo와 likeClassList의 classNo랑 일치하면  $(this).toggleClass("liked");
				var memberEmail = '<%= loginUser.getMemberEmail() %>';
				var cNo = $('.cNo');
									
				$.ajax({
					url: 'likeList.te',
					data: {memberEmail:memberEmail},
					type: 'POST',
					success: function(data){
						console.log(data);
						for (var i in cNo) {
							var likedCNo = data[i].classNo;
							$('.likeBtnArea').find('input[value=' + likedCNo + ']').next().toggleClass("liked");
														
						}
					},
					error: function(data){
						console.log(data);
					}
				});
			<% } %>
		});
							
		$('.button-like').bind('click', function(event) {
			if ('<%=loginUser%>' == 'null') {
					alert('로그인이 필요한 서비스입니다.');
			} else {
				<%if (loginUser != null) {%>
				$likeBtn = $(this);
				var likeStatus = $(this).attr('class'); // class속성의 값을 저장
				var memberEmail = '<%=loginUser.getMemberEmail()%>';
				var cNo = $(this).prev().val();

				if (likeStatus.includes('liked')) { // includes() : 해당 string이 포함되어 있으면 true, 아니면 false반환
					// 누른 클래스의 class속성에 'liked'라는 문자열이 포함되어 있으면 true -> 좋아요인 상태일때
					// delete ajax
					$.ajax({
						url : 'deletelike.te',
						data : {memberEmail : memberEmail, likedCNo : cNo},
						type : 'POST',
						success : function(data) {
							console.log(data);
							if (data.trim() == '1') {
								$likeBtn.toggleClass("liked");
							}
						},
						error : function(data) {
							console.log(data);
						}
					});
				} else {
					// 좋아요가 아닌 상태일때
					// insert ajax
					$.ajax({
						url : 'insertlike.te',
						data : {memberEmail : memberEmail, cNo : cNo},
						type : 'POST',
						success : function(data) {
							console.log(data);
							if (data.trim() == '1') {
								$likeBtn.toggleClass("liked");
							}
						},
						error : function(data) {
							console.log(data);
						}
					});
				}
			<% } %>
			}
		});

      </script>
	 
</body>
</html>