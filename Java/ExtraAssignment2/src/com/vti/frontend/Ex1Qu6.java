package com.vti.frontend;

import java.util.Scanner;

public class Ex1Qu6 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		System.out.print("Nhập điểm môn toán: ");
		int x = scanner.nextInt();

		System.out.print("Nhập điểm môn lý: ");
		int y = scanner.nextInt();

		System.out.print("Nhập điểm môn hoá: ");
		int z = scanner.nextInt();

		float diemTB = (float) (x * 2 + y + z) / 4;

		if (diemTB < 5) {
			System.out.println("Học sinh kém");
		} else if (diemTB < 6 && diemTB >= 5) {
			System.out.println("Học sinh trung bình");
		} else if (diemTB < 7 && diemTB >= 6) {
			System.out.println("Học sinh trung bình khá");
		} else if (diemTB < 8 && diemTB >= 7) {
			System.out.println("Học sinh khá");
		} else if (diemTB < 9 && diemTB >= 8) {
			System.out.println("Học sinh giỏi");
		} else {
			System.out.println("Học sinh khá");
		}
		
		scanner.close();
	}
}
