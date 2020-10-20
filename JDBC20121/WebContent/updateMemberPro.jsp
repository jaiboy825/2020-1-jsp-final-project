<%@page import="member.MemberVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
int memno = Integer.parseInt(request.getParameter("memno"));
String pass = request.getParameter("pass");
int birth = Integer.parseInt(request.getParameter("birth"));
String gender = request.getParameter("gender");
String job = request.getParameter("job");
String city = request.getParameter("city");

MemberDAO instance = MemberDAO.getInstance(); //instance 가져오기

String msg = null;
MemberVO vo = new MemberVO(); //vo 새로 만들기
vo.setPass(pass);
vo.setBirth(birth);
vo.setGender(gender);
vo.setJob(job);
vo.setCity(city);
vo.setMemno(memno); //vo 값 설정
int cnt = instance.updateMember(vo);
if (cnt == 6) { //cnt 가 6이 아니라면 실패
	msg = "회원 정보 수정 성공"; 
} else { //실패
	msg = "회원 정보 수정 실패";
}


%>
<%@ include file="header.jsp"%>
	<script type="text/javascript">
	alert('<%=msg%>');
	location.href= 'selectMember.jsp';
	</script>
<%@include file="footer.jsp"%>