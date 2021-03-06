package com.vti.backend;

import java.util.Scanner;

import com.vti.frontend.ExceptionQuestion4;

public class ExceptionQ4 {
	int[] departments = { 1, 2, 3 };

	public void Q4() {
		ExceptionQ4 ex = new ExceptionQ4();
		Scanner scanner = new Scanner(System.in);
		
		try {
			
			System.out.print("Bạn muốn xem phần tử nào: ");
			int x = scanner.nextInt();
			ex.getIndex(x - 1);

		} catch (Exception e) {
			System.out.println("Cannot find department");
		}
		
		finally {
			scanner.close();
		}
	}

	public void getIndex(int index) {
		System.out.println(departments[index]);
	}
}
