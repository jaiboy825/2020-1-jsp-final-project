package test;

import java.util.ArrayList;

public class StudentDAO {
	
	private static StudentDAO instance = new StudentDAO();
	
    public ArrayList<StudentVO> list = new ArrayList<StudentVO>();
    //실행할때 미리 넣어두기
	public StudentDAO() {
    	StudentVO temp = new StudentVO("qwer", "1111", 100);
		list.add(temp);
		temp = new StudentVO("abcd", "2222", 87);
		list.add(temp);		
		temp = new StudentVO("javaking", "3333", 42);
		list.add(temp);
		
	}
	//인스턴스
	public static StudentDAO getInstance() {
		return instance;
	}
	//사용자 등록
	public void addStudent(StudentVO st) {
		list.add(st);
	}
	
	//사용자 삭제
	public StudentVO removeStudent(int index) {
		StudentVO delSt = list.get(index);
		list.remove(index);
		return delSt;
	}
	//중복 확인
	public int checkId(StudentVO st) {
		int check = -1;
		//check라는 함수를 만들어서 사용자 유무 판단
		for(int i=0; i<list.size(); i++) {
			//list사이즈 까지 검사
			if(list.get(i).getId().equals(st.getId())) {
				//만약에 있다면 check에 그 아이디 인덱스값 삽입
				check = i;
				break;
				//종료
			}
		}
		//리터
		return check;
	}
	//비밀번호 확인
		public int checkPw(int result, String pw) {
			int status = -1;
			//status라는 함수를 만들어서 비밀번호 맞는지 판단
				if(list.get(result).getPw().equals(pw)) {
					//넘겨온 인덱스 값에 있는 비밀번호와 입력받은 비밀번호가 같다면 status를 그 result값으로 변경
					status = result;
			}
				//리턴
			return status;
		}
	//학생 전체 보기
	public void printStudent() {
		//사용자 전체 보기
		for(int i=0; i<list.size(); i++) {
			list.get(i).printData();
		}
	}
	//정렬
	public void sortData() {
		for(int i=0; i<list.size(); i++) {
			//리스트 전체 돌기
			int maxScore = list.get(i).getScore();
			//i번째에 있는 점수를 갖고온다
			int maxIdx = i;
			//maxIdx에 i를 가져옴
			for(int j=i; j<list.size(); j++) {
				//j~list사이즈
				if(maxScore < list.get(j).getScore()) {
					//값 비교 후 변경
					maxScore = list.get(j).getScore();
					maxIdx = j;
				}
			}
			
			StudentVO temp = list.get(i);
			list.set(i, list.get(maxIdx));
			list.set(maxIdx, temp);
		}
	}
	//리스트 크기 가져오기
	public int getSize() {
		return list.size();
	}
}