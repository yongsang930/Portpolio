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
//				System.out.println("i값 = " + i);
//				System.out.println("sum + i 값 =" + sum);
				i++;

			}
			System.out.println(sum);

		} 
//		else {
//			System.out.println("100이하의 양의 정수만 입력하시오.");
//		}

	}
}
