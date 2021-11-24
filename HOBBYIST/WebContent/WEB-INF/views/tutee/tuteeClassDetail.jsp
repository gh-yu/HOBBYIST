<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="hobbyistClass.model.vo.*, member.model.vo.Member, 
								tutor.model.vo.Tutor, java.util.ArrayList, tutee.model.vo.TuteeClass"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");

	HClass c = (HClass)request.getAttribute("c");
	ArrayList<HClassFile> f = (ArrayList)request.getAttribute("fileList");
	Tutor t = (Tutor)request.getAttribute("tutor");
	ArrayList<TuteeClass> s = (ArrayList)request.getAttribute("tuteeSchedule");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOBBYIST</title>
<%@ include file="../common/css.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>
	.likeBtnArea{display: inline-block;} 
	
	.cancelBtn:hover {
		background: lightgray;
	}
	
	.cancelBtn{
		background: #6495ED;
		font-weight: bold;
		cursor: pointer;
		color: white;
		box-shadow: 2px 2px 2px lightgray;
		border: none;
		border-radius: 5px;
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
								<li><a href="#">MAIN</a></li>
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
									<input type="hidden" id="cNo" name="cNo" value="<%= c.getClassNo() %>"> 
									<button class="button button-like">
										<i class="fa fa-heart"></i><span>Like</span>
									</button>
								</div>		
								<!-- 클래스 소개 -->
								<span style="font-size: x-large; color: gray;"> &nbsp;[<%= c.getcategoryName() %>]</span>
								<span style="font-size: x-large;"> &nbsp;<%= c.getClassName() %></span>
								
								<hr>
								<div style="border: 1px solid #d9d9d9; padding: 10px">
									<textarea style="min-width: 750px; min-height: 400px; resize: none; border: none;" readonly><%= c.getClassContent() %></textarea>
								</div>
							</div>
							
							
							<!-- 사이드 / 클래스 소개 -->
							<div class="col-md-4">
								<div class="card">
									<div class="card-header">
										<div class="card-title">[LIVE]</div>
									</div>
									<div class="card-body">
										<h6 class="card-subtitle mb-2 text-muted"><%= t.getMemberNickName() %>의 클래스</h6>
										<p class="card-text">
											<p><%= t.getTutorReport() %></p>

										<div class="notif-icon notif-danger">
											<i class="la la-instagram"></i> <a href="<%= t.getTutorSns() %>" class="card-link">SNS</a>
											<br>
											<i class="la la-instagram"></i> <%= t.getMemberPhone() %>
											
										</div>
										<hr>
									</div>
								
									<div class="card-body">
										<h6 class="card-subtitle mb-2 text-muted">
											강의 소요시간: <span><%= c.getClassTime() %></span>시간
										</h6>
										<h6 class="card-subtitle mb-2 text-muted">
											수강 인원: <span><%= c.getClassTuteeMin() %></span>~<span><%= c.getClassTuteeMax() %></span>명 (최소인원 <span><%= c.getClassTuteeMin() %></span>명)
											<!-- 수강생 현황: <span style="color: red">3</span>/<span>10</span>(명) -->
										</h6>
										<br>

									</div>
								</div>
								<!-- 사이드 / 클래스 신청 -->
								<div class="card">
									<div class="card-header">
										<div class="card-title">My Class Schedule</div>
									</div>
									<div class="scheduleArea">
										<table id="listArea" style="text-align: center;">
											<thead>
												<tr>	
													<th width="20px">NO.</th>
													<th width="150px">예약일자</th>
													<th width="100px">예약시간</th>
													<th width="150px">수강상태</th>
													<th width="150px">등록일</th>
													<th width="80px">수강취소</th>
												</tr>
										 	</thead>
										 	<tbody>
				  							<% if (!s.isEmpty()) { %>
											<% 		for(int i = 0; i < s.size(); i++) { %>
											<tr>	
												<td><%= i + 1 %></td> <%-- rownum의 역할 --%>
												<td><%= s.get(i).getTueeClassRevDate() %></td>
												<td><%= s.get(i).getTueeClassRevTime() %></td>
												<td><%= s.get(i).getTuteeClassStatus().equals("A") ? "수강 전" : s.get(i).getTuteeClassStatus().equals("B") ? "수강 완료" : "수강 취소"%></td>
												<td><%= s.get(i).getTuteeClassEnrollDate() %></td>
												<% if (s.get(i).getTuteeClassStatus().equals("A")) { %>
												<td><input type="button" class="cancelBtn" name="cancel" value="취소"></td>
												<td hidden="hidden"><%= s.get(i).getTuteeClassNo() %></td>
												<% } %>
											</tr>	
											<% 		} %>
											<% } %>	 
										 	</tbody>
										 	<tfoot>
										 		<tr><th colspan="6"><hr></th></tr>
										 		<tr>
										 			<th colspan="6">수강료: <%= c.getClassFee() %>원</th>
										 		</tr>
										 		<tr><th colspan="6"><br></th></tr>
										 	</tfoot>
										</table>
									</div>
<%-- 									<div class="form-group">
										<div class="apply-class">
											<form action="<%= request.getContextPath() %>/applyClass.te" method="post"  onsubmit="return check();">
												<label for="exampleFormControlSelect1">클래스 일정 &nbsp;</label> 
												<input type="text" id="datepicker" name="date" required readonly style="background: white;">
												<small id="imageHelp" class="form-text text-muted">수강을 원하시는 날짜를 선택해주세요(최대 1개)</small> <br> 
												
												<label for="exampleFormControlSelect1">강의 시간 선택 &nbsp;</label> 
												<select id="time" name="time" style="width: 100px;">
												<% for (int i = 0; i < s.size(); i++) { %>
												<% 		if (s.size() > 1 && i != 0 && s.get(i-1).getSchduleTime().equals(s.get(i).getSchduleTime())) { %>
																								
												<% 		} else { %>
															<option class="timeOption" value="<%= s.get(i).getSchduleTime() %>"><%= s.get(i).getSchduleTime() %></option>
												<% 		} %>
												<% } %>
												</select>
												<small id="imageHelp" class="form-text text-muted">수강을 원하시는 시간을 선택해주세요(최대 1개)</small> <br>
												
												<input type="hidden" name="cNo" value="<%= c.getClassNo() %>">
												<div id="price">
													<label for="exampleFormControlSelect1">수강료 &nbsp;</label> 
													<input placeholder="<%= c.getClassFee() %>원" disabled>
													<small id="imageHelp" class="form-text text-muted">수강료는 이미 책정된 내역으로 변경할 수 없습니다.</small> 
												
													<br><br><br>
												</div>	
												<div align="center">
													<input type="submit" id="btnSub" value="신청">
												</div>
												<br>
											</form>
										</div> --%>
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
	
	<%-- 클래스 공지사항 연결 --%>
	
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
								style="background-image: url(assets/images/baking.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(ssets/images/baking2.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(ssets/images/camera.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(assets/images/camera3.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(assets/images/camera4.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(assets/images/florist.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(assets/images/florist2.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(assets/images/florist3.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(assets/images/florist4.jpg)"></div>
							<div class="swiper-slide"
								style="background-image: url(assets/images/painting.jpg)"></div>
						</div>
						<!-- Add Pagination -->
						<div class="swiper-pagination"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

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
			var cNo = $('#cNo');
			
			$.ajax({
				url: 'likeList.te',
				data: {memberEmail:memberEmail},
				type: 'POST',
				success: function(data){
					console.log(data);
					for(var j in data) {
						var likedCNo = data[j].classNo;
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

 
	
</script>
</body>
</html>