package com.vti.frontend;

import java.util.Scanner;

public class Ex2Qu4 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		System.out.print("nhập vào 1 số: ");
		int x = scanner.nextInt();

		String c = String.valueOf(x);

		String[] d = c.split("");

		int y;
		int z = 0;

		for (int i = 0; i < d.length; i++) {
			y = Integer.parseInt(d[i]);
			z = z + y;
		}
		
		System.out.print("Số bạn vừa nhập có tổng các chữ số là: " + z);
	}
}
