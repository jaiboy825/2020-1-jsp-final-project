<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
	<% int memno = Integer.parseInt(request.getParameter("memno")); //memno 받아오기 %>
	<h2>회원 탈퇴</h2>
	<form method="post" action="deleteMemberPro.jsp">
		<input type="hidden" name="memno" value="<%=memno%>"> 비밀번호 : <input
			type="password" name="pass"> <input type="submit" value="탈퇴">
	</form>
<%@include file="footer.jsp"%>