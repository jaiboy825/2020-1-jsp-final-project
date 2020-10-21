<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 입력 폼</title>
</head>
<body>
<h3>회원 정보 입력</h3>
	<form action="AddMember.jsp" method="post">
<table border="1">
	<tr><th>이름</th><td><input type="text" name="name" value="전제"></td></tr>
	<tr><th>아이디</th><td><input type="text" name="id" value="jai"></td></tr>
	<tr><th>닉네임</th><td><input type="text" name="nickname" value="연보라색"></td></tr>
	<tr><th>비밀번호</th><td><input type="password" name="pw" value="본인이좋아하는숫자"></td></tr>
</table>
<input type="submit" value="전송"> &nbsp;&nbsp;&nbsp;
<input type="reset" value="취소">
	</form>
</body>
</html>