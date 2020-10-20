package member;

import java.sql.Date;

public class MemberVO {
	private int memno;
	private String name;
	private String id;
	private String pass;
	private int birth;
	private String gender;
	private String job;
	private String city;
	private Date joindate;
	public int getMemno() {
		return memno;
	}
	public void setMemno(int memno) {
		this.memno = memno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getBirth() {
		return birth;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	@Override
	public String toString() {
		return "20121전제 [memno=" + memno + ", name=" + name + ", id=" + id +", pass=" + pass +", birth=" + birth +", gender=" + gender +", job=" + job + ", city=" + city + ", joindate=" + joindate +"]";
	}
}
