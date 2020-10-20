<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");

MemberDAO instance = MemberDAO.getInstance();
boolean result = instance.idAvailableChk(id); //id 체크 보내서 받기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 아이디 확인</title>
</head>
<body bgcolor="yellow">
	<div align="center">
		<b><%=id%></b> 는
		<%
			if (result) { //result 가 트루라면 사용가능 아니라면 사용 불가능
		%>
		<font color="blue">사용 가능</font> 합니다.
		<!-- 사용가능하다고 뜸  -->
		<%
			} else { //아니라면
		%>
		<font color="red">사용 불가능</font> 합니다.
		<!-- 불가능하다고 뜸 -->
		<%
			}
		%>
		<hr>
		<a href="javascript:self.close()">창 닫기</a>
	</div>
</body>
</html>