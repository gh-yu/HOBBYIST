<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="hobbyistClass.model.vo.*, hobbyistClass.model.service.HClassService, java.util.ArrayList"%>
<%
	HClassService hService = new HClassService();
	ArrayList<HClass> classList = hService.selectClassList();
	ArrayList<HClassFile> fileList = null;
	if (classList != null && !classList.isEmpty()) {
		fileList= hService.selectFileList();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainPage</title>
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/mainPage.css">
<style>
	.card-text{font-size: large; text-align: center; font-weight: bold;}
	.class-title{height: 40px;}
</style>
</head>
<body>
	<!-- 상단바 -->
	<%@ include file="../common/mainPageTopbar.jsp" %> 
	
	<!-- 본문 -->
	<main>
		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="3" aria-label="Slide 4"></button>
			</div>

			<div class="carousel-inner">
				<div class="carousel-item active">
					<!-- 배경화면 : svg태그 끝을 알리는 태그 옆에 img태그 삽입 -->
					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<rect width="100%" height="100%" fill="#777" />
						<img src="images/pastel.png"></svg>

					<div class="container">
						<div class="carousel-caption text-end">

							<h1>Example headline.</h1>
							<p>Some representative placeholder content for the first
								slide of the carousel.</p>
							<!-- 검색창 -->
							<form class="d-flex search-class">
								<input class="search-class form-control me-2" type="search"
									placeholder="어떤 클래스를 원하시나요?" aria-label="Search">
								<button class="btn btn-outline-success" type="submit">Search</button>
							</form>
						</div>
					</div>
				</div>

				<div class="carousel-item">

					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<rect width="100%" height="100%" fill="#777" />
						<img src="images/mint.jpg"></svg>

					<div class="container">
						<div class="carousel-caption text-end">
							<h1>Another example headline.</h1>
							<p>Some representative placeholder content for the second
								slide of the carousel.</p>
							<!--  <p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p> -->
							<!-- 검색창 -->
							<form class="d-flex search-class">
								<input class="form-control me-2" type="search"
									placeholder="어떤 클래스를 원하시나요?" aria-label="Search">
								<button class="btn btn-outline-success" type="submit">Search</button>
							</form>
						</div>
					</div>
				</div>
				<div class="carousel-item">

					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<rect width="100%" height="100%" fill="#777" />
						<img src="images/green.jpg"></svg>


					<div class="container">
						<div class="carousel-caption text-end">
							<h1>One more for good measure.</h1>
							<p>Some representative placeholder content for the third
								slide of this carousel.</p>

							<form class="d-flex search-class">
								<input class="search-class form-control me-2 search" type="search"
									placeholder="어떤 클래스를 원하시나요?" aria-label="Search">
								<button class="btn btn-outline-success" type="submit">Search</button>
							</form>
						</div>
					</div>
				</div>
			
			
				<div class="carousel-item">

					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
							preserveAspectRatio="xMidYMid slice" focusable="false">
							<rect width="100%" height="100%" fill="#777" />
							<img src="images/green.jpg"></svg>


					<div class="container">
						<div class="carousel-caption text-end">
							<h1>One more for good measure.</h1>
							<p>Some representative placeholder content for the third
									slide of this carousel.</p>

							<form class="d-flex search-class">
								<input class="search-class form-control me-2 search" type="search"
										placeholder="어떤 클래스를 원하시나요?" aria-label="Search">
								<button class="btn btn-outline-success" type="submit">Search</button>
							</form>
						</div>
					</div>
				</div>
			</div>	
			<button class="carousel-control-prev" type="button"
				data-bs-target="#myCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>


		<!-- Marketing messaging and featurettes
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->
		<div class="container marketing">
			<div class="album py-5 bg-light">
				<div class="container">
					<br><br>
					<div id="classContent" class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<% if (classList == null || classList.isEmpty()) { %>
						<div align="center">
						<h4>클래스 서비스 준비중입니다.</h4>
						</div>
					<% } else { %>
					<% 		for (HClass hc : classList) { %>
							<div class="col">
								<div class="card shadow-sm">
							<% if (fileList == null || fileList.isEmpty()) { %>
											<img src="image/img/success.jpg" class="bd-placeholder-img card-img-top thumbnail" width="100%" height="225" alt="Thumbnail">
							<% } else { %>
								<%	for(HClassFile f : fileList) { %>
								<%		if(hc.getClassNo() == f.getBoardNo()) { %> 
											<img src="<%= request.getContextPath() %>/uploadFiles/<%= f.getChangeName() %>" class="bd-placeholder-img card-img-top thumbnail" width="100%" height="225" alt="Thumbnail">
								<%		} %>
								<% } %>
							<% } %>
									<div class="card-body">
										<p class="card-text class-title"><a href="<%= request.getContextPath() %>/detail.hcl?cNo=<%= hc.getClassNo() %>"><%= hc.getClassName() %></a></p> <%-- 클래스 상세보기(일반) --%>
										<div class="likeBtnArea d-flex justify-content-between align-items-center">
											<small class="text-muted"></small>
											<input type="hidden" class="cNo" name="cNo" value="<%= hc.getClassNo() %>"> 
											<button class="button-like"> 
												<!-- i : 아이콘 태그 -->
												<i class="fa fa-heart">
													<svg xmlns="http://www.w3.org/2000/svg" width="13" height="12" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
	  													<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
													</svg>
												</i>
												<span>Like</span>
											</button>
										</div>
									</div>
								</div>
							</div>	
					<% 		}  %>
					<% }  %>
					<script>
					
						// like-button js
						$(function() {
							// 화면 로드될때 실행되는 함수, window.onload = function(){}과 같음
							// 로그인이 되어 있고, 클래스리스트가 존재하면 실행
							<% if(loginUser != null && classList != null && !classList.isEmpty()) { %>
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
											for(var j in data) {
												var likedCNo = data[j].classNo;
												$('.likeBtnArea').find('input[value=' + likedCNo + ']').next().toggleClass("liked");
											}	
										}
									},
									error: function(data){
										console.log(data);
									}
								});
							<% } %>
						});
						
						$('.button-like').bind('click', function(event) {
							if ('<%= loginUser %>' == 'null') {
								alert('로그인이 필요한 서비스입니다.');
							} else {	
								<% if(loginUser != null) { %>
									$likeBtn = $(this);
									var likeStatus = $(this).attr('class'); // class속성의 값을 저장
									var memberEmail = '<%= loginUser.getMemberEmail() %>';
									var cNo = $(this).prev().val();
									
								   	if (likeStatus.includes('liked')) { // includes() : 해당 string이 포함되어 있으면 true, 아니면 false반환
										// 누른 클래스의 class속성에 'liked'라는 문자열이 포함되어 있으면 true -> 좋아요인 상태일때
										// delete ajax
										$.ajax({
											url: 'deletelike.te',
											data: {memberEmail:memberEmail, likedCNo:cNo},
											type: 'POST',
											success: function(data){
												console.log(data);
												if (data.trim() == '1') {
													$likeBtn.toggleClass("liked");
												}
											},
											error: function(data){
												console.log(data);
											}
										});	
										//$(this).toggleClass("liked"); // ajax실행 success 안쪽에서 toggleClass()실행 
									} else {
										// 좋아요가 아닌 상태일때
										// insert ajax
										$.ajax({
											url: 'insertlike.te',
											data: {memberEmail:memberEmail, cNo:cNo},
											type: 'POST',
											success: function(data){
												console.log(data);
												if (data.trim() == '1') {
													$likeBtn.toggleClass("liked");
												}
											},
											error: function(data){
												console.log(data);
											}
										});											
									}
							   	<% } %>
							}
						});
							
						// 카테고리 선택시 카테고리 별로 보이게 ajax로 select
						// category.click시-> 
						// var category = $(this).attr('name') <- 각 카테고리 name을 카테고리번호로 설정해놓기
						// 이 category를 ajax방식으로 url요청해서 DB의 class_category_no와 같은 걸로 select(where class_category_no = ?)
						// select해 온  list를 클래스 div영역에 넣기 (append 또는 html에 값 넣기)
						$(document).on('click', '.category', function() {
				
 							$.ajax({
								url : 'listByCategory.hcl',
								success : function(data) {
									console.log(data);

									var classList = $('#classList');

								},
								error : function(data) {
									console.log(data);
								} 
							});
						});
					</script>	
					</div>			
				</div>
			</div>
			<!-- /.container -->
		</div>
	</main>
	<hr class="featurette-divider">
	<!-- FOOTER -->
	<footer class="container">
		<p class="float-end">
			<a href="#">Back to top</a>
		</p>
		<p>
			&copy; 2021 HOBBYIST, Inc. &middot; <a href="<%= request.getContextPath() %>/FAQ.bo">Contact</a>
			<!-- &middot; <a href="#">Terms</a> -->
		</p>
	</footer>
	<!-- Bootstrap JS CDN --> <!-- JS CDN은 body 하단에  -->
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
	 		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous">
	 </script>
</body>
</html>