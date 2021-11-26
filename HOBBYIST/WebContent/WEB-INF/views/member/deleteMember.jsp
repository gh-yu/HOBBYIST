<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		background: #9ED4C2; 
	}
	
	
</style>
<%@ include file="../common/css.jsp"%>
</head>
<body>
		<br><br>
		<h1 align="center">정말 탈퇴하시겠습니까?😢</h1>
		<br>
		<div align="center">
			<button class="btn btn-default" onclick="history.back();"><b>취소</b></button> <%-- <%= request.getContextPath() %> --%>
			<button class="btn btn-warning" onclick="location.href='<%= request.getContextPath() %>/deleteConfirm.me'"><b>확인</b></button>
		</div>

</body>
</html>