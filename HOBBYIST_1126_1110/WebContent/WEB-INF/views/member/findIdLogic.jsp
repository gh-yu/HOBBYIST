<%@page import="member.model.dao.MemberDAO, member.model.service.MemberService, java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String phone = request.getParameter("phone");

	String email = new MemberService().findIdByPhone(phone);
	
	if(email != null){
		int index = email.length()-2;
		String tmpId = email.substring(0, 2);// 두글자만 tmpId에 저장
		for(int i = 0; i<index ; i++){
			tmpId += "*";
		}
	}
	PrintWriter script = response.getWriter();
	if(email != null){
		script.println("<script>");
		script.println("alert('회원님의 이메일은 " + email +" 입니다');");
		script.println("history.back()");
		script.println("</script>");
	} else {
		script.println("<script>");
		script.println("alert('일치하는 회원이 없습니다')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	System.out.println(phone);
	System.out.println(email);
	
	request.setAttribute("email", email);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>