<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <html>
    <body>
<form action="<%=request.getContextPath() %>/findIdlogic.me" method="post">
	<table>
	<caption>이메일 찾기</caption>
		<tr>
			<td><input type="text" name="phone" placeholder="전화번호를 입력하세요"></td>
		</tr>
		<tr>
			<td align="center"><input type="submit" value="아이디 찾기"></td>
		</tr>
	</table>
</form>

</body>
</html>