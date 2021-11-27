<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../common/css.jsp"%>
<style>
	#searchId{
		width: 500px;
	}
	
	#insertPhoneNo{
		width: 400px;
	}
	
	#btnArea{
		width: 100px;
	}
	
	#submitBtn{
		background: #9ED4C2;
		border: 1px solid #9ED4C2;
		height: 32px;
	}
</style>
<title>Email 찾기</title>
</head>
<body>
	<!-- 메인 화면 -->
	<!-- 로그인하지 않은 유저는 사이드 바 없음 -->

	<div class="row justify-content-md-center">
		<div class="col-md-10">
		
<!-- 			<div class="content"> -->
				<div class="container-fluid">
				
					<h4 class="page-title"></h4>
					<h4 class="page-title">Search EMAIL</h4>
				<hr>
				<div>
					<h4><b>휴대폰 번호를 입력하세요</b></h4>
					<form action="<%=request.getContextPath() %>/findIdlogic.me" method="post">
						<table id="searchId">
							<tr>
								<th>
									<input type="text" id="insertPhoneNo" name="phone" placeholder="-포함하여 입력(ex. 010-1234-5678)">
								</th>
								<th id="btnArea" >
									<input type="submit" id="submitBtn" value="Email 찾기">
								</th>
							</tr>
						</table>
					</form>	
				</div>
			</div>
<!-- 		</div> -->
	</div>	
	</div>
<%-- 	<%@ include file="../common/js.jsp"%>	 --%>
</body>
</html>