<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, classNotice.model.vo.*, member.model.vo.Member"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
ArrayList<ClassNotice> list = (ArrayList) request.getAttribute("list");

/* Tutor tutor = (Tutor)session.getAttribute("tutor"); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Classroom</title>
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/menubar.css">
<!-- <link rel="stylesheet" href="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css"> -->
<link rel="stylesheet" type="text/css" href="css/classSignUp.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<!-- 달력 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script>
	$(function() {
		// 사이드바 토글 기능
		$('[data-app-dashboard-toggle-shrink]').on(
				'click',
				function(e) {
					e.preventDefault();
					$(this).parents('.app-dashboard').toggleClass(
							'shrink-medium').toggleClass('shrink-large');
				});

		// like취소-button클릭시 찜한 클래스 삭제 기능
		$('.button-like').bind('click', function(event) {
			if (confirm('취소하시겠습니까?')) { // 확인 누를시에만 삭제
				// $(this).toggleClass("liked"); //여기선 없어도 됨
				/* $(this).parent().remove(); */
				// 삭제하는 서블릿으로 이동  location.href="" -> 삭제하고 다시 이 페이지로 돌아오기
			}
		});

		// 후기 삭제 버튼 누를시
		$('.remove').click(function() {
			if (confirm('삭제하시겠습니까?')) { // 확인 누를시에만 삭제
				/* $(this).parent().parent().remove(); */
				// 삭제하는 서블릿으로 이동  location.href="" -> 삭제하고 다시 이 페이지로 돌아오기
			}
		});
	});
	// 1000 단위마다 , 찍어주는 js
	function inputNumberFormat(obj) {
		obj.value = comma(uncomma(obj.value));
	}

	function comma(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}

	function uncomma(str) {
		str = String(str);
		return str.replace(/[^\d]+/g, '');
	}

	// 체크박스 하나만 선택되는 js
	function oneCheckbox(a) {

		var obj = document.getElementsByName("checkbox1");

		for (var i = 0; i < obj.length; i++) {

			if (obj[i] != a) {

				obj[i].checked = false;
			}
		}
	}
</script>
<style>
img.ui-datepicker-trigger {
	margin-left: 5px;
	vertical-align: middle;
	cursor: pointer;
}
</style>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script>
	$(function() {

		//오늘 날짜를 출력
		$("#today").text(new Date().toLocaleDateString());

		//datepicker 한국어로 사용하기 위한 언어설정
		$.datepicker.setDefaults($.datepicker.regional['ko']);

		// 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
		// 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

		//시작일.
		$('#fromDate').datepicker({
			showOn : "both", // 달력을 표시할 타이밍 (both: focus or button)
			buttonImage : "images/calendar.gif", // 버튼 이미지
			buttonImageOnly : true, // 버튼 이미지만 표시할지 여부

			buttonText : "날짜선택", // 버튼의 대체 텍스트
			dateFormat : "yy-mm-dd", // 날짜의 형식
			changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
			//minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
			onClose : function(selectedDate) {
				// 시작일(fromDate) datepicker가 닫힐때
				// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
				$("#toDate").datepicker("option", "minDate", selectedDate);
			}
		});

		//종료일
		$('#toDate').datepicker({
			showOn : "both",
			buttonImage : "images/calendar.gif",
			buttonImageOnly : true,
			buttonText : "날짜선택",
			dateFormat : "yy-mm-dd",
			changeMonth : true,
			//minDate: 0, // 오늘 이전 날짜 선택 불가
			onClose : function(selectedDate) {
				// 종료일(toDate) datepicker가 닫힐때
				// 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
				$("#fromDate").datepicker("option", "maxDate", selectedDate);
			}
		});
	});
