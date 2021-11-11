<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	// 클래스에 대한 정보(ArryaList에 담아서 request에 저장한거) 가져오기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>class detail page</title>
<link rel="stylesheet" href="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
<link rel="stylesheet" href="css/classDetail.css">
<script src="js/jquery-3.6.0.min.js"></script>
<!-- datePicker -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<style>
	.app-dashboard-top-nav-bar{
		position: relative;
	}
	
/* 	 .top-bar-right {
	  	position: absolute;
	 	right: 1%;
	 } */
	
	.app-dashboard-top-nav-bar .menu-icon {
		vertical-align: text-bottom;
		position: relative; /* 버튼 왼쪽에 붙이기 위해 추가 */ */
		text-align: right; /* 상단바의 메뉴 아이콘 오른쪽으로 정렬 */
	}
	
 	.app-dashboard-logo {
		color: #fefefe;
		text-transform: uppercase;
		font-weight: bold;
		margin-bottom: 15px; /* 메인페이지의 상단바의 로고 위치와 맞춤 */
		margin-top: 9px;
	}
	
/* 	#logo{
		position: absolute;
		margin-left: 100px;
		margin-top: 217px;
		width: 300px;
		height: 300px;
	}
	
	#logo-a img{
		height: 55px;
	} */
	
/* 	#menuDiv {
		width: 283px;
	} */

	/* CDN에 설정되어 있는 columns 스타일 해제 위해 columns 클래스명 옆에 임의 클래스명을 띄어쓰기 해서 주고, 설정 바꿈, f12에서 해당 태그의 설정 확인 가능*/
	.topbar:last-child{
	    float: left;
	}
	
	.topbar{
	   width: 290px;
	}
	
</style>
</head>
<body>
	<div class="app-dashboard shrink-medium">
	
		<%@ include file="../common/topbar.jsp" %>
		
		<div class="app-dashboard-body off-canvas-wrapper">

			<!-- 본문 내용 -->
			<div class="row" style="margin-top: 50px;">
				<div class="large-8 columns"
					style="border-right: 1px solid #E3E5E8;">

					<article>

						<div id="classTitle" class="column">
							<p>
								<img src="images/drawing.png" id="classThumbnail"
									alt="image for article" alt="article preview image">
							</p>
							
							<button class="button button-like">
								<i class="fa fa-heart">❤</i>
								<!-- i : 아이콘 태그 -->
								<span>Like</span>
							</button>
							<span style="font-size: xx-large; font-weight: bold;">[Live]</span>
							&nbsp;&nbsp; 
							<span style="font-size: xx-large; font-weight: bold;">아이패드로 그리는 꽃그림</span>

							<script>
								// like-button
								$(function() {
									$('.button-like').bind('click',
											function(event) {
												$(this).toggleClass("liked");
											});
								});
							</script>
						</div>

						<hr>

						<div  id="classContent" class="column">

							<h5 style="font-weight: bold;">클래스 소개</h5>
							<p>samplesample samplesamplesamplesample
								samplesamplesamplesamplesample samplesamplesamplesamplesample
								samplesamplesamplesamplesample
								samplesasamplesamplesamplesamplesample
								samplesamplesamplesamplesamplesamsamplesample</p>
						</div>


						<hr>

						<div id="classImg" class="column">
							<h5 style="font-weight: bold;">소개 사진</h5>
