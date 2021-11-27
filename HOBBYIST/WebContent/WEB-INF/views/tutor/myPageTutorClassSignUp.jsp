<%@ page import = "java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, hobbyistClass.model.vo.*, member.model.vo.Member, tutor.model.vo.Tutor"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
	Tutor tutor = (Tutor)session.getAttribute("tutor");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<%@ include file="../common/css.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script>
					// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
					$(function(){
						$("#fileArea").hide();
						
						$("#titleImgArea").click(function(){
							$("#thumbnailImg1").click();
						});
						$("#contentImgArea1").click(function(){
							$("#thumbnailImg2").click();
						});
						$("#contentImgArea2").click(function(){
							$("#thumbnailImg3").click();
						});
						$("#contentImgArea3").click(function(){
							$("#thumbnailImg4").click();
						});
					});
					
					// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
					function LoadImg(value, num){
						if(value.files && value.files[0]){
							var reader = new FileReader();
							
							reader.onload = function(e){								
								switch(num){
								case 1: 
									$("#titleImg").attr("src", e.target.result);
									break;
								case 2:
									$("#contentImg1").attr("src", e.target.result);
									break;
								case 3: 
									$("#contentImg2").attr("src", e.target.result);
									break;
								case 4:
									$("#contentImg3").attr("src", e.target.result);
									break;
								}
							}
							
							reader.readAsDataURL(value.files[0]);
						}
					}
				</script>
<style>
img.ui-datepicker-trigger {
	margin-left: 5px;
	vertical-align: middle;
	cursor: pointer;
}

/* 스케줄 추가 btn css */
.schBtn{
	font-weight: bold;
	width : 90px;
	height: 30px;
	background-color : #9ED4C2;
	border : solid #9ED4C2 1px;
	resize: none;
	margin-bottom: 10px;
	cursor: pointer;
}
#cancelSchedule{
	background-color : lightgray;
	border : solid lightgray 1px;
	margin-right: 5px;
}

</style>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<style>
#logBtn {
	/* 임시로 상단바의 로그인버튼 폰트 적용 */
	font-family: monospace;
	font-weight: bold;
}
</style>
<script>
	$(function() {

		//오늘 날짜를 출력
		$("#today").text(new Date().toLocaleDateString());

		//datepicker 한국어로 사용하기 위한 언어설정
		$.datepicker.setDefaults($.datepicker.regional['ko']);

		//시작일.
		$('#fromDate').datepicker({
			showOn : "both", // 달력을 표시할 타이밍 (both: focus or button)
			buttonImage : "images/calendar.gif", // 버튼 이미지
			buttonImageOnly : true, // 버튼 이미지만 표시할지 여부
			buttonText : "날짜선택", // 버튼의 대체 텍스트
			dateFormat : "yy-mm-dd", // 날짜의 형식
			changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
			changeYear : true, //연도 변경 가능 설정
			minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
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
			changeYear : true,
			//minDate: 0, // 오늘 이전 날짜 선택 불가
			onClose : function(selectedDate) {
				$("#fromDate").datepicker("option", "maxDate", selectedDate);
			}
		});
	});
