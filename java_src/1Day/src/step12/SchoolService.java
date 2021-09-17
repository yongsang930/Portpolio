package step12;

public class SchoolService {

	private int index;
	private Person[] p = new Person[10];

	public void connect() {
		System.out.println("DaoImpl이 접속했습니다.");
	}

	public void addPerson(Person p) {
		this.p[index] = p;
		index++;
	}

	public void printAll() {
		for (int i = 0; i < p.length; i++) {
			System.out.println(p[i]);
		}
	}

	public Person findPerson(String name) {
		Person per = null;
		for (int i = 0; i < p.length; i++) {
			if (p[i].getTel().equals(name)) {
				per = p[i];
			}
		}
		return per;
	}
}