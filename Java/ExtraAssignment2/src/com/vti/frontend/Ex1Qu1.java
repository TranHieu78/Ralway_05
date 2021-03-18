package com.vti.frontend;

import java.util.Scanner;

public class Ex1Qu1 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("nhập 1 số cm: ");
		float a = scanner.nextFloat();

		float inch = (float) 2.54 * a;
		System.out.printf("số inch: " + "%5.2f%n", inch);

		float foot = (float) 12 * inch;
		System.out.printf("số foot: " + "%5.2f%n", foot);

		scanner.close();
	}

}
