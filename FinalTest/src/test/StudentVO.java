package test;

public class StudentVO {
	private String id;
	private String pw;
	private int score;

	public StudentVO() {
	}

	public StudentVO(String id, String pw, int score) {
		super();
		this.id = id;
		this.pw = pw;
		this.score = score;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	void printData() {
		System.out.println("이름 : " + id + " 비밀번호 : " + pw + " 성적 : " + score);
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", pw=" + pw + ", score=" + score + "]";
	}
	
}