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
			System.out.println("1.���»��� | 2.���¸�� | 3.���� | 4.��� | 5.���� | 6.����");
			System.out.println("-------------------------------------------------");
			System.out.print("����> ");

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
		System.out.println("���α׷� ����");
	}

	private static void createAccount() {
		System.out.printf("---------%n���»��� %n---------%n");

		System.out.print("���¹�ȣ: ");
		String ano = scanner.next();

		System.out.print("������: ");
		String owner = scanner.next();

		System.out.print("�ʱ� �Աݾ�: ");
		int balance = scanner.nextInt();

		System.out.println("���: ���°� �����Ǿ����ϴ�.");

		accountArray[++index] = new Account(ano, owner, balance);
	}

	private static void accountList() {
		System.out.printf("---------%n���¸�� %n---------%n");
		for (int i = 0; i <= index; i++) {
			System.out.println(accountArray[i].getAno() + "     " + accountArray[i].getOwner() + "     "
					+ accountArray[i].getBalance());
		}
	}

	private static void deposit() {
		System.out.printf("---------%n���� %n---------%n");

		System.out.print("���¹�ȣ: ");
		String ano = scanner.next();

		System.out.print("���ݾ�: ");
		int balance = scanner.nextInt();

		for (int i = 0; i <= index; i++) {
			if (accountArray[i].getAno().equals(ano)) {
				int curBalance = accountArray[i].getBalance();
				accountArray[i].setBalance(curBalance + balance);
				System.out.println("���: ������ �����Ǿ����ϴ�.");
			}
		}
	}

	private static void anodelete() {
		System.out.printf("---------%n���� %n---------%n");
		System.out.print("���¹�ȣ: ");
		String ano = scanner.next();

		System.out.print("������: ");
		String owner = scanner.next();

		for (int i = 0; i <= index; i++) {
			if (accountArray[i].getAno().equals(ano) && accountArray[i].getOwner().equals(owner)) {
				accountArray[i] = null;

			}
		}
		System.out.println("���: ���°� �����Ǿ����ϴ�.");
	}

	private static void withdraw() {
		System.out.printf("---------%n��� %n---------%n");

		System.out.print("���¹�ȣ: ");
		String ano = scanner.next();

		System.out.print("��ݾ�: ");
		int balance = scanner.nextInt();

		for (int i = 0; i <= index; i++) {
			if (accountArray[i].getAno().equals(ano)) {
				int curBalance = accountArray[i].getBalance();
				accountArray[i].setBalance(curBalance - balance);
				System.out.println("���: ����� �����Ǿ����ϴ�.");
			}
		}
	}

//	private static Account findAccount(String ano) {
//	}
}
