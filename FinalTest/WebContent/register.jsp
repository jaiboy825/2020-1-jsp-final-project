<%@page import="java.io.Console"%>
<%@page import="test.StudentVO"%>
<%@page import="test.StudentDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>20121 전제</title>
</head>
<body>
<style>
*{
	margin:0;
	padding: 0;
	text-decoration: none;
	outline: none;
}
.wrapper{
	position:relative;
	width:100%;
	height:100vh;
	background: rgb(253, 81, 81);
    background: linear-gradient(354deg, rgba(253, 81, 81, 1) 0%, rgba(253, 105, 79, 1) 48%, rgba(254, 127, 82, 1) 100%);
	text-align: center;
	line-height: 20vh;
}
.wrapper>a{
	font-size: 30px;
	font-weight: bold;
	color: black;
}
</style>
<div class="wrapper">
	<%
	request.setCharacterEncoding("utf-8");
		StudentDAO instance = StudentDAO.getInstance();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		int score = Integer.parseInt(request.getParameter("score"));
		StudentVO temp = new StudentVO();
		temp.setId(id);
		int result = instance.checkId(temp);
	//사용자 유무
		if (result == -1) {
		//없을때 생성
	%>
	<h3>등록이 되었습니다.</h3>
	<%
	StudentVO temps = new StudentVO();
	temps.setId(id);
	temps.setPw(pw);
	temps.setScore(score);	
	instance.addStudent(temps);
	
	%>
	<a href="index.jsp">돌아가기</a>
	<%
	
		} else {
			//있으면 리턴
	%>
	<h3>중복된 아이디 입니다. 다시 시도해주세요.</h3>
	<a href="index.jsp">돌아가기</a>
	<%
		}
	%>
</div>
</body>
</html>