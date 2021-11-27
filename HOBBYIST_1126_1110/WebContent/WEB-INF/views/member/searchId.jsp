<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <html>
    <style>
    	table{text-align:center; margin:0 auto;}
    	.phone{
    	margin: 0;
  padding: 0.5rem 1rem;

  font-family: "Noto Sans KR", sans-serif;
  font-size: 1rem;
  font-weight: 400;
  text-align: center;
  text-decoration: none;

  display: inline-block;
  width: auto;

  border: none;
  border-radius: 4px;
   box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);

  cursor: pointer;

  transition: 0.5s;
  }
  button:active,
button:hover,
button:focus {
  background: var(--button-hover-bg-color);
  outline: 0;
}
button:disabled {
  opacity: 0.5;
}
    </style>
    <body>
<form action="<%=request.getContextPath() %>/findIdlogic.me" method="post">
	<table>
	<caption>이메일 찾기</caption><br>
		<tr>
			<td><input type="text" class="phone" name="phone" placeholder="전화번호를 입력하세요"></td>
		</tr>
		<tr>
			<td align="center"><input type="submit" value="아이디 찾기"></td>
		</tr>
	</table>
</form>

</body>
</html>