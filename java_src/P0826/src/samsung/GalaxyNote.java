package samsung;

public class GalaxyNote extends phone {

	int channel;
	
	GalaxyNote(String model, String color, int channel) {
		this.model = model;
		this.color = color;
		this.channel = channel;
	}
	
	void turnOnDmb() {
		System.out.println("chnnel: " + channel + "�� TV ���� ����~");
	}
	void channelChange(int channel) {
		System.out.println("chnnel: " + channel + "������ ä�� ����~");
	}
	void turnOffDmb() {
		System.out.println("TV ������ �����մϴ�.");
	}
	void penDrawing() {
		System.out.println("������� �����ؿ� ���� � ������!");
	}
	void penDrawingEnd() {
		System.out.println("������� ������ ���� � ����־��!");
	}
}
