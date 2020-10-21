package test;

import java.util.Scanner;

public class Main {
	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
		StudentDAO manager = StudentDAO.getInstance();
		
		boolean run  = true;
		while(run) {
			System.out.println("1.가입 2.탈퇴 3.정렬 4.출력");
			int sel = scan.nextInt();
			
			if(sel == 1) {
				StudentVO temp = new StudentVO();
				System.out.println("[가입] id 를 입력하세요 >>> ");
				String id = scan.next();
				temp.setId(id);		
				int check =  manager.checkId(temp);
				if(check == -1) {
					System.out.println("[가입] pw 를 입력하세요 >>> ");
					String pw = scan.next();
					temp.setPw(pw);	
					
					System.out.println("[가입] score 를 입력하세요 >>> ");
					int score = scan.nextInt();
					temp.setScore(score);
					manager.addStudent(temp);	
					
					System.out.println(temp.getId() + "님 가입을 환영합니다.");
				}else {
					System.out.println("중복아이디 입니다.");
				}				
			}else if(sel == 2) {
				manager.printStudent();
				
				StudentVO temp = new StudentVO();
				System.out.println("[탈퇴] id 를 입력하세요 >>> ");
				String id = scan.next();
				temp.setId(id);	
				int check = manager.checkId(temp);
				if(check == -1) {
					System.out.println("없는 아이디입니다.");
				}else {
					StudentVO del_st = manager.removeStudent(check);
					System.out.println(del_st.getId() + "님 탈퇴 되었습니다.");
				}
			}else if(sel == 3) {
				manager.sortData();
				manager.printStudent();
			}else if(sel == 4) {
				manager.printStudent();
			}
		}
		
		scan.close();
		
	}
}