</script>
<style>
#logBtn {
	/* 임시로 상단바의 로그인버튼 폰트 적용 */
	font-family: monospace;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="app-dashboard shrink-medium">

		<!-- 상단바 -->
		<div class="row expanded app-dashboard-top-nav-bar">
			<div class="columns medium-2">
				<a class="app-dashboard-logo" href="<%=request.getContextPath()%>"><img
					src="images/logo.png" width="70px" height="55px"></a>
			</div>
			<div class="columns shrink app-dashboard-top-bar-actions">
				<div class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/myInfo.me"><img
						src="images/myPage.png"></a>
				</div>
				<!-- 마이페이지아이콘 -->
				<div class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/contact.co"><img
						src="images/contact.png"></a>
				</div>
				<!-- 콘택트아이콘 -->
				<div class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/myClass.me"><img
						src="images/like.png"></a>
				</div>
				<!-- 찜아이콘  -->

				<%
					if (loginUser == null) {
				%>
				<div class="nav-item">
					<a class="nav-link"
						href="<%=request.getContextPath()%>/loginForm.me"><button
							id="logBtn">Login</button></a>
				</div>
				<!-- 로그인 -->
				<%
					} else {
				%>
				<div class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/logout.me"><button
							id="logBtn">LogOut</button></a>
				</div>
				<!-- 로그아웃 -->
				<%
					}
				%>



				<!-- <button href="#" class="button hollow">Logout</button> 로그아웃 버튼 -->
				<!-- <a href="#" height="30" width="30" alt=""><i class="fa fa-info-circle"></i></a> -->
			</div>
		</div>


		<div class="app-dashboard-body off-canvas-wrapper">
			<div id="app-dashboard-sidebar"
				class="app-dashboard-sidebar position-left off-canvas off-canvas-absolute reveal-for-medium"
				data-off-canvas>
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
						<li><a href="#"> <span class="app-dashboard-sidebar-text"><h3>나의
										클래스룸</h3></span> <!-- 누르면 나의 클래스룸 -> 수강중/수강완료/찜한클래스/후기 전체 볼 수 있는 페이지 -->
						</a></li>
						<li><a href="#"> <span class="app-dashboard-sidebar-text">수강중인
									클래스</span> <!-- 누르면 수강중인 클래스 페이지로 이동(페이지 따로 만들기) -->
						</a></li>
						<li><a href="#"> <span class="app-dashboard-sidebar-text">수강완료
									클래스</span> <!-- 누르면 수강완료 클래스 페이지로 이동 -->
						</a></li>
						<li><a href="#"> <span class="app-dashboard-sidebar-text">찜한
									클래스</span> <!-- 누르면 찜한 클래스 페이지로 이동 -->
						</a></li>
						<li><a href="#"> <span class="app-dashboard-sidebar-text">내가
									쓴 후기</span> <!-- 누르면 내가 쓴 후기 페이지로 이동 -->
						</a></li>
						<br>
						<li><a href="#"> <span class="app-dashboard-sidebar-text"><h3>내
										정보</h3></span> <!-- 내 정보 조회 페이지  -->
						</a></li>
						<li><a href="#"> <span class="app-dashboard-sidebar-text">내
									정보 수정</span> <!--  내 정보 수정 페이지-->
						</a></li>
						<li><a href="#"> <span class="app-dashboard-sidebar-text">결제정보</span>
						</a></li>
						<li><a href="#"> <span class="app-dashboard-sidebar-text">튜티
									탈퇴</span>
						</a></li>
						<br>
						<br>
						<br>

						<%-- <% if(tutor == null) { %> 로그인할때 tutor정보도 세션에 저장하고 상단에서 객체 생성하기 --%>
						<%
							if (loginUser != null && loginUser.getMemberGrade().equals("B")) {
						%>
						<%-- 로그인한 유저의 그레이드가 'B'즉 튜터가 아니면 튜터 신청 버튼 활성화 --%>
						<li><span class="app-dashboard-sidebar-text"><h3>튜터</h3></span>
						</li>
						<li><a href="#"> <span class="app-dashboard-sidebar-text">내
									클래스</span> <%-- 누르고 서블릿 이동하면 tutor정보도 세션에 저장하기? --%>
						</a></li>
						<li style="color: #9ED4C2"><a href="#"> <span
								class="app-dashboard-sidebar-text">튜터 정보</span>
						</a></li>
						<li style="color: #9ED4C2"><a href="#"> <span
								class="app-dashboard-sidebar-text">정산하기</span>
						</a></li>

						<%
							} else {
						%>
						<li><span class="app-dashboard-sidebar-text"><button
									id="apply-tutor-btn">튜터 신청하기</button></span></li>
						<%-- span class="app-dashboard-sidebar-text"가 있어야 사이드바 닫힐때 안 보임  --%>

						<%
							}
						%>
						<br>
						<br>
						<br>
					</ul>


				</div>
			</div>

			<!-- 본문 내용 시작 -->
			<div class="app-dashboard-body-content off-canvas-content"
				data-off-canvas-content>
				<form action ="/form" method="post" n>
					<div id="margin_check">
						<!-- 수강중인 클래스 -->
						<h3>클래스 신청</h3>
						<hr>
						<div id="enroll_tutor_form">
							<form action="#" class="enroll_tutor">


								<b>카테고리</b><br> <select id="category_class">
									<option value=" " disabled selected hidden>카테고리를
										선택해주세요.</option>
									<option value="live_class">라이브</option>
									<option value="codding_class">개발/코딩</option>
									<option value="interior_class">인테리어</option>
									<option value="cooking_class">요리</option>
									<option value="music_class">악기</option>
									<option value="health_class">건강/헬스</option>
									<option value="writing_class">글쓰기</option>
									<option value="photo_class">사진</option>
									<option value="digitaldrawing_class">디지털 드로잉</option>
									<option value="drawing_class">드로잉</option>
									<option value="Videoediting_class">영상 편집</option>
									<option value="stock_class">주식</option>
									<option value="tarot_class">사주/타로</option>

								</select> <br> <br> <b>클래스 제목</b><input type="text"
									placeholder="컨셉이 잘 드러나는 클래스의 제목을 정해주세요" id="tutor_nickname"><br>
								<br> <b>이미지 첨부</b><br> <input type="file" id="image"
									accept="image/*" onchange="setThumbnail(event);" />
								<div id="image_container"></div>
								<script>
									function setThumbnail(event) {
										var reader = new FileReader();
										reader.onload = function(event) {
											var img = document
													.createElement("img");
											img.setAttribute("src",
													event.target.result);
											document.querySelector(
													"div#image_container")
													.appendChild(img);
										};
										reader
												.readAsDataURL(event.target.files[0]);
									}
								</script>
								<!-- 							<input style="display: block;" type="file" id="input-multiple-image" multiple> -->
								<!-- 								<div id="multiple-container"> -->
								<!-- 								</div> -->

								<br> <br> <br> <b>클래스 소개</b><br>
								<textarea id="tutor_introduction"
									placeholder="클래스 소개글을 부탁드립니다 ^^"></textarea>
								<br>
								<div>
									<h3>클래스 신청</h3>
									오늘 날짜 : <span id="today"></span> <br>
									<form>
										<label for="fromDate">시작일</label> <input type="text"
											name="fromDate" id="fromDate"> ~ <label for="toDate">종료일</label>
										<input type="text" name="toDate" id="toDate">
									</form>
								</div>
								<br>
								<div>
									<h3>요일 선택</h3>

									<span>월<input id="dayOfWeek1" type="checkbox"></span> <span>화<input
										id="dayOfWeek2" type="checkbox"></span> <span>수<input
										id="dayOfWeek3" type="checkbox"></span> <span>목 <input
										id="dayOfWeek4" type="checkbox"></span> <span>금 <input
										id="dayOfWeek5" type="checkbox"></span> <span>토<input
										id="dayOfWeek6" type="checkbox"></span> <span>일<input
										id="dayOfWeek7" type="checkbox"></span>

								</div>
								<div>
									<h3>강의 시간</h3>
									<form>
										<p>
											시작 시간<input type="time" min="09:00:00" max="22:00:00">
											~ 종료 시간<input type="time">
										</p>
									</form>
								</div>
								<div>
									<span font-size="15px">수강료</span> <input type="text"
										style="text-align: right;" pattern="[0-9]+" id="price"
										onkeyup="inputNumberFormat(this)" />원
								</div>
								<br>
								<div>
									<h3>클래스 모집 인원</h3>
									최소 인원<input type="number" id="tentacles" name="tentacles" min="1" max="100">
									~
									최대 인원 <input type="number" id="tentacles" name="tentacles" min="10" max="100">
								</div>

								<div>
									<h3>클래스 수강 방법</h3>
									<form name="sendForm">
										<input type="checkbox" name="checkbox1" value="a1"
											onclick="oneCheckbox(this)">라이브 강의 <input
											type="checkbox" name="checkbox1" value="a2"
											onclick="oneCheckbox(this)">오프라인 강의 <br> 오프라인 강의
										선택시 클래스 제공 장소 기입<br>
										<input type= "text"  id="tutor_classplace" placeholder="주소를 입력해주시기 바랍니다.">
									</form>
								</div>
								<br><br>

								<button type="reset" id="tutor_enroll_cancel">취소</button>

								<button type="submit" id="tutor_enroll_complete">클래스 신청</button>


								<br>
							</form>
						</div>
					</div>
			</div>
			</form>
		</div>
		<footer class="container"
			style="text-align: center; background: #F5F5F5;">

			<p class="float-end">
				<a href="#">Back to top</a>
			</p>
			<p>
				&copy; 2021 HOBBYIST, Inc. &middot; <a
					href="<%= request.getContextPath() %>/contact.co">Contact</a>
				<!-- &middot; <a href="#">Terms</a> -->
			</p>
		</footer>
	</div>
</body>
</html>