<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, hobbyistClass.model.vo.* ,classNotice.model.vo.*"%>
<%
	int cNo =(int)request.getAttribute("cNo");
	Member loginUser = (Member)session.getAttribute("loginUser");
// 	ClassNotice notice = (ClassNotice)request.getAttribute("classNotice");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.outer{
		width: 600px; height: 500px; background-color: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	}
	.tableArea {width:450px; height:350px; margin-left:auto; margin-right:auto;}
	#insertNoBtn{background: #B2CCFF;}
	#cancelBtn{background: #D1B2FF;}
</style>
</head>
<body>
<%-- 	<%@ include file="../common/menubar.jsp" %> --%>
<%-- 	<%@ include file="../common/topbar.jsp" %> --%>
	<div class="outer">
		<br>
		<h2 align="center">공지사항 작성</h2>
		<div class="tableArea">
			<form action="<%= request.getContextPath() %>/classNoticeInsert.no" method="post">
				<table>
					<tr>
						<th>제목</th>
						<td colspan="3"><input type="text" size="50" name="title"></td>				
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<%= loginUser.getMemberNickName() %>
						</td>
						<th>작성일</th>
						<td><input type="date" name="date"></td>
					</tr>
					<tr>
						<th>내용</th>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="content" cols="60" rows="15" style="resize:none;"></textarea>
						</td>
					</tr>
				</table>
				
				<br>
					<input type="hidden" name="cNo" value = "<%=cNo%>">
				<div align="center">
					<input type="submit" id="insertNoBtn" value="등록">
					<input type="button" onclick="location.href='javascript:history.go(-1);'" id="cancelBtn" value="취소">
				</div>
			</form>
		</div>
	</div>
</body>
</html>