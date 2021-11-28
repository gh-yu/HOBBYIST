<%@page import="org.apache.catalina.tribes.util.TcclThreadFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="hobbyistClass.model.vo.*, member.model.vo.Member, 
								tutor.model.vo.Tutor, java.util.ArrayList, tutee.model.vo.TuteeClass, classNotice.model.vo.*, java.text.DecimalFormat"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");

	HClass c = (HClass)request.getAttribute("c");
	ArrayList<HClassFile> f = (ArrayList)request.getAttribute("fileList");
	Tutor t = (Tutor)request.getAttribute("tutor");
	System.out.println(t);
	ArrayList<TuteeClass> s = (ArrayList)request.getAttribute("tuteeSchedule");
	ArrayList<ClassNotice> list = (ArrayList)request.getAttribute("list");
	DecimalFormat dc = new DecimalFormat("###,###,###");
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
		background: #CD5C5C /* #6495ED */;
		font-weight: bold;
		cursor: pointer;
		color: white;
		box-shadow: 2px 2px 2px lightgray;
		border: none;
		border-radius: 5px;
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
										<%	if (!list.isEmpty()) { %>	
											
												<%for (int i = 0; i < list.size(); i++) { %>
												
											<% 	if(c.getClassNo() == list.get(i).getClassNo()) {%>
												<tr>
													<td><%=list.get(i).getClassBoardNo()%></td>
													<td><%=list.get(i).getClassBoardName()%></td>
													<td><%=list.get(i).getClassBoardWriter()%></td>
													<td><%=list.get(i).getClassBoardViews()%></td>
													<td><%=list.get(i).getClassBoardDate()%></td>
												</tr>
													<%	check = true; %>
												<% } %>
											<% } %>

										<%	} %>  
									<% if(!check) { %> 
												<tr>
													<td colspan="5">존재하는 공지사항이 없습니다.</td>
												</tr>
									<% } %>
											</tbody>
										</table>
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
									if ($(this).text() != '존재하는 공지사항이 없습니다.') {
										location.href = '<%=request.getContextPath()%>/classNoticedetail.no?cNo='+ num;	
									}
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

										<div class="notif-icon notif-danger">
											<% if (t.getTutorSns() != null) { %>
												<i class="la la-instagram"></i> <a href="<%= t.getTutorSns() %>" class="card-link">SNS</a>
											<% } %>
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
													<th width="120px">수강취소</th>
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
												<td>
													<input type="button" class="cancelBtn" name="cancel" value="취소">
													<input type="hidden" value="<%= s.get(i).getTuteeClassNo() %>">
												</td>
												<% } %>
											</tr>	
											<% 		} %>
											<% } %>	 
										 	</tbody>
										 	<tfoot>
										 		<tr><th colspan="6"><hr></th></tr>
										 		<tr>
										 			<th colspan="6">수강료: <%= dc.format(c.getClassFee()) %>원</th>
										 		</tr>
										 		<tr><th colspan="6"><br></th></tr>
										 		<tr>
										 			<td colspan="6"><a href="<%= request.getContextPath() %>/detail.hcl?cNo=<%= c.getClassNo() %>">
										 			<span style="color: #9ED4C2; font-weight: bolder;">클래스 신청 페이지로 이동</span></a></td>
										 		</tr>
										 		<tr><th colspan="6"><br></th></tr>
										 	</tfoot>
										</table>
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
<!-- 	<div class="row justify-content-center">
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
						Add Pagination
						<div class="swiper-pagination"></div>
					</div>
				</div>
			</div>
		</div>
	</div> -->

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

	$('.cancelBtn').off().on('click', function(){
		$cancelBtn = $(this);
		var tuteeClassNo = $(this).next().val();
		
		if (confirm('정말 취소하시겠습니까?')){
			$.ajax({
				url: 'cancelTClass.te',
				data: {tuteeClassNo: tuteeClassNo},
				type: 'POST',
				success: function(data) {
					console.log(data);
					
					if (data.trim() == '1') {
						$cancelBtn.parent().parent().children().eq(3).html('수강 취소');
						$cancelBtn.remove();
					}
				},
				error: function(data) {
					console.log(data);
				}
				
			});
		}
		
		
		
	});
	
	
	// like-button js, ajax
	$(function() {
		// 화면 로드될때 실행되는 함수, window.onload = function(){}과 같음
		// 로그인이 되어 있고, 클래스리스트가 존재하면 실행
		console.log(<%= t.getMemberStatus() %>);
		if (<%= t.getMemberStatus() %> == 0) {
			console.log(<%= t.getMemberStatus() %>);
			alert('탈퇴한 튜터의 클래스입니다.');
		} else if ('<%= c.getClassStatus().trim() %>' == "C") { 
			alert('튜터의 사정으로 종료된 클래스입니다.');
		}
		
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