<!-- 							<p>
								<img src="../../images/pastel.png" alt="image for article"
									alt="article preview image">
							</p> -->

							<div id="wrapper">
								<div id="slider-wrap">
									<ul id="slider">
										<li>
											<img src="images/pastel.png">
										</li>

										<li>
											<img src="https://fakeimg.pl/350x200/D27328/000?text=22222">
										</li>

										<li>
											<img src="https://fakeimg.pl/350x200/FF607F/000?text=33333">
										</li>

										<li>
											<img src="https://fakeimg.pl/350x200/0A6E0A/000?text=44444">
										</li>

										<li>
											<img src="https://fakeimg.pl/350x200/0064CD/000?text=55555">
										</li>


									</ul>

									<!--controls-->
									<div class="btns" id="next">
										<i class="fa fa-arrow-right"></i>
									</div>
									<div class="btns" id="previous">
										<i class="fa fa-arrow-left"></i>
									</div>
									<div id="counter"></div>

									<div id="pagination-wrap">
										<ul>
										</ul>
									</div>
									<!--controls-->

								</div>

							</div>

						</div>
		
						<hr>

						<div id="classReview" class="column">
							<h5 style="font-weight: bold;">후기</h5> <!--4개 정도만 보여주고 더보기 클릭하면 후기 페이지로 이동 -> 해당 후기 페이지에서 페이징 처리 -->
							<div>
								<div class="review-section">
									<h5>첫 수강 후기입니다</h5>
									<img class="review" src="images/drawing.png">

									<div class="news-card-date">Sunday, 16th April</div>
									<p class="news-card-description">Lorem ipsum dolor sit
										amet, consectetur adipisicing elit. Recusandae facere, ipsam
										quae sit, eaque perferendis commodi!...</p>
								</div>

								<div class="review-section">
									<h5>두 번째 후기입니다</h5>
									<img class="review" src="images/drawing.png">

									<div class="news-card-date">Sunday, 16th April</div>
									<p class="news-card-description">Lorem ipsum dolor sit
										amet, consectetur adipisicing elit. Recusandae facere, ipsam
										quae sit, eaque perferendis commodi!...</p>
								</div>

								<div class="review-section">
									<h5>세 번째 후기입니다</h5>
									<img class="review" src="images/drawing.png">

									<div class="news-card-date">Sunday, 16th April</div>
									<p class="news-card-description">Lorem ipsum dolor sit
										amet, consectetur adipisicing elit. Recusandae facere, ipsam
										quae sit, eaque perferendis commodi!...</p>
								</div>
							</div>


							<!-- 
					<ul class="pagination" role="navigation" aria-label="Pagination">
						<li class="disabled">Previous <span class="show-for-sr">page</span></li>
						<li class="current"><span class="show-for-sr">You're
								on page</span> 1</li>
						<li><a href="#" aria-label="Page 2">2</a></li>
						<li><a href="#" aria-label="Page 3">3</a></li>
						<li><a href="#" aria-label="Page 4">4</a></li>
						<li><a href="#" aria-label="Next page">Next <span
								class="show-for-sr">page</span></a></li>
					</ul> -->
						</div>
					</article>

				</div>


				<!-- 왼쪽 영역  -->
				<div class="large-4 columns">

					<aside>


						<div class="tutor-profile">
							<img src="images/tutor_profile.jpg" id="profile-img">
							<br>
							안녕하세요
							<p><span>그림공방(sample)</span>입니다</p>
							<p>
								sample튜터가 자기소개sample
								samplesamplesamplesam plesamplesampledfasdfdfa
								samplesamplesample
							</p>
							<hr style="background: white; height: 1px;">
							<div id="class-info">
								<p> 소요시간 : <span>2(sample)</span>시간<br></p>
								<p><span>1(sample)</span>~<span>8(sample)</span>명(최소인원 <span>1(sample)</span>명)</p>
							</div>
						</div>
				

						<br>

						<div class="apply-class">
							<b>클래스 신청</b><br><br>
							<form action="">
								<p>수강을 원하시는 날짜를 선택해주세요(최대 1개 선택)</p>
								<p>수강날짜 선택 <input type="text" id="datepicker" name="date"></p>
								<br>
								<p>시간 선택
									<select>
										<option>18:00(sample)</option>
									</select>
								</p>
								<br>
								<div id="price">
									<span>50,000(sample)</span>원
									<br><br><br>
									<input type="submit" id="btnSub" value="신청하기">
								</div>
								<br>
								
							</form>

						</div>
					</aside>

				</div>
			</div>

			<footer> </footer>

			<!-- 	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
			<script
				src="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
			<script>
				$(document).foundation();
			</script>
 -->
		
		</div>
	</div>
