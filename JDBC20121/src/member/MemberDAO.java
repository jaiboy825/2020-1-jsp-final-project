package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();

	private MemberDAO() {
	}

	public ArrayList<MemberVO> list = new ArrayList<MemberVO>();

	// ArrayList
	public static MemberDAO getInstance() {
		return instance;
	}

	public Connection getConnection() { // Oracle db 연결
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String password = "1234";
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);

			System.out.println("오라클 접속 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		// jdbc에 활용한 객체들을 역순으로 자원 반환
		if (rs != null)
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		if (conn != null)
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	}

	public int getMaxNo() {
		// 회원번호를 1씩 증가시키기 위한 테이블의 memno 의 최댓값 리턴
		int max = 0; // 최댓값
		int idx = 0; // 현재값
		for (int i = 0; i < list.size(); i++) {
			idx = list.get(i).getMemno(); // list 를 돌면서 현재 값을 하나씩 올림
			if (max <= idx) { // 현재값이 최대값보다 클때 최댓값을 현재값으로 설정
				max = idx;
			}
		}
		return max; // 최댓값 리턴
	}

	public ArrayList<MemberVO> selectMembers() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = instance.getConnection();
			String sql = "SELECT * FROM MEMBER_TBL ORDER BY MEMNO"; // 선택 sql
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list.clear(); // 리스트 초기화를 하고 다시 설정 만들기
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setMemno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setId(rs.getString(3));
				vo.setPass(rs.getString(4));
				vo.setBirth(rs.getInt(5));
				vo.setGender(rs.getString(6));
				vo.setJob(rs.getString(7));
				vo.setCity(rs.getString(8));
				vo.setJoindate(rs.getDate(9));
				list.add(vo);

				// sql 돌면서 하나씩 넣는것
			}
			System.out.println("멤버 출력 완료");
			System.out.println(list.size());

		} catch (Exception e) {
			// 오류잡기
			System.out.println("selectMembers() 오류");
			e.printStackTrace();
		}
		instance.close(rs, pstmt, conn);
		return list; // 리스트 리턴
	}

	public int insertMember(MemberVO vo) {
		list.add(vo); // list 에 추가
		Connection conn = null;
		PreparedStatement pstmt = null;
		int cnt = 0;
		try {
			conn = instance.getConnection();
			String insertSql = "INSERT INTO MEMBER_TBL(memno, name, id, pass, birth, gender, job, city, joindate)"
					+ "VALUES(?,?,?,?,?,?,?,?,SYSDATE)"; // insert sql
			pstmt = conn.prepareStatement(insertSql);
			pstmt.setInt(1, vo.getMemno());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getId());
			pstmt.setString(4, vo.getPass());
			pstmt.setInt(5, vo.getBirth());
			pstmt.setString(6, vo.getGender());
			pstmt.setString(7, vo.getJob());
			pstmt.setString(8, vo.getCity());
			cnt = 8; // 만약에 8이 아니라면 제대로 입력이 안된것 ㅋㅋ 어차피 catch에서 잡히겠지만 ?
			pstmt.executeQuery(); // 가입이니까 execute
			System.out.println("회원가입 완료");
			System.out.println(list.size());

		} catch (Exception e) {
			// 오류 잡기
			System.out.println("insertMembers() 오류");
			e.printStackTrace();
		}
		instance.close(null, pstmt, conn);
		return cnt;

	}

	public int updateMember(MemberVO vo) {
		// updateSql 실행 - 성공시 row 개수 리턴
		Connection conn = null;
		PreparedStatement pstmt = null;
		int cnt = 0;
		try {
			conn = instance.getConnection();
			String updateSql = "UPDATE MEMBER_TBL SET PASS = ?, BIRTH = ?, GENDER = ?, JOB=?, CITY=? WHERE MEMNO = ?";
			pstmt = conn.prepareStatement(updateSql);// updateSql
			pstmt.setString(1, vo.getPass());
			pstmt.setInt(2, vo.getBirth());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getJob());
			pstmt.setString(5, vo.getCity());
			pstmt.setInt(6, vo.getMemno());
			cnt = 6; // 만약에 6이 아니라면 제대로 입력이 안된것 ㅋㅋ 어차피 catch에서 잡히겠지만 ?
			pstmt.executeUpdate(); // 업데이트니까 update
			System.out.println("회원정보수정 완료");
			System.out.println(list.size());
		} catch (Exception e) {
			// 오류 잡기
			System.out.println("updateMember() 오류");
			e.printStackTrace();
		}
		instance.close(null, pstmt, conn);
		return cnt;

	}

	public int deleteMember(int memno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = instance.getConnection();
			String deleteSql = "DELETE FROM MEMBER_TBL WHERE MEMNO = ?"; // deleteSql
			pstmt = conn.prepareStatement(deleteSql);
			pstmt.setInt(1, memno);
			pstmt.executeUpdate(); // 삭제라서 UPDATE
			result = 0;
			System.out.println("멤버 삭제 완료");
		} catch (Exception e) {
			System.out.println("deleteMember() 오류");
			e.printStackTrace();
		}

		close(rs, pstmt, conn);
		return result;
	}

	public MemberVO getAMember(int memno) {
		MemberVO vo = new MemberVO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = instance.getConnection();
			String getSql = "SELECT * FROM MEMBER_TBL WHERE MEMNO = ?"; // select sql 에서 검색 추가
			pstmt = conn.prepareStatement(getSql);
			pstmt.setInt(1, memno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo.setMemno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setId(rs.getString(3));
				vo.setPass(rs.getString(4));
				vo.setBirth(rs.getInt(5));
				vo.setGender(rs.getString(6));
				vo.setJob(rs.getString(7));
				vo.setCity(rs.getString(8));
				vo.setJoindate(rs.getDate(9));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		close(rs, pstmt, conn);
		return vo; //검색 해서 나온사람 리턴
	}

	public boolean idAvailableChk(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;
		try {
			conn = instance.getConnection();
			String checkSql = "SELECT * FROM MEMBER_TBL WHERE id = ?"; //check
			pstmt = conn.prepareStatement(checkSql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (!rs.next()) //만약에 안되면 true
				result = true;
		} catch (Exception e) {
			System.out.println("idAvailableChk() 오류");
			e.printStackTrace();
		}
		instance.close(rs, pstmt, conn);
		return result;

	}
}
