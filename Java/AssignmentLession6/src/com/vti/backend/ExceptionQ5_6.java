package com.vti.backend;

import java.util.Scanner;

public class ExceptionQ5_6 {

	public void question5() {
		int c = inputAge();
		System.out.println("số bạn vừa nhập: " + c);
	}

	public int inputAge() {
		
	
		while (true) {
	
			try {
				
				Scanner scanner = new Scanner(System.in);
				System.out.print("nhập vào 1 số: ");
				 int x = scanner.nextInt();
				if (x >= 0) {
					return x;
				} else {
					System.out.println("Wrong inputing! The age must be greater than 0, please input again.");
					continue;
				}

			} catch (Exception e) {
				System.out.println("wrong inputing! Please input an age as int, input again.\n Please try agian !");
				continue;
			}

		}
	}
}