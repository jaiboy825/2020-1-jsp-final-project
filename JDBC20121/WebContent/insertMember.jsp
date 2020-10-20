<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
	<h2>회원 가입</h2>
	<form method="post" action="insertMemberPro.jsp" name="regForm"
		onsubmit="return passCheck(this);">
		<table border="1" style="width: 400">
			<tr>
				<td colspan="2" align="center"><b>회원 가입 정보 입력</b></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="강길동"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"> <input type="button"
					value="중복확인" onclick="idCheck(this.form.id.value)" required></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass" placeholder="비밀번호"
					required id="password"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="passcheck"
					placeholder="비밀번호 확인" required id="passwordcheck"></td>
			</tr>
			<!-- 만약에 이클립스 브라우저에서 안된다면 크롬에서 실행시 잘될겁니다. -->
			<tr>
				<th>생년(4자리)</th>
				<td><select name="birth">
						<%
							for (int i = 2001; i <= 2010; i++) { //2001 부터 2010까지
						%>
						<option value="<%=i%>">
							<%=i%>
						</option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender" value="남자" checked>남자
					<input type="radio" name="gender" value="여자">여자</td>
			</tr>
			<tr>
				<th>직업</th>
				<td><input type="text" name="job" value="학생"></td>
			</tr>
			<tr>
				<th>도시</th>
				<td><input type="text" name="city" value="성남"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="가입">
					<input type="reset" value="재작성"></td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		function idCheck(id) {
			if (id == "") {
				alert("아이디를 입력해주세요");
				document.regForm.id.focus(); //아이디 입력창이 비어서 포커스 잡아주기
			} else {
				url = "idCheck.jsp?id=" + id; //idCheck에 보개기
				window.open(url, "post", "width=400, height = 200") //크기 설정
			}
		}

		function passCheck(passc) {
			let pass = document.querySelector("#password").value; //password 값 받고

			let passcheck = document.querySelector("#passwordcheck").value; //check 값 받고 
			if (pass !== passcheck) { //둘이 비교해서 다르면
				alert("비밀번호가 다릅니다") // 다른거지 ㅋㅋ
				return false; //false 로 보내고 
			} else { //아니라면
				return true; //true 로 보내야징
			}

		}
	</script>
<%@include file="footer.jsp"%>