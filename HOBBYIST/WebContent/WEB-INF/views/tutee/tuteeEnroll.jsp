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
<style>
/*튜터 프로필 사진*/
.tutorPro{width:100px; height:100px;}
#target_img{width:100px; height:100px; cursor:pointer;}

/*튜터 신청 박스*/
@import url('https://fonts.googleapis.com/css?family=Noto+Sans:400,400i,700,700i&subset=greek-ext');

body{
	background-position: center;
    background-origin: content-box;
    background-repeat: no-repeat;
    background-size: cover;
	min-height:100vh;
	font-family: 'Noto Sans', sans-serif;
}
.text-center{
	color:#fff;	
	text-transform:uppercase;
    font-size: 35px;
    margin: -40px 0 40px 0;
    display: block;
    text-align: center;
}
.box{
	position:absolute;
	left:45%; /* sign-in 박스 위치 조절 */
	top:50%; /* sign-in 박스 위치 조절 */
 	transform: translate(-115%,-50%); 
    background-color: rgba(0, 115, 14, 0.19);
	border-radius: 15px;
	padding:70px 90px; /* 박스 사이즈 조절 */
}
.input-container{
	position:relative;
	margin-bottom:25px;
}
.input-container label{
	position:absolute;
	top:0px;
	left:0px;
	font-size:16px;
	color:#fff;	
    pointer-event:none;
	transition: all 0.5s ease-in-out;
}
.input-container input{ 
  border:0;
  border-bottom:1px solid #555;  
  background:transparent;
  width:100%;
  padding:8px 0 5px 0;
  font-size:16px;
  color:#fff;
}
.input-container input:focus{ 
 border:none;	
 outline:none;
 border-bottom:1px solid #9ED4C2;	
}
.btn{
	color:#fff;
	background-color:#9ED4C2;
	outline: none;
    border: 0;
    color: #fff;
	padding:10px 20px;
	text-transform:uppercase;
	margin-top:50px;
	border-radius:2px;
	cursor:pointer;
	position:relative;
}
/*.btn:after{
	content:"";
	position:absolute;
	background:rgba(0,0,0,0.50);
	top:0;
	right:0;
	width:100%;
	height:100%;
}*/
.input-container input:focus ~ label,
.input-container input:valid ~ label{
	top:-12px;
	font-size:12px;
	
}


.off-canvas-content{
	text-align:center;
	/* border: 1px solid black; */
}
.box1{
	/* border: 1px solid black; */
	width: 50%;
	min-height: 900px;
	float:left;
	}
.box2{
	/* border: 1px solid black; */
	width: 49%;
	height: 900px;
	float:left;
	overflow: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
}
.imgresponsive{
	height:900px;
}

/*sign up 박스*/


</style>

</head>
<body>
			
			<!-- 본문 영역 -->
			<div class="app-dashboard-body-content off-canvas-content" data-off-canvas-content>
				<div class="box1">
				<form action="<%=request.getContextPath()%>/insertTutee.me" method="post" encType="multipart/form-data" onsubmit="return check();">
						<div class="box">	<!-- sign in 박스 시작 -->
							<span class="text-center">TUTOR SIGN-IN</span>
							<div class="tutorPro">
							<img id="target_img" name="target_img" class="card-profile-stats-intro-pic" src="./images/empty_profile.png" alt="profile-image" />
							</div><br>
						<div class="input-container">
							<%=m.getMemberNickName() %>
							<input type="hidden" name="myNickName" required value="<%=m.getMemberNickName() %>">
							<label>Nick Name</label>		
						</div>
						<div class="input-container">
							<%=m.getMemberPhone() %>		
							<input type="hidden" name="myPhone" required value="<%=m.getMemberPhone() %>">
							<label>Phone</label>
						</div>
						<div class="input-container">		
							<input type="text" name="mySns">
							<label>SNS</label>
						</div>
						<div class="input-container">		
							<input type="text" name="myReport" required/>
							<label>Introduce</label>
						</div>
						
							<button type="submit" class="btn">등록하기</button>
							
					<!-- 파일 업로드 하는 부분 -->
							<div id="fileArea">
								<input type="file" id="profileImg" multiple="multiple" name="profileImg" onchange="LoadImg(this,1)" >
							</div>
						
					</div>	<!-- sign in 박스 끝 -->
				</form>
				
				</div> <!-- box1 끝 -->
					
				<div class="box2" style="position: relative;">
					<img src="./images/flower.png" alt="" class="imgresponsive">
					
						<div align="center" style="display: inline-block;">
							<a href="<%=request.getContextPath() %>/myInfo.me" class="btn btn-blue btn-transparent" 
							style="background: lightgray; color: black; position: absolute; top: 75%; left: 50%;transform: translate( -50%, -50% ); ">My Page로 이동</a>
						</div>
							
				</div> <!-- box2 끝 -->
				
				</div>	<!-- box1+box2끝 -->
		
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