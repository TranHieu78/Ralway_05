package com.vti.frontend;
import java.util.Scanner;

public class Ex1Qu5 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		System.out.print("nhập số thứ 1: ");
		int x = scanner.nextInt();

		System.out.print("nhập số thứ 2: ");
		int y = scanner.nextInt();
		

		if (x%y == 0) {
			System.out.println("Chia hết");
		}else {
			System.out.println("Không chia hết");
		}
		
		scanner.close();
	}
}