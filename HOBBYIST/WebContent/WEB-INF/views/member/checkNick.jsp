<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
	<div align="center">
		<b style="color: gray">닉네임 중복 확인</b>
	
		<h2><%= msg %></h2>
		
		<input type="button" id="confirmBtn" value="확인" onclick="window.close();">
	</div>

</body>
</html>