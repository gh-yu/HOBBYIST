<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="classNotice.model.vo.ClassNotice , member.model.vo.Member" %>
<%
	ClassNotice notice = (ClassNotice)request.getAttribute("classNotice");
	Member loginUser = (Member)session.getAttribute("loginUser");

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
	#updateNoBtn{background: #B2CCFF;}
	#cancelBtn{background: #D1B2FF;}
</style>
</head>
<body>
<%-- 	<%@ include file="../common/menubar.jsp" %> --%>
<%-- 	<%@ include file="../common/topbar.jsp" %> --%>

	<div class="outer">
		<br>
		<h2 align="center">공지사항 수정</h2>
		<div class="tableArea">
			<form action="<%= request.getContextPath() %>/classNoticeUpdate.no" method="post">
				<table>
					<tr>
						<th>제목</th>
						<td colspan="3">
						<input type="text" name="title" value="<%= notice.getClassBoardName() %>"> 
						</td>				
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<%= notice.getClassBoardWriter() %>
							<input type="hidden" name="writer" value="<%= notice.getClassBoardWriter() %>"> 
						</td>
						<th>작성일</th>			
						<td>
							<input type="date" name="date" value="<%= notice.getClassBoardDate() %>"> 
						</td>
					</tr>
					<tr>
						<th>내용</th>
					</tr>
					<tr>
						<td colspan="4">
						<textarea name="content" cols="60" rows="15" style="resize:none;"><%= notice.getClassBoardContent() %></textarea>
						<input type="hidden" name="no" value="<%= notice.getClassBoardNo() %>"> <!-- 수정시 게시글번호 필요하기 때문에 hidden으로 form 정보 넘김 -->
						</td>
					</tr>
				</table>
				<input type= "hidden"name ="cNo" value="<%=notice.getClassNo() %>">
				
				<br>
				
				<div align="center">
					<input type="submit" id="updateNoBtn" value="저장">
					<input type="button" onclick="location.href='javascript:history.go(-1);'" id="cancelBtn" value="취소">
				</div>
			</form>
		</div>
	</div>
</body>
</html>