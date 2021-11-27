<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member m = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>튜터 신청하기 페이지</title>
<!-- CDN -->
<script src="js/jquery-3.6.0.min.js"></script>
<!-- Compressed CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/foundation-sites@6.7.4/dist/css/foundation.min.css" crossorigin="anonymous">
<!-- foundation-float.min.css: Compressed CSS with legacy Float Grid -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/foundation-sites@6.7.4/dist/css/foundation-float.min.css" crossorigin="anonymous">

<!-- foundation-prototype.min.css: Compressed CSS with prototyping classes -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/foundation-sites@6.7.4/dist/css/foundation-prototype.min.css" crossorigin="anonymous">

<!-- foundation-rtl.min.css: Compressed CSS with right-to-left reading direction -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/foundation-sites@6.7.4/dist/css/foundation-rtl.min.css" crossorigin="anonymous">
<!-- Compressed JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/foundation-sites@6.7.4/dist/js/foundation.min.js" crossorigin="anonymous"></script>

<style>
/*튜터 프로필 사진*/
.tutorPro{width:100px; height:100px;}
#target_img{width:100px; height:100px; cursor:pointer;}



.login-box {
  box-shadow: 0 2px 4px rgba(10, 10, 10, 0.4);
  background: #9ed4c2;
  border-radius: 20;
  overflow: hidden;
}


 @media screen and (max-width: 39.9375em) { 
   .login-box .or {
     top: 85%;
   }
    } 

.login-box-title {
  font-weight: 400;
  font-size: 2rem;
  margin-bottom: 1.75rem;
  text-align: center;
}

.login-box-form-section,
.login-box-social-section-inner {
  padding: 15.5rem;
}

.login-box-social-section {
  background: url("./images/tutor.png");
  background-size: cover;
  background-position: center;
}

.login-box-input {
  margin-bottom: 1.25rem;
  height: 2rem;
  border: 0;
  padding-left: 0;
  box-shadow: none;
  border-bottom: 1px solid #9ed4c2;
  font-weight: 300;
}

.login-box-input:focus {
  color: #66CC99;
  transition: 0.2s ease-in-out;
  box-shadow: none;
  border: 0;
  border-bottom: 2px solid #9ed4c2;
}

.login-box-submit-button {
  display: inline-block;
  vertical-align: middle;
  margin: 0 0 1rem 0;
  padding: 0.85em 1em;
  -webkit-appearance: none;
  border: 1px solid transparent;
  border-radius: 0;
  transition: background-color 0.25s ease-out, color 0.25s ease-out;
  font-size: 0.9rem;
  line-height: 1;
  text-align: center;
  cursor: pointer;
  background-color: #9ED4C2;
  color: #fefefe;
  display: block;
  width: 100%;
  margin-right: 0;
  margin-left: 0;
  border-radius: 0;
  text-transform: uppercase;
  margin-bottom: 0;
}

[data-whatinput='mouse'] .login-box-submit-button {
  outline: 0;
}

.login-box-submit-button:hover, .login-box-submit-button:focus {
  background-color: #99CC99;
  color: #fefefe;
}

.login-box-submit-button:hover,
.login-box-submit-button:focus {
  box-shadow: 0 2px 4px rgba(10, 10, 10, 0.4);
}

.login-box-submit-button:active {
  box-shadow: 0 1px 2px rgba(10, 10, 10, 0.4);
}

.login-box-main-button {
  display: inline-block;
  vertical-align: middle;
  margin: 0 0 1rem 0;
  padding: 0.85em 1em;
  -webkit-appearance: none;
  border: 1px solid transparent;
  border-radius: 0;
  transition: background-color 0.25s ease-out, color 0.25s ease-out;
  font-size: 0.9rem;
  line-height: 1;
  text-align: center;
  cursor: pointer;
  background-color: #9ED4C2;
  color: #fefefe;
  display: block;
  width: 100%;
  margin-right: 0;
  margin-left: 0;
  font-weight: 500;
  margin-bottom: 1.25rem;
  text-transform: uppercase;
}

[data-whatinput='mouse'] .login-box-main-button {
  outline: 0;
}

.login-box-main-button:hover, .login-box-main-button:focus {
  background-color: #99CC99;
  color: #fefefe;
}

