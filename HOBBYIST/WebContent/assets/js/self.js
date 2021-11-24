
function reservation() {
			location.href = "<%= request.getContextPath() %>/tutorClass.tu";
		}
		
		
		$('#beforeClass').hover(function() {
			$(this).css({
				'cursor' : 'pointer'
			})
		}).click(function() {
			location.href='<%=request.getContextPath()%>/beforeClass.cl';
		})
		
		$('#onClass').hover(function() {
			$(this).css({
				'cursor' : 'pointer'
			})
		}).click(function() {
			location.href='<%=request.getContextPath()%>/onClass.cl';
		})
		
		$('#closeClass').hover(function() {
			$(this).css({
				'cursor' : 'pointer'
			})
		}).click(function() {
			location.href='<%=request.getContextPath()%>/closeClass.cl';
		})
		
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

	/* 좋아요 버튼 */
	$(function() {
		$('.button-like').bind('click',
				function(event) {
					$(this).toggleClass("liked");
				});
	});
	

	$(function() {
		
			var cNo = $('.cNo');
			
			$.ajax({
				url: 'likeList.te',
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
	});
	
	$('.button-like').bind('click', function(event) {
		
				$likeBtn = $(this);
				var likeStatus = $(this).attr('class'); 
				
				var cNo = $(this).prev().val();
				
			   	if (likeStatus.includes('liked')) { 
				
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
	});
	
	
				$('#listArea td').mouseenter(function(){
					$(this).parent().css({'background':'#9ED4C2', 'font-weight' :'bold', 'color' : 'white'});
				}).mouseout(function(){
					$(this).parent().css({'background':'none', 'font-weight' :'normal', 'color' : 'black'});
				});
				
				
				$('.APV').on('click', function(){
					if(confirm('클래스를 승인하시겠습니까?')){
						
						//변수는 $.ajax밖에서 선언하기!!! ajax안에서 선언하면 ajax자체가 선택됨
						$btn = $(this);
						
						console.log($btn);
						console.log($btn.value);
						
						$.ajax({
							url: 'confirmClass.cl',
							data : {classNo:$(this).parent().parent().parent().find('input[name=classNo]').val()},
							success : function(data){
								console.log(data);
								
								$btn.parent().parent().parent().find('span').text('Y');															
// 	참고용) 실행안됨					$(this).parent().parent().find('span').text('Y'); 

							},
							error: function(data){
								console.log(data);
							}
						});
					}
				});
			
				
				$('.REJECT').on('click', function(){
												
					if(confirm('클래스를 반려하시겠습니까?')){
	
						$btn = $(this);
	
						$.ajax({
							url: 'rejectClass.cl',
							data : {classNo:$btn.parent().parent().parent().find('input[name=classNo]').val()},
							success : function(data){
								
// 								if($btn.parent().parent().find('input[name=classApnYn]').val() =='N'){
// 									console.log($btn.parent().parent().find('input[name=classApnYn]').val());
									console.log('반려성공');
									console.log(data);
									$btn.parent().parent().parent().find('span').text('C');
								
// 								} else {
// 									alert('이미 승인하거나 반려한 클래스는 다시 반려할 수 없습니다.');
// 								}
							},
							error: function(data){
								console.log('반려실패');
							}
						});
					}		
				});
			
	