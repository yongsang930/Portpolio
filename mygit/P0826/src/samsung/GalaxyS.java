package samsung;

public class GalaxyS {
	public static void main(String[] args) {
		GalaxyNote telecom = new GalaxyNote("������S","����", 10);
		
		telecom.powerOn();
		telecom.powerOff();
		telecom.callOn();
		telecom.callOff();
		telecom.sendMessage("ģ����~ ����");
		telecom.receiveMessage("���׷�");
		
		telecom.turnOnDmb();
		telecom.channelChange(20);
		telecom.turnOffDmb();
		
		GalaxyNote telephone = new GalaxyNote("�����ó�Ʈ","�ǹ�", 20);
		telephone.penDrawing();
		telephone.penDrawingEnd();
		telephone.radioCome();
		telephone.radioTrue();
	}
}
