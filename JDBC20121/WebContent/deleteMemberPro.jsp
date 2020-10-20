<%@page import="member.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
int memno = Integer.parseInt(request.getParameter("memno")); //몰래 보낸 memno 받기
String pass = request.getParameter("pass");

MemberDAO instance = MemberDAO.getInstance(); //instance 가져오기
String msg = null; //msg 기본 

	int result = instance.deleteMember(memno); // 삭제 시키기
if (result == 0) { // 만약에 pass가 리스트의 0번째 pass 랑 같으면 
	msg = "회원 탈퇴 완료"; //msg 정하기
} else { //아니라면 실패
	msg = "탈퇴 실패 : 비밀번호 오류"; //msg 정하기
}
%>
<%@ include file="header.jsp"%>
	<script type="text/javascript">
	alert('<%=msg%>');
	location.href= 'selectMember.jsp';
	</script>
<%@include file="footer.jsp"%>