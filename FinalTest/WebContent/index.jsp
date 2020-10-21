<%@page import="test.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전제의 final 프로젝트</title>
<link rel="stylesheet" href="app.css">
<link rel="stylesheet" href="fontawesome/css/font-awesome.css">
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");
//밑에서 쓸 아이디와 점수 초기값
String id ="";
int Score = 0;

%>
<header>학생 성적 관리 프로그램</header>
    <div class="mainContainer">
        <div class="left">
            <h3 class="menuHead">MENU 관리메뉴</h3>
            <div class="menuCon">
                <button class="menuBtn btn1" onclick="location.href='index.jsp?btn=1'"><i class="fa fa-caret-right"></i>가입</button>
                <button class="menuBtn btn2" onclick="location.href='index.jsp?btn=2'"><i class="fa fa-caret-right"></i>탈퇴</button>
                <button class="menuBtn btn3" onclick="location.href='index.jsp?btn=3'"><i class="fa fa-caret-right"></i>정렬</button>
                <button class="menuBtn btn4" onclick="location.href='index.jsp?btn=4'"><i class="fa fa-caret-right"></i>전체 보기</button>
                <button class="menuBtn btn5" onclick="location.href='index.jsp?btn=5'"><i class="fa fa-caret-right"></i>학생 검색</button>
                
            </div>
        </div>
        <div class="main">
            <div class="addwrapper"></div>
            <%
            
	if(request.getParameter("btn") != null){
		int btn = Integer.parseInt(request.getParameter("btn"));
		if(btn == 1){
		%>	
		<!--사용자 등록  -->
            <div class="add">
                <h3 class="addHeader">사용자 등록 화면</h3>
                <form action="register.jsp" method="post">
                    <div class="inContainer">
                        <input type="text" name="id" required placeholder="아이디">
                        <input type="text" name="pw" required placeholder="비밀번호">
                        <input type="number" name="score" max="100" min ="0" required placeholder="점수">
                        <input type="submit" value="do it!" class="doit">
                    </div>
                    <div class="addfooter">Copyright &copy;2020 YYDH. All rights reserved.</div>
                </form>
            </div>
            <style>
			.btn1{
			background-color: #ff4d4d;
			color: white;
			}
			</style>
            <%
            //사용자 탈퇴
		}else if(btn == 2){
            %>
			<div class="del">
                <h3 class="addHeader">사용자 탈퇴</h3>
                <form action="delete.jsp" method="post">
                    <div class="inContainer">
                        <input type="text" name="id" required placeholder="아이디">
                        <input type="text" name="pw" required placeholder="비밀번호">
                        <input type="submit" value="delete!" class="doit">
                    </div>
                    <div class="addfooter">Copyright &copy;2020 YYDH. All rights reserved.</div>
                </form>
            </div>
            <style>
			.btn2{
			background-color: #ff4d4d;
			color: white;
			}
			</style>
            <%
            //점수로 정렬해서 보기
		}else if(btn == 3){
			StudentDAO instance = StudentDAO.getInstance();
			instance.sortData();
            %>
			<div class="all">
                <h3 class="allHeader">전체 보기(점수 정렬)</h3>
                <table border="1">
		<tr>
		<th>아이디</th> <th>점수</th>
		</tr>
		<style>
			.btn3{
			background-color: #ff4d4d;
			color: white;
			}
			</style>
		<%
		for(int i = 0; i < instance.getSize(); i ++){
				id = instance.list.get(i).getId();
				Score = instance.list.get(i).getScore();
		%>
		<tr>
			<td><%= id %></td>
			<td><%= Score%></td>
		</tr>
		<%
		}
		%>
		</table>
                
            </div>
            <%
            //정렬 안하고 전체 보기
		}else if(btn == 4){
			StudentDAO instance = StudentDAO.getInstance();
			%>
			<div class="all">
                <h3 class="allHeader">전체 보기</h3>
                <table border="1">
		<tr>
		<th>아이디</th> <th>점수</th>
		</tr>
		<%
		for(int i = 0; i < instance.getSize(); i ++){
				id = instance.list.get(i).getId();
				Score = instance.list.get(i).getScore();
		%>
		<tr>
			<td><%= id %></td>
			<td><%= Score%></td>
		</tr>
		<%
		}
		%>
		</table>
                
            </div>
            <style>
			.btn4{
			background-color: #ff4d4d;
			color: white;
			}
			</style>
			<%
		}else if(btn == 5){
			//사용자 검색해서 보기
			%>
			<div class="find">
                <h3 class="addHeader">사용자 검색</h3>
                <form action="find.jsp" method="post">
                    <div class="inContainer">
                        <input type="text" name="id" required placeholder="아이디">
                        <input type="submit" value="find it!" class="doit">
                    </div>
                    <div class="addfooter">Copyright &copy;2020 YYDH. All rights reserved.</div>
                </form>
            </div>
            <style>
			.btn5{
			background-color: #ff4d4d;
			color: white;
			}
			</style>
			<%
		}
	}
            %>
            
 
        </div>
    </div>
</body>
</html>