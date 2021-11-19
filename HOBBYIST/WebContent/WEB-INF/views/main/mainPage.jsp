<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="hobbyistClass.model.vo.*, hobbyistClass.model.service.HClassService, java.util.ArrayList"%>
<%
	ArrayList<HClass> list = new HClassService().selectClassList();
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
	.class-title{height: 50px;}
</style>
</head>
<body>
	<!-- 상단바 소스코드 include -->
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

					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">  <%-- 156~246줄까지 클래스 영역 틀, 껍데기로 나중에 지울 영역 --%>
						<div class="col"> 
							<div class="card shadow-sm">
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="225" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
									<title>Placeholder</title><rect width="100%" height="100%"
										fill="#55595c" />
									<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

								<div class="card-body">
									<p class="card-text">This is a wider card with supporting
										text below as a natural lead-in to additional content. This
										content is a little bit longer.</p>
									<div class="d-flex justify-content-between align-items-center">
										<small class="text-muted">조회수</small>
										<button class="button-like"> 
											<!-- i : 아이콘 태그 -->
											<i class="fa fa-heart">
												<svg xmlns="http://www.w3.org/2000/svg" width="13" height="12" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
  													<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
												</svg>
											</i>
											<span>Like</span>
										</button>
										<!-- </div> -->
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card shadow-sm">
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="225" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
									<title>Placeholder</title><rect width="100%" height="100%"
										fill="#55595c" />
									<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

								<div class="card-body">
									<p class="card-text">This is a wider card with supporting
										text below as a natural lead-in to additional content. This
										content is a little bit longer.</p>
									<div class="d-flex justify-content-between align-items-center">
										<small class="text-muted">조회수</small>
										<button class="button-like"> 
											<!-- i : 아이콘 태그 -->
											<i class="fa fa-heart">
												<svg xmlns="http://www.w3.org/2000/svg" width="13" height="12" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
  													<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
												</svg>
											</i>
											<span>Like</span>
										</button>
										<!-- </div> -->
										
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card shadow-sm">
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="225" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
									<title>Placeholder</title><rect width="100%" height="100%"
										fill="#55595c" />
									<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

								<div class="card-body">
									<p class="card-text">This is a wider card with supporting
										text below as a natural lead-in to additional content. This
										content is a little bit longer.</p>
									<div class="d-flex justify-content-between align-items-center">
										<small class="text-muted">조회수</small>	
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
					</div> 	<!-- 여기까지 지울 영역 -->	
					
					<br><br>
					<div id="classContent" class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<% if (list.isEmpty()) { %>
					<div align="center">
						<h4>클래스 서비스 준비중입니다.</h4>
					</div>
					<% } else { %>
						<% for (HClass hc : list) { %>
						<div class="col">
							<div class="card shadow-sm">
								<img id="thumbnail" src="" class="bd-placeholder-img card-img-top" width="100%" height="225" alt="Thumbnail">
								<div class="card-body">
									<p class="card-text class-title"><%= hc.getClassName() %></p>
									<div class="d-flex justify-content-between align-items-center">
										<%-- <small id="views" class="text-muted"></small>	--%>
										<button id="likeBtn" class="button-like"> 
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
	<!-- 					<div class="col">
							<div class="card shadow-sm">
								<img id="thumbnail" src="" class="bd-placeholder-img card-img-top" width="100%" height="225" alt="Thumbnail">
								<div class="card-body">
									<p class="card-text class-title" >코딩 너도 할 수 있어</p>
									<div class="d-flex justify-content-between align-items-center">
										<small id="views" class="text-muted">조회수</small>	
										<button id="likeBtn" class="button-like"> 
											i : 아이콘 태그
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
						<div class="col">
							<div class="card shadow-sm">
								<img id="thumbnail" src="" class="bd-placeholder-img card-img-top" width="100%" height="225" alt="Thumbnail">
								<div class="card-body">
									<p class="card-text class-title" >코딩 너도 할 수 있어</p>
									<div class="d-flex justify-content-between align-items-center">
										<small id="views" class="text-muted">조회수</small>	
										<button id="likeBtn" class="button-like"> 
											i : 아이콘 태그
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
					</div>					 -->
					<script>
							$(function() {
								// 좋아요수 기준으로 select해온 classList 보여주기
								
								
								
							});
											
							// 카테고리 선택시 카테고리 별로 보이게 ajax로 select
							// category.click시-> 
							// var category = $(this).attr('name') <- 각 카테고리 name을 카테고리번호로 설정해놓기
							// 이 category를 ajax방식으로 url요청해서 DB의 class_category_no와 같은 걸로 select(where class_category_no = ?)
							// select해 온  list를 클래스 div영역에 넣기 (append 또는 html에 값 넣기)
							$(document).on('click', '.category', function(){
								
								$.ajax({
									url: 'list.hcl',
									success: function(data){
										console.log(data);
										
										var classList = $('#classList');
										
									},
									error: function(data){
										console.log(data);
									}
								});			
							});
											
							// like-button js
							$(function() {
								// 화면 로드될때 실행되는 함수, window.onload = function(){}과 같음
								// like_class테이블애서 select count(*)해오는 ajax함수 써서 
								// 멤버이메일과 클래스번호가 like_class테이블에 존재하면 $(this).toggleClass("liked");
								
								$('.button-like').bind('click', function(event) {
									if ('<%= loginUser %>' == 'null') {
										alert('로그인이 필요한 서비스입니다.');
									} else {	
										var likeClass = $(this).attr('class'); // class속성의 값을 저장
								    	if (likeClass.includes('liked')) { // includes() : 해당 string이 포함되어 있으면 true, 아니면 false반환
											// 누른 클래스의 class속성에 'liked'라는 문자열이 포함되어 있으면 true -> 좋아요인 상태일때
											// delete ajax
															
											$(this).toggleClass("liked"); // ajax실행 success 안쪽에서 toggleClass()실행 
										} else {
											// 좋아요가 아닌 상태일때
											// insert ajax
											$(this).toggleClass("liked"); // ajax실행 success 안쪽에서 toggleClass()실행 
										}
									}
									
									
								});
													
							});
						</script>		
				</div>
			</div>
			<!-- /.container -->

			<hr class="featurette-divider">
			<!-- FOOTER -->
			<footer class="container">
				<p class="float-end">
					<a href="#">Back to top</a>
				</p>
				<p>
					&copy; 2021 HOBBYIST, Inc. &middot; <a href="<%= request.getContextPath() %>/contact.co">Contact</a>
					<!-- &middot; <a href="#">Terms</a> -->
				</p>
			</footer>
		</div>
	</main>
	
	<!-- Bootstrap JS CDN --> <!-- JS CDN은 body 하단에  -->
 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>