.login-box-mypage-button {
  display: inline-block;
  vertical-align: middle;
  margin: 0 0 1rem 0;
  padding: 0.85em 1em;
  -webkit-appearance: none;
  border: 1px solid transparent;
  border-radius: 0;
  transition: background-color 0.25s ease-out, color 0.25s ease-out;
  font-size: 0.9rem;
  line-height: 1;
  text-align: center;
  cursor: pointer;
  background-color: #9ED4C2;
  color: #fefefe;
  display: block;
  width: 100%;
  margin-right: 0;
  margin-left: 0;
  font-weight: 500;
  margin-bottom: 1.25rem;
  text-transform: uppercase;
}

[data-whatinput='mouse'] .login-box-mypage-button {
  outline: 0;
}

.login-box-mypage-button:hover, .login-box-mypage-button:focus {
  background-color: #99CC99;
  color: #fefefe;
}

.login-box-button-faq-btn {
  display: inline-block;
  vertical-align: middle;
  margin: 0 0 1rem 0;
  padding: 0.85em 1em;
  -webkit-appearance: none;
  border: 1px solid transparent;
  border-radius: 0;
  transition: background-color 0.25s ease-out, color 0.25s ease-out;
  font-size: 0.9rem;
  line-height: 1;
  text-align: center;
  cursor: pointer;
  background-color: #9ED4C2;
  color: #fefefe;
  display: block;
  width: 100%;
  margin-right: 0;
  margin-left: 0;
  font-weight: 500;
  margin-bottom: 1.25rem;
  text-transform: uppercase;
}

[data-whatinput='mouse'] .login-box-button-faq-btn {
  outline: 0;
}

.login-box-button-faq-btn:hover, .login-box-button-faq-btn:focus {
  background-color: #99CC99;
  color: #fefefe;
}

[class*="login-box-button-"]:hover,
[class*="login-box-button-"]:focus {
  box-shadow: 0 2px 4px rgba(10, 10, 10, 0.4);
}

.login-box-social-headline {
  display: block;
  margin-bottom: 2.5rem;
  font-size: 1.875rem;
  color: #fefefe;
  text-align: center;
}


</style>

</head>
<body>
<div class="login-box2">
  <div class="row collapse expanded">
    <div class="small-12 medium-6 column small-order-2 medium-order-1">
    <form action="<%=request.getContextPath()%>/insertTutee.me" method="post" encType="multipart/form-data" onsubmit="return check();">
      <div class="login-box-form-section">
        <h1 class="login-box-title">TUTOR<br> SIGN-IN</h1>
        <div class="tutorPro">
		<img id="target_img" name="target_img" class="card-profile-stats-intro-pic" src="./images/empty_profile.png" alt="profile-image" />
		</div><br>
		<!-- 파일 업로드 하는 부분 -->
		<div id="fileArea">
		<input type="file" id="profileImg" multiple="multiple" name="profileImg" onchange="LoadImg(this,1)">
		</div>
        <input class="login-box-input" type="text" name="username" value="<%=m.getMemberNickName() %>" readonly/>
        <input class="login-box-input" type="email" name="email" value="<%=m.getMemberEmail() %>" readonly />
        <input class="login-box-input" type="text" name="mySns" placeholder="sns계정 입력" />
        <input class="login-box-input" type="text" name="myReport" placeholder="간단한 자기소개 입력" />
        <input class="login-box-submit-button" type="submit" name="btn" value="Sign me up" />
      </div>
      </form>
    </div>
    <div class="small-12 medium-6 column small-order-1 medium-order-2 login-box-social-section">
      <div class="login-box-social-section-inner">
        <span class="login-box-social-headline">Be a<br> HOBBYIST's<br/>Tutor</span>
        <a class="login-box-main-button" href="<%=request.getContextPath() %>">MAIN PAGE로 이동하기 </a>
        <a class="login-box-mypage-button" href="<%=request.getContextPath() %>/myInfo.me">MY PAGE로 이동하기</a>
        <a class="login-box-button-faq-btn" href="<%=request.getContextPath() %>/FAQ.bo">FAQ로 이동하기</a>
      </div>
    </div>
  </div>
