<%@page import="test.StudentVO"%>
<%@page import="test.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	padding-top: 300px;
	position:relative;
	width:100%;
	height: calc(100vh - 300px);
	background: rgb(253, 81, 81);
    background: linear-gradient(354deg, rgba(253, 81, 81, 1) 0%, rgba(253, 105, 79, 1) 48%, rgba(254, 127, 82, 1) 100%);
	text-align: center;
	line-height: 20vh;
	z-index: 1;
	overflow: hidden;
}
.wrapper>a{
	font-size: 30px;
	font-weight: bold;
	color: black;
}
.stuInfo{
	margin: 0 auto;
    width: calc(20vw + 30px);
    height: 200px;
    background-color: white;
    display: grid;
    grid-template-columns: 100%;
    grid-template-rows: 100px 100px;   
    line-height: 100px;
    text-align: left;
    border-radius: 10px;
    padding-left: 30px;
}
.ids, .scores{
	width: 100%;
	height: 100px;
	font-size: 30px;
}
</style>
<div class="wrapper">
<%	
		String ids = "";
		int Score = 0;
		request.setCharacterEncoding("utf-8");
		StudentDAO instance = StudentDAO.getInstance();
		String id = request.getParameter("id");
		StudentVO temp = new StudentVO();
		temp.setId(id);
		int result = instance.checkId(temp);
	//사용자 유무 판단
		if (result == -1) {
		%>
		<h3>없는 아이디 입니다. 다시 시도해주세요.</h3>
	
		<a href="index.jsp">돌아가기</a>
	
		<% }else{
			//있으면 화면에 뿌려주기
			ids = instance.list.get(result).getId();
			Score = instance.list.get(result).getScore();
		%>
		<div class="stuInfo">
        <div class="ids">ID : <%=ids %></div>
        <div class="scores">Score : <%=Score %></div>
    	</div>
		<a href="index.jsp">돌아가기</a>
	<%
		}
	%>
</div>
</body>
</html>