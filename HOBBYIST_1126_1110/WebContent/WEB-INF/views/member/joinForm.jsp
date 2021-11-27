<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/css.jsp" %>
<!-- <script src="../../../js/jquery-3.6.0.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 마이페이지 - 회원가입 -->

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Landing PAGE Html5 Template">
    <meta name="keywords" content="landing,startup,flat">
    <meta name="author" content="Made By GN DESIGNS">


    <title>회원가입 페이지</title>

    <!-- // PLUGINS (css files) // -->

    <link href="./js/plugins/bootsnav_files/css/animate.css" rel="stylesheet">
    <link href="./js/plugins/bootsnav_files/css/bootsnav.css" rel="stylesheet">
    <link href="./js/plugins/bootsnav_files/css/overwrite.css" rel="stylesheet">
    <link href="./js/plugins/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="./js/plugins/owl-carousel/owl.theme.css" rel="stylesheet">
    <link href="./js/plugins/owl-carousel/owl.transitions.css" rel="stylesheet">
    <link href="./js/plugins/Magnific-Popup-master/Magnific-Popup-master/dist/magnific-popup.css" rel="stylesheet">

    <!--// ICONS //-->

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!--// BOOTSTRAP & Main //-->

    <link href="./css/bootstrap.min2.css" rel="stylesheet">
    <link href="./css/main_join.css" rel="stylesheet">
    

</head>

<!-- 추가한 css -->
<style>
	#joinForm{
		width:470px;
	}

	input #emailCheckBtn {
		background-color: lightgray;
	}
	
	div > td {
		
	}

