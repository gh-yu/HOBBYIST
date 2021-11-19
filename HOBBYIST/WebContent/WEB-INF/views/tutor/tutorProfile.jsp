<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="outer">
		<br>
		<h2 align="center">튜터 프로필 수정하기</h2>
		
		<form action="<%= request.getContextPath() %>/" method="post" id="updateProfileForm" name="updateProfileForm" onsubmit="return send();">
			<table>
				<tr>
					<td><label>수강명</label></td>
					<td><input type="text" name="study" id="userPwd"></td>
				</tr>
				<tr>
					<td><label>자기소개</label></td>
					<td><input type="text" name="introduce"></td>
				</tr>
			</table>
			
			<br><br>
			
			<div class="btns" align="center">
				<input id="updatePwdBtn" type="submit" value="수정 완료">
				<input type="button" id="cancelBtn" onclick="location.href='javascript:history.back();'" value="취소하기">
			</div>
		</form>
	</div>
</body>
</html>