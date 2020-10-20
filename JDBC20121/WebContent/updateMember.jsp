<%@page import="member.MemberVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");
	int memno = Integer.parseInt(request.getParameter("memno"));
	MemberDAO instance = MemberDAO.getInstance();
	MemberVO vo = instance.getAMember(memno);
	%>
	<form action="updateMemberPro.jsp" method="post">
		<table border="1" style="width: 400">
			<tr>
				<td>회원번호</td>
				<td><input type="text" name="memno" value="<%=vo.getMemno()%>"
					readonly></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=vo.getName()%>"
					disabled></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" value="<%=vo.getId()%>"
					disabled></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"
					value="<%=vo.getPass()%>"></td>
			</tr>
			<tr>
				<th>생년(4자리)</th>
				<td><select name="birth">
						<%
							for (int i = 2001; i <= 2010; i++) { //2001 부터 2010 까지
							if (vo.getBirth() == i) { //vo 에서 가져온 birth가 i값 과 같다면 그걸로 설정
						%>
						<option value="<%=i%>" selected><%=i%></option>
						<%
							} else { //아니라면 아닌거고
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
							}
						}
						%>
				</select></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<%
						if (vo.getGender().equals("남자")) { //vo 에서 가져온 gender값이 남자라면
					%> <input type="radio" name="gender" value="남자" checked>남자
					<input type="radio" name="gender" value="여자">여자 <%
 	} else { //아니라면 
 %> <input type="radio" name="gender" value="남자">남자 <input
					type="radio" name="gender" value="여자" checked>여자 <%
 	}
 %>
				</td>
			</tr>
			<tr>
				<th>직업</th>
				<td><input type="text" name="job" value="<%=vo.getJob()%>"></td>
			</tr>
			<tr>
				<th>도시</th>
				<td><input type="text" name="city" value="<%=vo.getCity()%>"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="수정">
					<input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
<%@include file="footer.jsp"%>