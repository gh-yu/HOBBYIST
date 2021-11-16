<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainPage</title>
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/mainPage.css">
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

					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
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
											<%-- 보여줄때, loginUser가 != null이면  LIKE_CLASS select count해와서 있으면 빨간색으로 표시/아니면 흰색,  흰색일대 누르면 LIKE_CLASS에 INSERT하고 다시 이 페이지로 돌아옴, 빨간색일때 누르면 delete 다시 이 페이지로 돌아옴--%>
											<% if (loginUser != null) { %>
											<button class="button-like"> 
												<!-- i : 아이콘 태그 -->
												<i class="fa fa-heart">
													<svg xmlns="http://www.w3.org/2000/svg" width="13" height="12" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
  														<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
													</svg>
												</i>
												<span>Like</span>
											</button>											
											<% } else {  %>
											<button class="button-like" disabled onclick="alert('로그인을 먼저 해주세요')"> 
												<!-- i : 아이콘 태그 -->
												<i class="fa fa-heart">
													<svg xmlns="http://www.w3.org/2000/svg" width="13" height="12" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
  														<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
													</svg>
												</i>
												<span>Like</span>
											</button>													
											<% } %>
											<script>
												// like-button js
												$(function() {
													$('.button-like').bind('click',
															function(event) {
																$(this).toggleClass("liked");
															});
												});
											</script>
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
										
											<%-- 보여줄때, loginUser가 != null이면  LIKE_CLASS select count해와서 있으면 빨간색으로 표시/아니면 흰색,  흰색일대 누르면 LIKE_CLASS에 INSERT하고 다시 이 페이지로 돌아옴, 빨간색일때 누르면 delete 다시 이 페이지로 돌아옴--%>
											<% if (loginUser != null) { %>
											<button class="button-like"> 
												<!-- i : 아이콘 태그 -->
												<i class="fa fa-heart">
													<svg xmlns="http://www.w3.org/2000/svg" width="13" height="12" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
  														<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
													</svg>
												</i>
												<span>Like</span>
											</button>											
											<% } else {  %>
											<button class="button-like" disabled onclick="alert('을 먼저 해주세요')"> 
												<!-- i : 아이콘 태그 -->
												<i class="fa fa-heart">
													<svg xmlns="http://www.w3.org/2000/svg" width="13" height="12" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
  														<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
													</svg>
												</i>
												<span>Like</span>
											</button>													
											<% } %>
											<script>
												// like-button js
												$(function() {
													$('.button-like').bind('click',
															function(event) {
																$(this).toggleClass("liked");
															});
												});
											</script>
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
											
											<%-- 보여줄때, loginUser가 != null이면  LIKE_CLASS select count해와서 있으면 빨간색으로 표시/아니면 흰색,  흰색일대 누르면 LIKE_CLASS에 INSERT하고 다시 이 페이지로 돌아옴, 빨간색일때 누르면 delete 다시 이 페이지로 돌아옴--%>
											<% if (loginUser != null) { %>
											<button class="button-like"> 
												<!-- i : 아이콘 태그 -->
												<i class="fa fa-heart">
													<svg xmlns="http://www.w3.org/2000/svg" width="13" height="12" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
  														<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
													</svg>
												</i>
												<span>Like</span>
											</button>											
											<% } else {  %>
											<button class="button-like" disabled onclick="alert('을 먼저 해주세요')"> 
												<!-- i : 아이콘 태그 -->
												<i class="fa fa-heart">
													<svg xmlns="http://www.w3.org/2000/svg" width="13" height="12" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
  														<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
													</svg>
												</i>
												<span>Like</span>
											</button>													
											<% } %>
											<script>
												// like-button js
												$(function() {
													$('.button-like').bind('click',
															function(event) {
																$(this).toggleClass("liked");
															});
												});
											</script>
										<!-- </div> -->

									</div>
								</div>
							</div>

						</div>

					</div>
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