import java.util.Scanner;

public class Practice4 {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);

		int num = scan.nextInt();
		int sum = 0;
		int i = 1;

		scan.close();

		if ((num > 0) && (num <= 100)) {
			while (i <= num) {
				sum += i;
//				System.out.println("i�� = " + i);
//				System.out.println("sum + i �� =" + sum);
				i++;

			}
			System.out.println(sum);

		} 
//		else {
//			System.out.println("100������ ���� ������ �Է��Ͻÿ�.");
//		}

	}
}
