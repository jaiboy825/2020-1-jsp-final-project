<%@page import="java.sql.Date"%>
<%@page import="member.MemberVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
int birth = Integer.parseInt(request.getParameter("birth"));
String gender = request.getParameter("gender");
String job = request.getParameter("job");
String city = request.getParameter("city");
MemberDAO instance = MemberDAO.getInstance();//instance 가져오기
int memno = instance.getMaxNo() + 1; //최댓값 + 1을 해야지 그 다음 memno 를 할수있음 
String msg = "";
MemberVO vo = new MemberVO(); //vo 새로 만들기
vo.setMemno(memno);
vo.setName(name);
vo.setId(id);
vo.setPass(pass);
vo.setBirth(birth);
vo.setGender(gender);
vo.setJob(job);
vo.setCity(city); //vo 값 설정
int cnt = instance.insertMember(vo); //가입 시켜버리기 !
if (cnt == 8) { //8이라면 
	msg = "회원 가입 성공";
} // 됨 
else //아니라면
	msg = "회원 가입 실패"; // 안됨
%>
<%@ include file="header.jsp"%>
	<script type="text/javascript">
	alert('<%=msg%>');
	location.href= 'selectMember.jsp';
	</script>
<%@include file="footer.jsp"%>