<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tutee.model.vo.*,   classNotice.controller.*, java.text.DecimalFormat, hobbyistClass.model.vo.*, member.model.vo.Member, tutor.model.vo.Tutor, java.util.ArrayList , hobbyistClass.model.vo.*, classNotice.model.vo.*"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");

	HClass c = (HClass)request.getAttribute("c");
	ArrayList<HClassFile> f = (ArrayList)request.getAttribute("fileList");
	Tutor t = (Tutor)request.getAttribute("tutor");
	ArrayList<HClassSchedule> s = (ArrayList)request.getAttribute("sList");
	ArrayList<ClassNotice> list = (ArrayList) request.getAttribute("list");
	DecimalFormat dc = new DecimalFormat("###,###,###");
	
	// 달력의 요일과 DB에서 가져온 요일데이터를 비교하는 조건식 생성 -> script에서 배열에 저장하여 활용
	String dayPick = "";
	for (int i=0; i < s.size(); i++) {
		if(s.size() == 1) {
			dayPick += "(day == " + s.get(i).getSchduleDay() + ")"; 
		} else {
			if (i == 0) {
				dayPick += "(day == " + s.get(i).getSchduleDay() + " || "; 
			} else if (i != s.size() - 1){
				dayPick += "day == "  + s.get(i).getSchduleDay() + " || "; 
			} else {
				dayPick += "day == " + s.get(i).getSchduleDay() + ")"; 
			}
		}
	}	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOBBYIST</title>
<%@ include file="../common/css.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style>
	.likeBtnArea{display: inline-block;} 
	#btnSub {
		background: lightgray;
		font-weight: bold;
		cursor: pointer;
		color: white;
		box-shadow: 2px 2px 2px lightgray;
		font-size: large;
		border: none;
		height: 50px;
		width: 100px;
		
	}
	#btnSub:hover {
		background: #9ED4C2;
	}
	.notice_a {
    text-decoration: none;
    color: inherit;
}

.board_list_wrap1 {
    padding: 50px;
}

.board_list1 {
    width: 100%;
    border-top: 2px solid #9ED4C2;
}

.board_list1 tr {
    border-bottom: 1px solid #9ED4C2;
}

.board_list1 th,
.board_list1 td {
    padding: 10px;
    font-size: 14px;
}

.board_list1 td {
    text-align: center;
}

.board_list1 .tit {
    text-align: left;
}

.board_list1 .tit:hover {
    text-decoration: underline;
}

.board_list_wrap1 .paging {
    margin-top: 20px;
    text-align: center;
    font-size: 0;
}
.board_list_wrap1 .paging a {
    display: inline-block;
    margin-left: 10px;
    padding: 5px 10px;
    border-radius: 100px;
    font-size: 12px;
}
.board_list_wrap1 .paging a:first-child {
    margin-left: 0;
}

.board_list_wrap1 .paging a.bt {
    border: 1px solid #eee;
    background: #eee;
    text-decoration: none;
}

.board_list_wrap1 .paging a.num {
    border: 1px solid #9ED4C2;
    font-weight: 600;
    color: #9ED4C2;
    text-decoration: none;
}

.board_list_wrap1 .paging a.num.on {
    background: #9ED4C2;
    color: #fff;
    text-decoration: none;
}

.writeNoBtn{
	backgorund: #9ED4C2;
	color: #fff;
}

#listArea{
	text-align: center;
}

#logBtn {
	/* 임시로 상단바의 로그인버튼 폰트 적용 */
	font-family: monospace;
	font-weight: bold;
}

.tutorProfile{
	width: 200px;
	height: 150px;	
}
	