</script>
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
								<li></li>
								<li><a href="<%= request.getContextPath() %>/myClass.te">LIKED CLASS</a></li>
								<li></li>
								<% if(loginUser == null) { %>
									<li><a href="<%= request.getContextPath() %>/loginForm.me">LOG-IN</a></li> <!-- login전이면 로그인버튼 -->
								<% } else { %>
									<li><a href="<%= request.getContextPath() %>/logout.me">LOG-OUT</a></li> <!-- login된 상태면 로그아웃버튼 -->
								<% } %>
								<li></li>
								<li><a href="<%= request.getContextPath() %>/myInfo.me">MY INFO</a></li>
								<li></li>
								<li><a href="<%= request.getContextPath() %>/FAQ.bo">FAQ</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="sidebar">
			<div class="scrollbar-inner sidebar-wrapper">
				<div class="user">
					<div class="photo">
					<% if(tutor == null) {  %>
					<img src="assets/images/hlogo_g.png">
					<% } else { %>
					<img src="<%= request.getContextPath() %>/uploadFiles/<%= tutor.getTutorImgChangeName() %>">
					<% } %>
					</div>
					<div class="info">
						<a class="" data-toggle="collapse" href="#collapseExample"
							aria-expanded="true"> <span>
									<!-- loginUser의 NickName 불러오기 -->
									<b><%= loginUser.getMemberNickName() %></b>
									<!-- loginUser의 grade 불러오기 -->
								<% if(loginUser.getMemberGrade().equals("A")) { %>
									<span class="user-level">관리자(admin)</span>
								<% } else if(loginUser.getMemberGrade().equals("B")) { %>
									<span class="user-level">튜터(Tutor)</span>
								<% } else { %>
									<span class="user-level">튜티(Tutee)</span>
								<% }  %>
									<span class="caret"></span>
								</span>
						</span>
						</a>
						<div class="clearfix"></div>

						<div class="collapse in" id="collapseExample" aria-expanded="true"
							style="">
							<ul class="nav">
								<li><a href="<%=request.getContextPath()%>/myInfo.me">
										<span class="link-collapse">내 정보 보기</span>
								</a></li>
								<li><a href="<%=request.getContextPath()%>/updateForm.me">
										<span class="link-collapse">내 정보 수정</span>
								</a></li>
								<li><a
									href="<%=request.getContextPath()%>/deleteConfirm.me"> <span
										class="link-collapse">튜티 탈퇴</span>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
				<ul class="nav">
					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/myClass.te"> <i
							class="la la-toggle-on"></i>
							<p>MY CLASS</p>
					</a></li>
					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/likedClass.cl"> <i
							class="la la-gittip"></i>
							<p>LIKED CLASS</p>
					</a></li>
