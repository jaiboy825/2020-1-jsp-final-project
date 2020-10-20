<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberVO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<%
	// 비밀번호 2번 입력 받아서 재확인 
// 틀렸으면 alert창 나오게
MemberDAO instance = MemberDAO.getInstance();
ArrayList<MemberVO> list = instance.selectMembers();
%>
<h2>회원 목록</h2>
<table border="1">
	<tr align="center">
		<th width="100">회원번호</th>
		<th width="100">이름</th>
		<th width="100">아이디</th>
		<th width="100">비밀번호</th>
		<th width="100">생년(4자리)</th>
		<th width="50">성별</th>
		<th width="100">직업</th>
		<th width="100">도시</th>
		<th width="100">가입일자</th>
		<th width="100">탈퇴</th>
	</tr>
	<%
		/* while (rs.next()) {
	 */
	for (int i = 0; i < list.size(); i++) { //그냥 list 하나씩 돌면서 전부 가져오기
		int memno = list.get(i).getMemno();
		String name = list.get(i).getName();
		String id = list.get(i).getId();
		String pass = list.get(i).getPass();
		int birth = list.get(i).getBirth();
		String gender = list.get(i).getGender();
		String job = list.get(i).getJob();
		String city = list.get(i).getCity();
		Date joinDate = list.get(i).getJoindate();
	%>
	<tr align="center">
		<td width="100"><a href="updateMember.jsp?memno=<%=memno%>"><%=memno%></a></td>
		<td width="100"><%=name%></td>
		<td width="100"><%=id%></td>
		<td width="100"><%=pass%></td>
		<td width="100"><%=birth%></td>
		<td width="50"><%=gender%></td>
		<td width="100"><%=job%></td>
		<td width="100"><%=city%></td>
		<td width="100"><%=joinDate.toString()%></td>
		<td width="100"><a href="deleteMember.jsp?memno=<%=memno%>">탈퇴</a></td>
		<!-- 아 ㅋㅋ 다 가져왔지롱~ -->
	</tr>

	<%
		}
	%>
</table>
<%@include file="footer.jsp"%>
