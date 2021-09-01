import java.util.Scanner;

public class Gujoche {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		
		IntTest meth = new IntTest();
		IntTest.cv(scan.next(), scan.next(), scan.nextInt());
		
		
	
	}
}
	
	class IntTest {
		static int cv = 1;
		int iv = 1;
		
		static {cv = 2;
		System.out.println("cv = " + cv); }
		{iv=2;}
		
		IntTest(){
			iv = 3;
		}
	}