<!-- 					<li class="nav-item"><a -->
<%-- 						href="<%=request.getContextPath()%>/review.re"> <i --%>
<!-- 							class="la la-camera-retro"></i> -->
<!-- 							<p>MY REVIEW</p> -->
<!-- 					</a></li> -->
					<li class="nav-item"><a
					href="<%=request.getContextPath()%>/list.cs"> <i
						class="la la-question-circle"></i>
						<p>1:1 REQUEST</p>
					</a></li>
					<hr>
					<li class="nav-item active"><a
						href="<%=request.getContextPath()%>/move.co"> <i
							class="la la-pencil"></i>
							<p>APPLY FOR CLASS</p>
					</a></li>
					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/tutorMyPage.tt"> <i
							class="la la-calendar-o"></i>
							<p>TUTOR ON CLASS</p>
					</a></li>
					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/tutorInform.me"> <i
							class="la la-user"></i>
							<p>TUTOR INFO</p>
					</a></li>
				
					
				</ul>
			</div>
		</div>
		<!-- 사이드바 영역 -->

		<!-- 메인 영역 -->
		<div class="main-panel">
			<form action="<%= request.getContextPath() %>/classopen.th" method="post" encType="multipart/form-data" onsubmit="return check();">
			<div class="content">
				<div class="container-fluid">
					<h4 class="page-title">APPLY FOR CLASS</h4>
					<hr>
					<div class="row">
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<div class="card-title">클래스 신청</div>
								</div>
								<div class="card-body">
									<div class="form-group">
										<label for="exampleFormControlSelect1">카테고리</label> <span
											class="badge badge-danger">필수</span> <select
											class="form-control" id="category_class" name = "category">
												<option value="1">라이브</option>
												<option value="2">개발/코딩</option>
												<option value="3">인테리어</option>
												<option value="4">요리</option>
												<option value="5">악기</option>
												<option value="6">건강/헬스</option>
												<option value="7">글쓰기</option>
												<option value="8">사진</option>
												<option value="9">디지털 드로잉</option>
												<option value="10">드로잉</option>
												<option value="11">영상 편집</option>
												<option value="12">주식</option>
												<option value="13">사주/타로</option>
										</select> <small id="selectHelp" class="form-text text-muted">클래스
											카테고리를 지정해주세요</small>
									</div>

									<div class="form-group">
										<label for="className">클래스 이름</label> <span
											class="badge badge-danger">필수</span>
										<div class="form-floating mb-3">
											<input type="text" class="form-control" id="floatingInput"
												name = "title" required> 
											<label for="floatingInput">컨셉이 잘 드러나는 클래스의 이름을 정해주세요</label>
										</div>
									</div>
									<!-- 이미지 div 영역 안에 넣는 것 추가해야함 (div container 안에 담기지 않음) -->
									<table id="insertThumbTable">
									<tr>
										<th>썸네일 사진</th>
										<td colspan="3">
											<div id="titleImgArea" style="width: 365px; height:200px;">
												<img id="titleImg" style="min-width:100%; height: 100%;">
											</div>
										</td>
									</tr>
									<tr>
										<th>이미지 추가</th>
										<td>
											<div id="contentImgArea1" style="width: 120px; height: 100px;">
												<img id="contentImg1" style="min-width:100%; height: 100%;">
											</div>
										</td>
										<td>
											<div id="contentImgArea2" style="width: 120px; height: 100px;">
												<img id="contentImg2" style="min-width:100%; height: 100%;">
											</div>
										</td>
										<td>
											<div id="contentImgArea3" style="width: 120px; height: 100px;">
												<img id="contentImg3" style="min-width:100%; height: 100%;">
											</div>
										</td>
									</tr>
									
								</table>

								<!-- 파일 업로드 하는 부분 -->
								<div id="fileArea">
									<input type="file" id="thumbnailImg1" multiple="multiple"
										name="thumbnailImg1" onchange="LoadImg(this,1)"> <input
										type="file" id="thumbnailImg2" multiple="multiple"
										name="thumbnailImg2" onchange="LoadImg(this,2)"> <input
										type="file" id="thumbnailImg3" multiple="multiple"
										name="thumbnailImg3" onchange="LoadImg(this,3)"> <input
										type="file" id="thumbnailImg4" multiple="multiple"
										name="thumbnailImg4" onchange="LoadImg(this,4)">
								</div>
								<small id="selectHelp" class="form-text text-muted">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;썸네일 사진은 필수 입니다.</small>
									<div class="form-group">
										<label for="comment">클래스 소개글</label> <span
											class="badge badge-danger">필수</span>
										<div class="form-floating">
											<textarea class="form-control" name ="content"
				 								placeholder="Leave a comment here" id="floatingTextarea"
												style="resize: none; height: 150px"></textarea>
											<label for="floatingTextarea">재치넘치는 클래스 소개글을 적어주세요</label>
										</div>
										  
									</div>

								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<div class="card-title">CLASS FORM</div>
								</div>
								<div class="card-body">
									<div class="form-group">
										<label for="exampleFormControlSelect1">클래스 일정 &nbsp;</label><span
											class="badge badge-danger">필수</span> <br>
										<label for="fromDate">FROM : </label> <input type="text"
											name="startdate" id="fromDate"> ~ <label for="toDate">TO
											: </label> <input type="text" name="enddate" id="toDate"> <small
											id="dateHelp" class="form-text text-muted"> TODAY : <span
											id="today"></span></small>
									</div>
									<fieldset style="width: 680px;">
									<div class="form-group">
										<label for="exampleFormControlSelect1">클래스 요일 선택</label>
										<p class="demo">
											<label class="form-check-label"> <input
												class="form-check-input" id="dayOfWeek0" type="checkbox" name="day"
												value="일"> <span class="form-check-sign">SUN</span>
											</label> <label class="form-check-label"> <input
												class="form-check-input" id="dayOfWeek1" type="checkbox" name="day"
												value="월"> <span class="form-check-sign">MON</span>
											</label> <label class="form-check-label"> <input
												class="form-check-input" id="dayOfWeek2" type="checkbox" name="day"
												value="화"> <span class="form-check-sign">TUE</span>
											</label> <label class="form-check-label"> <input
												class="form-check-input" id="dayOfWeek3" type="checkbox" name="day"
												value="수"> <span class="form-check-sign">WED</span>
											</label> <label class="form-check-label"> <input
												class="form-check-input" id="dayOfWeek4" type="checkbox" name="day"
												value="목"> <span class="form-check-sign">THU</span>
											</label> <label class="form-check-label"> <input
												class="form-check-input" id="dayOfWeek5" type="checkbox" name="day"
												value="금"> <span class="form-check-sign">FRI</span>
											</label> <label class="form-check-label"> <input
												class="form-check-input" id="dayOfWeek6" type="checkbox" name="day"
												value="토"> <span class="form-check-sign">SAT</span>
											</label>
											<br>
												시간 :
												<input type="time" id="time" name="time" >
												<small id="dateHelp" class="form-text text-muted"></small>
												<br><br>
												<input type="button" class="schBtn" id="addSchedule" value="스케줄 추가">
         										<input type="button" class="schBtn" id="cancelSchedule" value="스케줄 취소"><br>
												<textarea id="schedule" name="schedule" rows="10" cols="55" style="resize: none;" readonly></textarea><br>
												
										</p>
									</div>
									</fieldset>
									<script>
									$('#addSchedule').off().on('click', function(){
										
										var day = document.getElementsByName('day');
										var time = document.getElementById('time');
										var scheduleArea = document.getElementById('schedule');
										
										var inputSchedule = {};
										var checked = false;
										for (var i in day){
											if(day[i].checked) {
												inputSchedule[day[i].value] = time.value;
												checked = true;
											}
										}

										if(!checked || time.value == ''){
											alert('요일과 시간을 둘 다 선택해주세요.');
										} else {
											var schedule = scheduleArea.value;
											var text = '';
											
											for (var key in inputSchedule) {
												text = key + "-" + inputSchedule[key] + " / ";
												if (!schedule.includes(text)) {
													schedule += text;
												} else {
													alert('이미 선택된 스케줄입니다.')
												}
											}
											scheduleArea.value = schedule;
											$('input[name=day]').attr('checked', false);
											time.value = '';
										}
									});
									
									$('#cancelSchedule').off().on('click', function(){
										if(confirm('담아놓은 스케줄을 취소하시겠습니까?')) {
											document.getElementById('schedule').value = '';
										}
									});
								</script>
									<div class="form-group">
										<label for="exampleFormControlSelect1">강의 시간 선택</label>
										<div class="input-group mb-3">
											<span class="input-group-text" >회당 </span>
											<input type="number" class="form-control" name="classtime"
												aria-label="Sizing example input"
												aria-describedby="inputGroup-sizing-default" min="0"
												max="12" step="0.5" style = "text-align:right;" required>
												<span
												class="input-group-text" >시간</span>
										</div>
									</div>
									<div class="form-group">
										<label for="exampleFormControlSelect1">클래스 수강료</label>
										<div class="input-group mb-3">
											<span class="input-group-text" id="inputGroup-sizing-default">예상
												수강료</span> <input type="number" class="form-control"
												aria-label="Sizing example input" name ="fee"
												aria-describedby="inputGroup-sizing-default" min="0"
												max="1000000" step="1000" style = "text-align:right;"> <span
												class="input-group-text">원</span>
										</div>
									</div>
									<div class="form-group">
										<label for="exampleFormControlSelect1">클래스 모집인원</label>
										<div class="input-group mb-3">
											<span class="input-group-text" id="inputGroup-sizing-default">최소</span>
											<input type="number" class="form-control"
												aria-label="Sizing example input" name="minpeople"
												aria-describedby="inputGroup-sizing-default" min="0"
												max="100" step="1"> <span class="input-group-text">명</span><span
												class="input-group-text">~</span><span
												class="input-group-text">최대</span> <input type="number"
												class="form-control" aria-label="Sizing example input" name="maxpeople"
												aria-describedby="inputGroup-sizing-default" min="0"
												max="100" step="1"> <span class="input-group-text">명</span>
										</div>
									</div>
									<div class="row justify-content-center">
										<div class="col-2">
											<button class="btn btn-success" value="클래스 신청">Submit</button>
										</div>
										<div class="col-2">
											<button class="btn btn-danger" onclick="location.href='javascript:history.go(-1);'" value ="취소">Cancel</button>
										</div>
									</div>
									<script>
 						function check() {
							if($('#thumbnailImg1').val() == '') {
								alert('썸네일 이미지 첨부는 필수 사항입니다.');
								return false;
							} else if($('#schedule').val() == '') {
								alert('스케줄 등록은 필수 사항입니다.');
								return false;
							}
							return true;
						} 
					</script>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			
			</form>
		</div>
	
	


<%@ include file="../common/js.jsp" %>
</body>
</html>