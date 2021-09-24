package test;

import exception.DuplicateTelException;
import exception.PersonNotFoundException;
import service.SchoolService;
import vo.Person;
import vo.Student;

public class TestSchoolService {

	public static void main(String[] args) {
		SchoolService service = new SchoolService();

		try {
			service.addPerson(new Student("011", "이지금", "카카오", "93"));
		} catch (DuplicateTelException de) {
			System.out.println(de.getMessage());
		}

		service.print();
		System.out.println("*****************");
		
		try {
			service.addPerson(new Student("011", "이지은", "카카오", "93"));
		} catch (DuplicateTelException de) {
			System.out.println(de.getMessage());
		}
		
		service.print();
		System.out.println("*****************");

		try {
			Person p = service.findPerson("011");
			System.out.println("찾은 값: " + p);
		} catch (PersonNotFoundException e) {
			System.out.println(e.getMessage());
		}
		
		System.out.println("*****************");
		
		try {
			service.deletePerson("031");
			System.out.println("삭제 완료");
			service.print();
		} catch (PersonNotFoundException e) {
			System.out.println(e.getMessage());
		}
		
		System.out.println("*****************");
		
		try {
			service.updatePerson("011",new Student("019","백박사","이태원","08"));
			service.print();
		} catch (PersonNotFoundException e) {
			System.out.println(e.getMessage());
		}
		
		System.out.println("*****************");
	}
}