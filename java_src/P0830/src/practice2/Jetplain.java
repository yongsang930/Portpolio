package practice2;

public class Jetplain extends Plain implements Flyable, Soundable {
	public void sound() {
		System.out.println("��Ʈ�� �Ҹ� : �����~");
	}
	
	public void fly() {
		System.out.println("��Ʈ�Ⱑ ���ư��ϴ�");
	}
}