</div>








<!-- <div class="app-dashboard shrink-medium"> -->
	
<!-- 			<!-- 본문 영역 --> 
<!-- 			<div class="app-dashboard-body-content off-canvas-content" data-off-canvas-content> -->
<!-- <!-- 				<div class="box1"> --> 
<%-- 				<form action="<%=request.getContextPath()%>/insertTutee.me" method="post" encType="multipart/form-data" onsubmit="return check();"> --%>
<!-- 						<div class="box">	sign in 박스 시작 -->
<!-- 							<span class="text-center">TUTOR SIGN-IN</span> -->
<!-- 							<div class="tutorPro"> -->
<!-- 							<img id="target_img" name="target_img" class="card-profile-stats-intro-pic" src="./images/empty_profile.png" alt="profile-image" /> -->
<!-- 							</div><br> -->
<!-- 						<div class="input-container"> -->
<%-- 							<%=m.getMemberNickName() %> --%>
<%-- 							<input type="hidden" name="myNickName" required value="<%=m.getMemberNickName() %>"> --%>
<!-- 							<label>Nick Name</label>		 -->
<!-- 						</div> -->
<!-- 						<div class="input-container"> -->
<%-- 							<%=m.getMemberPhone() %>		 --%>
<%-- 							<input type="hidden" name="myPhone" required value="<%=m.getMemberPhone() %>"> --%>
<!-- 							<label>Phone</label> -->
<!-- 						</div> -->
<!-- 						<div class="input-container">		 -->
<!-- 							<input type="text" name="mySns"> -->
<!-- 							<label>SNS</label> -->
<!-- 						</div> -->
<!-- 						<div class="input-container">		 -->
<!-- 							<input type="text" name="myReport" required/> -->
<!-- 							<label>Introduce</label> -->
<!-- 						</div> -->
						
<!-- 							<button type="submit" class="btn">등록하기</button><br> -->
							
<!-- 					파일 업로드 하는 부분 -->
<!-- 							<div id="fileArea"> -->
<!-- 								<input type="file" id="profileImg" multiple="multiple" name="profileImg" onchange="LoadImg(this,1)" > -->
<!-- 							</div> -->
<!-- 					</div>	sign in 박스 끝 -->
<!-- 				</form> -->
<!-- 				</div> box1 끝 -->
					
<!-- 				<div class="box2"> -->
<!-- 					<img src="./images/flower.png" alt="" class="imgresponsive"> -->
<!-- 				</div> box2 끝 -->
				
<!-- 				</div>	box1+box2끝 -->
<!-- 					<br> -->
<!-- 			</div> -->
<!-- 				<div align="center"> -->
<%-- 					<a href="<%=request.getContextPath() %>/myInfo.me" class="btn">My Page로 이동</a> --%>
<!-- 				</div> -->
				
				
<!-- 기능 -->				
<script>
// 프로필 사진
	$(function(){
			$('#fileArea').hide();
			
			$('#target_img').click(function(){
				$('#profileImg').click();
			});
		});
	
	
	function LoadImg(value, num){
		if(value.files && value.files[0]){
				var reader = new FileReader();
					reader.onload = function(e){								
						if(num==1){
							$("#target_img").attr("src", e.target.result);
						} else if(num==2){
							$("#target_img2").attr("src", e.target.result);
						}
						}
// 					switch(num){
// 					case 1:
// 						$("#target_img").attr("src", e.target.result);
// 						break;
// 					case 2:
// 						$("#target_img2").attr("src", e.target.result);
// 						break;
// 					}
					
						reader.readAsDataURL(value.files[0]);
					}
				}
	
// 	function LoadImg(value, num){
// 			if(value.files && value.files[0]){
// 					var reader = new FileReader();
							
// 						reader.onload = function(e){								
// 							if(num){
// 								$("#target_img").attr("src", e.target.result);
// 							} else{
							
// 							}
// 							}
							
// 							reader.readAsDataURL(value.files[0]);
// 						}
// 					}
	
	
	function check() {
		if ($('#profileImg').val() == '') {
			alert('프로필이미지는 필수 입력사항입니다.');
			return false;
		}
		return true;
		
	}
</script>	
	

</body>
</html>