.econfirm {border-radius:5px; background:#9ED4C2; color:white; font-size:small;}
.page-header {background:#9ED4C2;}
</style>


<body>

    <div class="page-preloader">
        <div class="spinner">
            <div class="rect1"></div>
            <div class="rect2"></div>
            <div class="rect3"></div>
            <div class="rect4"></div>
            <div class="rect5"></div>
        </div>
    </div>

    
    <!--//** Banner**//-->

    <section id="home">
        <div class="container">
            <div class="row">
            
                <!-- Introduction -->

                <div class="col-md-6 caption">
                    <h1>Welcome To Hobbyist</h1>
                    <h2>
                       	   하비스트<span class="animated-text"></span><span class="typed-cursor"></span>
                    </h2>

                    <p>맞춤형 원데이 클래스 사이트</p>
					
                    <a href="<%=request.getContextPath() %>" class="btn btn-transparent">Main Page로 이동</a>

                </div>

                <!-- Sign Up -->

                <div class="col-md-5 col-md-offset-1">
                    <form class="signup-form" action="<%=request.getContextPath() %>/join.me" method="post" id="joinForm" name="joinForm" onsubmit="return checkForm();">
                    <div class="form-group">
                    	<label id="memberE"><b>EMAIL<b></b></label>
                        <input type="email" id="email" class="form-control" name="memberEmail" placeholder="사용하실 이메일을 입력하세요" required="required"><br>
                        <input type="button" id="emailCheck" class="form-control" value="이메일 인증">&nbsp;
                        <input type="text" id="code" class="form-control" required="required" placeholder="인증 코드를 입력하세요.">
                    </div>
                    <div class="form-group">
                       	<label id="memberE"><b>INFORMATION<b></b></label>
                        <input type="text" class="form-control" placeholder="이름을 입력하세요" name="memberName" required="required"><br>
                        <input type="text" id="memberNickName" class="form-control" placeholder="닉네임을 입력하세요" name="memberNickName" required="required">
                        <div><span id="NickNameCheckResult"></span></div><br>
                        <input type="text" id="memberPhone" class="form-control" placeholder="전화번호를 입력하세요(-포함)" name="memberPhone" required="required">
                        <div><span id="phoneResult"></span></div>
                    </div>
                    <div class="form-group">
                      	<label id="memberE"><b>PASSWORD<b></b></label>
                        <input type="password" id="joinPwd" class="form-control" placeholder="비밀번호를 입력하세요" name="memberPwd" required="required">
                        <div><span id="pwd1Result"></span></div><br>
                        <input type="password" id="checkPwd"class="form-control" placeholder="비밀번호를 확인해주세요" name="memberPwd" required="required">
                        <div><span id="pwd2Result"></span></div>
              		</div>
                        
                            
<!--                             <input type="button" class="econfirm" value="인증 번호 받기" onclick="emailAuthentication()">&nbsp; -->
<!--                            <input type="button" class="econfirm" value="인증 번호 확인" onclick="authCodeCheck()">  -->
<!--                             <br><br> -->
<!--                            <input type="password" class="form-control" placeholder="인증번호를 입력하세요" name="authenticNo" required="required"> -->
                        <br>
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-blue btn-block" style="background-color: #9ED4C2;">회원가입</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
  
  



    <!--======================================== 

           Footer

    ========================================-->


	<div class="footer_section layout_padding">
		<div class="container">
			<div class="footer_logo">
				<a href="index.jsp"><img src="assets/images/hlogo.png"
					style="width: 120px"></a>
			</div>
			<div class="input_bt">
				<input type="text" class="mail_bt" placeholder="Your Email"
					name="Your Email"> <span class="subscribe_bt"
					id="basic-addon2"><a href="#">Subscribe</a></span>
			</div>
			<div class="footer_menu">
				<ul>
					<li><a href="#">Introduction</a></li>
					<li><a href="#">Income</a></li>
					<li><a href="#">Class Application</a></li>
					<li><a href="admin/faq.jsp">FAQ</a></li>
					<li><a href="#">Customer Service</a></li>
				</ul>
			</div>
			<div class="location_main">
				HOBBYIST HOT LINE : <a href="#">+82 2 1234 5678</a>
			</div>
		</div>
	</div>
	
	<!-- copyright section start -->
	<div class="copyright_section">
		<div class="container">
			<p class="copyright_text">
				© 2021 All Rights Reserved. Design by <a href="index.jsp">HOBBYIST</a>
			</p>
		</div>
	</div>


    <!--======================================== 

           Modal

    ========================================-->



    <!-- Modal -->

<!--     <div class="modal fade" id="SignIn" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"> -->
<!--         <div class="modal-dialog" role="document"> -->
<!--             <div class="modal-content"> -->
<!--                 <div class="modal-header"> -->
<!--                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
<!--                     <h4 class="modal-title text-center" id="myModalLabel">Sign In</h4> -->
<!--                 </div> -->
<!--                 <div class="modal-body"> -->
<!--                     <form class="signup-form"> -->
<!--                         <div class="form-group"> -->
<!--                             <input type="text" class="form-control" placeholder="User Name" required="required"> -->
<!--                         </div> -->

<!--                         <div class="form-group"> -->
<!--                             <input type="text" class="form-control" placeholder="Password" required="required"> -->
<!--                         </div> -->
<!--                         <div class="form-group text-center"> -->
<!--                             <button type="submit" class="btn btn-blue btn-block">Log In</button> -->
<!--                         </div> -->
<!--                     </form> -->
<!--                 </div> -->
<!--                 <div class="modal-footer text-center"> -->
<!--                     <a href="#">Forgot your password /</a> -->
<!--                     <a href="#">Signup</a> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
    
    <script>
    //필요 변수 선언
    var isUsable = false;		// form 제출 가능 여부
    var isPhoneChecked = false; // 폰 체크 여부
    var phone = document.getElementById('memberPhone');
    
    var isEmailChecked = false; // 이메일 체크 여부
	
    var isNickChecked = false;	// 닉네임 체크 여부
	var nickName = document.getElementById('nickName');
	
    
 	 //휴대폰번호 양식 체크
	$('#memberPhone').on('change paste keyup', function(){ // 연락처에 입력사항이 변경, 붙여넣기, 키업 이벤트가  발생했을 경우 
		isPhoneChecked = false; // false로 초기화
	});
	
	$('#memberPhone').on('change', function(){
		var regExpPhone = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
		
		if (memberPhone.value.trim() == '' || memberPhone.value.trim().length == 0) {
			$('#phoneResult').text('');
			isUsable = true;
			isPhoneChecked = true;
		} else if (!regExpPhone.test($(this).val().trim())) {
			$('#phoneResult').text('형식에 맞지 않는 전화번호입니다.');
			$('#phoneResult').css('color', 'red');
			isUsable = false;
			isPhoneChecked = false;
		} else {
			$('#phoneResult').text('사용 가능합니다.');
			$('#phoneResult').css('color', 'green');
			isUsable = true;
			isPhoneChecked = true;
		}
	});
	
	//비밀번호 체크
	
	var pwd1 = $('#joinPwd');  //가입시 입력하는 pwd
	var pwd2 = $('#checkPwd'); //비밀번호 확인
	var pwd1Result = $('#pwd1Result'); //pwd1이 양식에 맞는지 표시할 영역
	var pwd2Result = $('#pwd2Result'); //pwd2가 양식에 맞는지 표시할 영역
	var pwd1Val; 
	
	$('#joinPwd').keyup(function(e){

		pwd1Val = $(this).val();
		
		var pwd1Reg = /^[a-zA-Z][a-zA-Z0-9!*$]{8,12}/gi;
		
		if(pwd1Reg.test(pwd1Val) === true){
			if(pwd1Val.length < 8 || pwd1Val.length > 12 || pwd1Val.length == '') {
				pwd1Result.css('color', 'red').text('8~12자리까지 입력해주세요.')
				check = false;
			} else {
				pwd1Result.css('color', 'green').text('사용할 수 있는 비밀번호 입니다')
				check = true;
			}
		} else {
			pwd1Result.css('color', 'red').text('형식에 맞지 않는 비밀번호 입니다');
				check = false;
		}
	});
	
	// 비밀번호 확인
	$('#checkPwd').keyup(function(e){
		
		var pwd2Val = $(this).val();
		
		if(pwd2Val !== pwd1Val) {
			pwd2Result.css('color', 'red').text('입력하신 비밀번호와 일치하지 않습니다');
		} else {
			pwd2Result.css('color', 'green').text('입력하신 비밀번호와 일치합니다')
		}
	});
		
	// 닉네임 중복 체크
	
	$('#memberNickName').on('change', function(){
	
		$.ajax({
			url : 'checkNick.me',
			data : {inputNickName : $('#memberNickName').val()},
			type : 'POST',
			success : function(data){
				console.log(data);
				
				if(data.trim() == '0'){
					$('#NickNameCheckResult').text('사용 가능한 닉네임입니다').css({'color':'green'})
				} else {
					$('#NickNameCheckResult').text('중복된 닉네임입니다').css({'color':'red'})
				} 
				
				if($('#memberNickName').val() == ''){
					$('#NickNameCheckResult').text('사용할 닉네임을 입력해 주세요').css({'color':'red'})
				}
				
			},
			error : function(data){
				console.log(data);
				
			}
		})
	});
	
	function updateValidate(){
		if(isUsable && isNickChecked && isPhoneChecked) {
			return true;
		} else if (!isNickChecked && nickName.value.trim() != originNickName.trim()) {
			alert('닉네임을 확인해주세요.');
			nickName.focus();
			return false;
		} else if (!isPhoneChecked && phone.value.trim() != originPhone.trim()) {
			if (!(phone.value.trim() == '' || phone.value.trim().length == 0)) {
				alert('휴대폰 번호 형식을 확인해주세요.');
				phone.focus();
				return false;
			}
		} 
		return true;
	}	
    
	// 이메일 인증
	var code = ''; 
	
	$('#emailCheck').on('click', function(){
		$emailCheck = $(this);
		
		alert('입력하신 이메일로 인증코드를 전송하였습니다. 인증코드를 입력해주세요.');
		$.ajax({
			url: 'confirmMail.me',
			data: {email:$('#email').val()},
			success: function(data){
				code = data.trim();
				$('#code').focus();
			},
			error: function(data){
				console.log(data);
			}
		});
	});
	
	function checkForm() {
		if ($('#code').val() != code.trim()) {
			alert('인증 코드를 확인해주세요.');
			return false;
		} 
		return true;
	}
    
    </script>
        
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed -->

    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/plugins/owl-carousel/owl.carousel.min.js"></script>
    <script src="./js/plugins/bootsnav_files/js/bootsnav.js"></script>
    <script src="./js/plugins/typed.js-master/typed.js-master/dist/typed.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="./js/plugins/Magnific-Popup-master/Magnific-Popup-master/dist/jquery.magnific-popup.js"></script>
    <script src="./js/main_join.js"></script>
</body>
</html>
