package samsung;

public class phone {
	String model;
	String color;
	
	void powerOn() {
		System.out.println("������ �׾��");
	}
	void powerOff() {
		System.out.println("������ �����");
	}
	void callOn() {
		System.out.println("��ȭ�� �Ծ��!");
	}
	void callOff() {
		System.out.println("��ȭ�� ���Կ��");
	}
	void sendMessage(String message) {
		System.out.println("�޼��� ���´�~!");
		System.out.println("���� �޼��� ���� : " + message);
	}
	void receiveMessage(String message) {
		System.out.println("�޼��� �Դ�~!");
		System.out.println("���� �޼��� ���� : " + message);
	}
	void radioCome() {
		System.out.println("������ �����մϴ�");
	}
	void radioTrue() {
		System.out.println("���� ������ �����մϴ�.");
	}

}
