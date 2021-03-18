package com.vti.frontend;

import java.util.Scanner;

public class Ex2Qu5 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		System.out.print("Nhập vào 1 số: ");
		int x = scanner.nextInt();


		for (int i = 2; i < x; i++) {
			for (int c = 2; c < x+1; c++) {
				if (x == 1) {
					return;
				} else if (x % c == 0) {
					x = x / c;
					System.out.print(c + "x");
					break;
				}
			}

		}
	}
}