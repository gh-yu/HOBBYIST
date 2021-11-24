<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="us">
<head>

<title>HOBBYIST</title>
<%@ include file="../common/css.jsp" %>
</head>
<body>
	<!-- 상단 메뉴 -->
	<div class="banner_bg_main">
		<!-- header top section start -->
		<div class="container">
			<div class="header_section_top">
				<div class="row">
					<div class="col-sm-12">
						<div class="custom_menu">
							<ul>
								<li><a href="mainPage.jsp">MAIN</a></li>
								<li></li>
								<li><a href="../tutee/likedClass.jsp">LIKED CLASS</a></li>
								<li></li>
								<li><a href="../member/loginPage.jsp">LOG-IN</a></li>
								<li></li>
								<li><a href="../member/myInfo.jsp">MY INFO</a></li>
								<li></li>
								<li><a href="../admin/faq.jsp">FAQ</a></li>
							</ul>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 메인 화면 -->
	<div class="row justify-content-md-center">
		<div class="col-md-10">
			<div class="content">
				<div class="container-fluid">
					<h4 class="page-title"></h4>
					<h4 class="page-title">CLASS DETAIL</h4>
					<hr>
					<div id="carouselExampleSlidesOnly" class="carousel slide"
						data-bs-ride="carousel">
						<div class="row">
							<div class="col-md-8">
								<!-- 클래스 이미지 영역 -->
								<div class="carousel-inner" style="height: 500px">
									<div class="carousel-item active">
										<img src="../../assets/images/camera.jpg" class="d-block w-100"
											style="object-fit: cover">
									</div>
									<div class="carousel-item">
										<img src="../../assets/images/camera3.jpg" class="d-block w-100"
											style="object-fit: cover">
									</div>
									<div class="carousel-item">
										<img src="../../assets/images/camera4.jpg" class="d-block w-100"
											style="object-fit: cover">
									</div>
								</div>
								<br>
								<!-- 화면 영역 -->
								
								<!-- 좋아요 버튼 기능 -->
								<button class="button button-like">
									<i class="fa fa-heart"></i><span>Like</span>
								</button>
								
								<!-- 클래스 소개 -->
								<span style="font-size: x-large;"> &nbsp;카메라 초보자의 DSLR 기능
									제대로 배우기</span>
								<hr>
								<div style="border: 1px solid #d9d9d9; padding: 10px">
									Lorem ipsum dolor sit amet consectetur adipisicing elit.
									Repellat voluptas eaque fugiat sunt quas beatae accusantium
									labore vitae dolorem, itaque aliquam a tempora ea aspernatur
									quidem? Minima sint vel sunt repellendus vero inventore odit
									optio nostrum voluptates in? Magnam delectus ratione laudantium
									est repellat aliquid doloribus, suscipit laboriosam, corrupti
									sapiente earum in accusantium sequi hic obcaecati provident
									tenetur! Dolorum, dolore ex? Voluptatem debitis labore
									dignissimos numquam molestiae veniam amet voluptates
									exercitationem explicabo rem hic, ipsum voluptas sequi,
									mollitia repellendus maxime laborum, nesciunt natus. Impedit
									sapiente fugiat atque error? Expedita distinctio ipsam neque
									beatae dolorem in excepturi fugit porro, labore voluptatibus? ipsum voluptas sequi,
									mollitia repellendus maxime laborum, nesciunt natus. Impedit
									sapiente fugiat atque error? Expedita distinctio ipsam neque
									beatae dolorem in excepturi fugit porro, labore voluptatibus?</div>
							</div>
							
							
							<!-- 사이드 / 클래스 소개 -->
							<div class="col-md-4">
								<div class="card">
									<div class="card-header">
										<div class="card-title">[LIVE] 카메라 초보자의 DSLR 기능 제대로 배우기</div>
									</div>
									<div class="card-body">
										<h6 class="card-subtitle mb-2 text-muted">김튜터의 DSLR</h6>
										<p class="card-text">
											안녕하세요. DSLR을 제대로 파헤쳐보는 클래스입니다. <br> <br> 대포 카메라 10년
											경력의 김튜터가 제대로 알려드립니다! <br>이제 멋진 포토그래퍼가 되어보세요!
										</p>

										<div class="notif-icon notif-danger">
											<i class="la la-facebook"></i> <a href="#" class="card-link">Facebook</a>&nbsp;
											<i class="la la-twitter"></i> <a href="#" class="card-link">Twitter</a>&nbsp;
											<i class="la la-instagram"></i> <a href="#" class="card-link">Instagram</a>&nbsp;
											<i class="la la-youtube"></i> <a href="#" class="card-link">Youtube</a>&nbsp;
										</div>
										<hr>
									</div>
								
									<div class="card-body">
										<h6 class="card-subtitle mb-2 text-muted">
											총 강의 시간: <span>30</span> 시간
										</h6>
										<h6 class="card-subtitle mb-2 text-muted">
											수강생 현황: <span style="color: red">3</span>/<span>10</span>(명)
										</h6>
										<br>

									</div>
								</div>
								<!-- 사이드 / 클래스 신청 -->
								<div class="card">
									<div class="card-header">
										<div class="card-title">클래스 신청하기</div>
									</div>
									<div class="form-group">
										<label for="exampleFormControlSelect1">클래스 일정 &nbsp;</label> <input
											type="text" id="datepicker" name="date"><small
											id="imageHelp" class="form-text text-muted">수강을 원하시는
											날짜를 선택해주세요(최대 1개)</small> <br> <label
											for="exampleFormControlSelect1">강의 시간 선택 &nbsp;</label> <select>
											<option>18:00(sample)</option>
										</select> <small id="imageHelp" class="form-text text-muted">수강을
											원하시는 시간을 선택해주세요(최대 1개)</small> <br>
										<label for="exampleFormControlSelect1">수강료 &nbsp;</label> <input
											type="text" class="form-control col-md-5" id="disableinput"
											placeholder="70,000원" disabled> <small id="imageHelp"
											class="form-text text-muted">수강료는 이미 책정된 내역으로 변경할 수
											없습니다.</small>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<!-- 클래스 리뷰 영역 -->
	<div class="row justify-content-center">
		<div class="col-md-10">
			<div class="card">
				<div class="card-header">
					<div class="card-title">CLASS REVIEW</div>
				</div>
				<div class="card-body">
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<div class="swiper-slide"
								style="background-image: url(../assets/images/baking.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(../assets/images/baking2.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(../../assets/images/camera.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(../assets/images/camera3.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(../assets/images/camera4.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(../assets/images/florist.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(../assets/images/florist2.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(../assets/images/florist3.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(../assets/images/florist4.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(../assets/images/painting.jpg)"></div>
						</div>
						<!-- Add Pagination -->
						<div class="swiper-pagination"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="../common/js.jsp" %>
<script src="../../assets/js/swiper.js"></script>
<script>

var swiper = new Swiper('.swiper-container', {
    effect: 'coverflow',
    grabCursor: true,
    centeredSlides: true,
    slidesPerView: 'auto',
    coverflowEffect: {
      rotate: 50,
      stretch: 0,
      depth: 100,
      modifier: 1,
      slideShadows : true,
    },
    pagination: {
      el: '.swiper-pagination',
    },
  });

</script>
</body>
</html>