<script>
 	/* datepicker 관련 css */
	$.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd',
		prevText : '이전 달',
		nextText : '다음 달',
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ],
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ],
		dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		showMonthAfterYear : true,
		yearSuffix : '년',
		buttonImageOnly : true,
		changeMonth : true,
		changeYear : true,

		minDate : '0', // 0 넣으면 오늘날짜부터 선택할 수 있음
		maxDate : new Date('2021-12-1'), // 특정날짜 이후는 선택 못하게/ 기간 선택 범위 제한/ 클래스 종료일자 date를 불러와서 변수에다 값 담아 여기다 넣기
		showButtonPanel : true,
		currentText : '오늘 날짜',
		closeText : '닫기',
		showAnim : "slide",

		beforeShowDay : onlyMonday, // 요일 선택 제한, 값으로 함수를 넣었음
		regional : "ko", // 지역

	});

	function onlyMonday(date) { // 리턴한 요일만 선택되게 하는 함수
		var day = date.getDay();
		// return [(day == 1), '']; // day == 1 월요일만 
		// return [(day != 0 && day != 1 && day != 3)]; // 특정 요일 제한 -> 일,월,수만 선택 안하기
		return [ (day == 0 || day == 1 || day == 3) ]; // 여러 요일 선택 -> 일, 월, 수 만

		// DB에서 클래스별 가능한 요일 불러오고, 그 요일 전부  return[(day == 가능요일1 || day == 가능요일2];에 넣기 
		// 요일 DB에 저장될때 switch로 월은 1 화는 2 .. 일은 0 이런 식으로 클래스 별 요일 테이블에 저장되게 하기
	};

	$(function() {

		$("#datepicker").datepicker();

	});

	$(document).ready(function() {

		var dt = new Date()

	});
</script>
<script>
	/* img slide */
	//current position
	var pos = 0;
	//number of slides
	var totalSlides = $('#slider-wrap ul li').length;
	//get the slide width
	var sliderWidth = $('#slider-wrap').width();
	
	
	$(document).ready(function(){
	  
	  
	  /*****************
	   BUILD THE SLIDER
	  *****************/
	  //set width to be 'x' times the number of slides
	  $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
	  
	    //next slide  
	  $('#next').click(function(){
	    slideRight();
	  });
	  
	  //previous slide
	  $('#previous').click(function(){
	    slideLeft();
	  });
	  
	  
	  
	  /*************************
	   //*> OPTIONAL SETTINGS
	  ************************/
	  //automatic slider
	  // var autoSlider = setInterval(slideRight, 3000); // 자동으로 안 넘어가게
	  
	  //for each slide 
	  $.each($('#slider-wrap ul li'), function() { 
	
	     //create a pagination
	     var li = document.createElement('li');
	     $('#pagination-wrap ul').append(li);    
	  });
	  
	  //counter
	  countSlides();
	  
	  //pagination
	  pagination();
	  
	  //hide/show controls/btns when hover
	  //pause automatic slide when hover
	  $('#slider-wrap').hover(
	    function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
	    function(){ $(this).removeClass('active'); /* autoSlider = setInterval(slideRight, 3000); */ }
	  );
	  
	  
	
	});//DOCUMENT READY
	  
	
	
	/***********
	 SLIDE LEFT
	************/
	function slideLeft(){
	  pos--;
	  if(pos==-1){ pos = totalSlides-1; }
	  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));  
	  
	  //*> optional
	  countSlides();
	  pagination();
	}
	
	
	/************
	 SLIDE RIGHT
	*************/
	function slideRight(){
	  pos++;
	  if(pos==totalSlides){ pos = 0; }
	  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
	  
	  //*> optional 
	  countSlides();
	  pagination();
	}
	
	
	
	  
	/************************
	 //*> OPTIONAL SETTINGS
	************************/
	function countSlides(){
	  $('#counter').html(pos+1 + ' / ' + totalSlides);
	}
	
	function pagination(){
	  $('#pagination-wrap ul li').removeClass('active');
	  $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
	}
</script>
</body>
</html>