.tutorProfile img{
	width: 180px;
	height: 140px;
}
</style>
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
								<li><a href="<%= request.getContextPath() %>">MAIN</a></li>
							<% if(loginUser == null) { %>
								<li></li>
								<li><a href="#" onclick="alert('로그인을 먼저 해주세요.');">LIKED-CLASS</a></li>
							<% } else if(loginUser.getMemberGrade().equals("A")){ %>
							<!-- 관리자면 LIKED-CLASS버튼 비활성화 -->
							<% } else { %>
								<li></li>
								<li><a href="<%= request.getContextPath() %>/myClass.te">LIKED-CLASS</a></li>
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
								<div class="carousel-inner" style="height: 550px">
									<div class="carousel-item active">
										<% if (f.isEmpty()) { %>
											<img src="images/simone-hutsch-FNs_ylOm21g-unsplash.jpg" class="classThumbnail" alt="image for article" alt="thumbnail">
										<% } else { %>
											<img src="<%= request.getContextPath() %>/uploadFiles/<%= f.get(0).getChangeName() %>" id="thumbnail" 
												class="classThumbnail d-block w-100" style="object-fit: cover" alt="thumbnail">
										<% } %>
									</div>
									<% if (!f.isEmpty()) { %>
									<% 		for (int i = 1; i < f.size(); i++) { %>
									<div class="carousel-item">
										<img src="<%= request.getContextPath() %>/uploadFiles/<%= f.get(i).getChangeName() %>"class="d-block w-100 classImage"
											style="object-fit: cover">
									</div>
									<% 		} %>
									<% } %>
								</div>
								<br>
								<!-- 화면 영역 -->
								
								<!-- 좋아요 버튼 기능 -->
								<div class="likeBtnArea">
									<input type="hidden" class="cNo" name="cNo" value="<%= c.getClassNo() %>"> 
								</div>		
								<!-- 클래스 소개 -->
								<span style="font-size: x-large; color: gray;"> &nbsp;[<%= c.getcategoryName() %>]</span>
								<span style="font-size: x-large;"> &nbsp;<%= c.getClassName() %></span>
								
								<hr>
								<div style="border: 1px solid #d9d9d9; padding: 10px">
									<textarea style="min-width: 750px; min-height: 400px; resize: none; border: none;" readonly><%= c.getClassContent() %></textarea>
								</div>
								<div class="board_list_wrap1">
					<br>
					<div>
						<table class="board_list1" id="listArea">
							<h2>공지사항</h2>
							<thead>
								<tr>
									<th>글번호</th>
									<th>글제목</th>
									<th>작성자</th>
									<th>조회수</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
							
								<% boolean check = false; %>
                                        <%    if (!list.isEmpty()) { %>

                                                <%for (int i = 0; i < list.size(); i++) { %>

                                            <%     if(c.getClassNo() == list.get(i).getClassNo()) {%>
                                                <tr>
                                                    <td><%=list.get(i).getClassBoardNo()%></td>
                                                    <td><%=list.get(i).getClassBoardName()%></td>
                                                    <td><%=list.get(i).getClassBoardWriter()%></td>
                                                    <td><%=list.get(i).getClassBoardViews()%></td>
                                                    <td><%=list.get(i).getClassBoardDate()%></td>
                                                </tr>
                                                    <%    check = true; %>
                                                <% } %>
                                            <% } %>
									
                                        <%    } %>
                                    <% if(!check) { %> 
                                                <tr>
                                                    <td colspan="5">존재하는 공지사항이 없습니다.</td>
                                                </tr>
                                    <% } %>
                            </tbody>
						</table>
					</div>
					<div align="right">
						<%
							if (loginUser != null && (loginUser.getMemberGrade().equals("B")/*||loginUser.getMemberGrade().equals("A")*/)) {
						%>
						<%-- 로그인을 했으면서,튜터 아이디인  경우만--%>
						<br><input type="submit" id="writeNoBtn" value="글쓰기" 
						onclick="location.href = '<%=request.getContextPath()%>/classNoticeWrite.no?cNo=<%=c.getClassNo()%>'">
						<%
							}
						%>
						
					</div>
				</div>
			</div>
<script>
     $('#listArea td').mouseenter(function(){
          $(this).parent().css({'background':'darkgray', 'cursor':'pointer'});
         }).mouseout(function(){
       $(this).parent().css({'background':'none'});
      }).click(function(){
       var num = $(this).parent().children().eq(0).text(); // 글번호 가져오기
//       if ($(this).text() != '존재하는 공지사항이 없습니다.') {
             location.href = '<%=request.getContextPath()%>/classNoticedetail.no?cNo='+ num;
//        }
    });
</script>	
							
							<!-- 사이드 / 클래스 소개 -->
							<div class="col-md-4">
								<div class="card">
									<div class="card-header">
										<div class="card-title">[LIVE]</div>
									</div>
									<div class="card-body">
										<div class="tutorProfile">
											<img src="<%= request.getContextPath() %>/uploadFiles/<%= t.getTutorImgChangeName() %>">
										</div>
										<h6 class="card-subtitle mb-2 text-muted"><%= t.getMemberNickName() %>의 클래스</h6>
										<p class="card-text">
											<p><%= t.getTutorReport() %></p>
										</p>

										<div class="notif-icon notif-danger">
											<i class="la la-instagram"></i> <a href="<%= t.getTutorSns() %>" class="card-link">SNS</a>
										</div>
										<hr>
									</div>
								
									<div class="card-body">
										<h6 class="card-subtitle mb-2 text-muted" >
											클래스 시작일  : <span><%= c.getClassStartDate() %></span> ~ 종료일 : <span><%= c.getClassEndDate() %></span>
										</h6>
										<h6 class="card-subtitle mb-2 text-muted">
											강의 소요시간: <span><%= c.getClassTime() %></span>시간
										</h6>
										<h6 class="card-subtitle mb-2 text-muted">
											수강 인원: <span><%= c.getClassTuteeMin() %></span>~<span><%= c.getClassTuteeMax() %></span>명 (최소인원 <span><%= c.getClassTuteeMin() %></span>명)
										</h6>
<!-- 										<h6 class="card-subtitle mb-2 text-muted"> -->
<%-- 											클래스 수업 시간: <span><%= c.getClassTime() %></span>시간 --%>
<!-- 										</h6> -->
										<h6 class="card-subtitle mb-2 text-muted">
											수강료: <span><%= dc.format(c.getClassFee()) %></span>원
										</h6>
										<h6 class="card-subtitle mb-2 text-muted">
										클래스 시작 시간 : 
										<% for (int i = 0; i < s.size(); i++) { %>
										<% 		if (s.size() > 1 && i != 0 && s.get(i-1).getSchduleTime().equals(s.get(i).getSchduleTime())) { %>
																								
										<% 		} else { %>
<%-- 										<span type = "text" class="timeOption"><%= s.get(i).getSchduleDay() %></span> --%>
										<span type = "text" class="timeOption"><%= s.get(i).getSchduleTime() %></span>
										<% 		} %>
										<% } %>
										<br>
										</h6>
										

									</div>
									
								</div>
<!-- 								<div> -->
<!-- 									<input type="button" class="btn btn-default pull-right" value="목록으로" onclick="history.back();"> -->
<!-- 								</div> -->
								
								<!-- 사이드 / 클래스 신청 -->
<!-- 								<div class="card"> -->
<!-- 									<div class="card-header"> -->
<!-- 										<div class="card-title"></div> -->
<!-- 									</div> -->
<!-- 									<div class="form-group"> -->
<!-- 										<div class="apply-class"> -->
<%-- 											<form action="<%= request.getContextPath() %>/applyClass.te" method="post"  onsubmit="return check();"> --%>
<!-- 												<label for="exampleFormControlSelect1">클래스 일정 &nbsp;</label>  -->
<!-- 												<input type="text" id="datepicker" name="date" required readonly style="background: white;"> -->
<!-- 												<small id="imageHelp" class="form-text text-muted">수강을 원하시는 날짜를 선택해주세요(최대 1개)</small> <br>  -->
												
<!-- 												<label for="exampleFormControlSelect1">강의 시간 선택 &nbsp;</label>  -->
<!-- 												<select id="time" name="time" style="width: 100px;"> -->
<%-- 												<% for (int i = 0; i < s.size(); i++) { %> --%>
<%-- 												<% 		if (s.size() > 1 && i != 0 && s.get(i-1).getSchduleTime().equals(s.get(i).getSchduleTime())) { %> --%>
																								
<%-- 												<% 		} else { %> --%>
<%-- 															<option class="timeOption" value="<%= s.get(i).getSchduleTime() %>"><%= s.get(i).getSchduleTime() %></option> --%>
<%-- 												<% 		} %> --%>
<%-- 												<% } %> --%>
<!-- 												</select> -->
<!-- 												<small id="imageHelp" class="form-text text-muted">수강을 원하시는 시간을 선택해주세요(최대 1개)</small> <br> -->
												
<%-- 												<input type="hidden" name="cNo" value="<%= c.getClassNo() %>"> --%>
<!-- 												<div id="price"> -->
<!-- 													<label for="exampleFormControlSelect1">수강료 &nbsp;</label>  -->
<%-- 													<input placeholder="<%= c.getClassFee() %>원" disabled> --%>
<!-- 													<small id="imageHelp" class="form-text text-muted">수강료는 이미 책정된 내역으로 변경할 수 없습니다.</small>  -->
												
<!-- 													<br><br><br> -->
<!-- 												</div>	 -->
<!-- 												<div align="center"> -->
<!-- 													<input type="submit" id="btnSub" value="신청"> -->
<!-- 												</div> -->
<!-- 												<br> -->
<!-- 											</form> -->
<!-- 										</div> -->
<!-- 									</div> -->
									
									
<!-- 								</div> -->
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<!-- 클래스 리뷰 영역 -->
	

<%@ include file="../common/js.jsp" %>
<script src="assets/js/swiper.js"></script>
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

	// like-button js, ajax
	$(function() {
		// 화면 로드될때 실행되는 함수, window.onload = function(){}과 같음
		// 로그인이 되어 있고, 클래스리스트가 존재하면 실행
		<% if(loginUser != null) { %>
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
		maxDate : new Date('<%= c.getClassEndDate() %>'), // 특정날짜 이후는 선택 못하게/ 기간 선택 범위 제한/ 클래스 종료일자 이후는 선택 불가
		showButtonPanel : true,
		currentText : '오늘 날짜',
		closeText : '닫기',
		showAnim : "slide",

		beforeShowDay : onlyClassday, // 요일 선택 제한, 값으로 함수를 넣었음
		regional : "ko", // 지역

	});

	function onlyClassday(date) { // 리턴한 요일만 선택되게 하는 함수
		var day = date.getDay();
		// return [(day == 1), '']; // day == 1 월요일만 선택
		// return [(day != 0 && day != 1 && day != 3)]; // 특정 요일 제한 -> 일,월,수만 선택 안하기
		// var classDay = [ (day == 0 || day == 1 || day == 3) ];
		// return classDay;
		
		var classDay = new Array();
		
		classDay.push(<%= dayPick %>); 
		// DB에서 클래스 스케줄의 강의요일을 가져와 조건식으로 저장 -> 배열에 넣어 반환하기
		// -> 날짜선택 클릭시 달력의 요일과 리턴한 배열의 데이터 안의 요일데이터와 비교 -> 조건식 결과 boolean값이 false면 해당 요일은 선택 불가능 처리
		
		return classDay;
	};

	$(function() {
		$("#datepicker").datepicker({
			buttonImage : "images/calendar.gif",
		});

	});

	$(document).ready(function() {
		var dt = new Date();
	});
	
	// 날짜 선택시 스케줄표에서 그 요일의 시간과 일치하는 것은 selected, 아닌 것은 disabled로 변경 
	$("#datepicker").off().on('change', function(){
		var inputDate = $(this).val();
		var inputDay = new Date(inputDate).getDay();
		var timeOption = $('.timeOption');
		
		var flagArr = new Array();
		<% for(HClassSchedule hs : s) { %>
				if (inputDay == <%= hs.getSchduleDay() %>) {
					for (var i in timeOption) {
						if (timeOption[i].value == '<%= hs.getSchduleTime() %>') {
							flagArr.push(i); 
							// 해당 요일의 강의시간과 select옵션태그의 value값인 강의시간이 일치하면
							// selected속성 넣을 option태그의 index값을  배열에 넣음
						}
					}
				}
		<% } %>
		
		for (var i in timeOption) {
			timeOption[i].disabled = true;
			$time.css('text-decoration', 'line-through')
			for (var j in flagArr) { 
				if (i == flagArr[j]) { // 해당 요일의 강의시간과 일치했던 option은 disabled 해제
					timeOption[flagArr[j]].selected = "selected";
					timeOption[flagArr[j]].disabled = false;
				}
			}
		}
	});
	
	// 신청 form제출시 로그인 여부 check
	function check() {
		if ('<%= loginUser %>' == 'null') {
			alert('로그인이 필요한 서비스입니다.');
			return false;
		} else {
			if (confirm($("#datepicker").val() + "일, " + $('#time').val() +"분을 선택하신 것이 맞습니까?")){
				return true;
			} else {
				return false;
			}
		}
	}
	
</script>

	

    

</body>
</html>