<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� �Է� ��</title>
</head>
<body>
<h3>ȸ�� ���� �Է�</h3>
	<form action="AddMember.jsp" method="post">
<table border="1">
	<tr><th>�̸�</th><td><input type="text" name="name" value="����"></td></tr>
	<tr><th>���̵�</th><td><input type="text" name="id" value="jai"></td></tr>
	<tr><th>�г���</th><td><input type="text" name="nickname" value="�������"></td></tr>
	<tr><th>��й�ȣ</th><td><input type="password" name="pw" value="�����������ϴ¼���"></td></tr>
</table>
<input type="submit" value="����"> &nbsp;&nbsp;&nbsp;
<input type="reset" value="���">
	</form>
</body>
</html>