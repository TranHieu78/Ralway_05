package com.vti.frontend;

public class Ex3Qu1 {
	public static void main(String[] args) {
//		for (int i = 1; i < 9; i++) {
//			for (int c = 0; c < i; c++) {
//				System.out.print("# ");
//			}
//			if (i == 8) {
//				return;
//			}
//			System.out.println();
//		}

		for (int i = 8; i > 0; i--) {
			for (int c = 0; c < i; c++) {
				System.out.printf("%");
				System.out.print(" #");
			}
			if (i == 1) {
			return;
		}
		System.out.println();
		}
	}
}
