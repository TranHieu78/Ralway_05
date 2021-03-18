package com.vti.frontend;
import java.util.Scanner;

public class Ex1Qu4 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		System.out.print("nhập số thứ 1: ");
		int x = scanner.nextInt();

		System.out.print("nhập số thứ 2: ");
		int y = scanner.nextInt();

		if (x - y > 0) {
			System.out.println("Số thứ nhất lớn hơn số thứ hai.");
		}else {
			System.out.println("Số thứ nhất nhỏ hơn số thứ hai.");
		}
		
		scanner.close();
	}

}
