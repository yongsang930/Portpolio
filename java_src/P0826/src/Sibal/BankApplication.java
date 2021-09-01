package Sibal;

import java.util.Scanner;

public class BankApplication {
	private static Account[] accountArray = new Account[100];
	private static Scanner scanner = new Scanner(System.in);
	static int index = -1;

	public static void main(String[] args) {
		boolean run = true;
		while (run) {
			System.out.println("-------------------------------------------------");
			System.out.println("1.계좌생성 | 2.계좌목록 | 3.예금 | 4.출금 | 5.삭제 | 6.종료");
			System.out.println("-------------------------------------------------");
			System.out.print("선택> ");

			int selectNo = scanner.nextInt();

			if (selectNo == 1) {
				createAccount();
			} else if (selectNo == 2) {
				accountList();
			} else if (selectNo == 3) {
				deposit();
			} else if (selectNo == 4) {
				withdraw();
			} else if (selectNo == 5) {
				anodelete();
			} else if (selectNo == 6) {
				run = false;
			}
		}
		System.out.println("프로그램 종료");
	}

	private static void createAccount() {
		System.out.printf("---------%n계좌생성 %n---------%n");

		System.out.print("계좌번호: ");
		String ano = scanner.next();

		System.out.print("계좌주: ");
		String owner = scanner.next();

		System.out.print("초기 입금액: ");
		int balance = scanner.nextInt();

		System.out.println("결과: 계좌가 생성되었습니다.");

		accountArray[++index] = new Account(ano, owner, balance);
	}

	private static void accountList() {
		System.out.printf("---------%n계좌목록 %n---------%n");
		for (int i = 0; i <= index; i++) {
			System.out.println(accountArray[i].getAno() + "     " + accountArray[i].getOwner() + "     "
					+ accountArray[i].getBalance());
		}
	}

	private static void deposit() {
		System.out.printf("---------%n예금 %n---------%n");

		System.out.print("계좌번호: ");
		String ano = scanner.next();

		System.out.print("예금액: ");
		int balance = scanner.nextInt();

		for (int i = 0; i <= index; i++) {
			if (accountArray[i].getAno().equals(ano)) {
				int curBalance = accountArray[i].getBalance();
				accountArray[i].setBalance(curBalance + balance);
				System.out.println("결과: 예금이 성공되었습니다.");
			}
		}
	}

	private static void anodelete() {
		System.out.printf("---------%n삭제 %n---------%n");
		System.out.print("계좌번호: ");
		String ano = scanner.next();

		System.out.print("계좌주: ");
		String owner = scanner.next();

		for (int i = 0; i <= index; i++) {
			if (accountArray[i].getAno().equals(ano) && accountArray[i].getOwner().equals(owner)) {
				accountArray[i] = null;

			}
		}
		System.out.println("결과: 계좌가 삭제되었습니다.");
	}

	private static void withdraw() {
		System.out.printf("---------%n출금 %n---------%n");

		System.out.print("계좌번호: ");
		String ano = scanner.next();

		System.out.print("출금액: ");
		int balance = scanner.nextInt();

		for (int i = 0; i <= index; i++) {
			if (accountArray[i].getAno().equals(ano)) {
				int curBalance = accountArray[i].getBalance();
				accountArray[i].setBalance(curBalance - balance);
				System.out.println("결과: 출금이 성공되었습니다.");
			}
		}
	}

//	private static Account findAccount(String ano) {
//	}
}
