package com.vti.frontend;

import java.util.InputMismatchException;
import java.util.Scanner;

public class ExceptionQuesstion1_2 {
	
	
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("nhập vào số chia");
		int x = 0;
		int y = 0;
		try {
			x = scanner.nextInt();
	
		} catch (InputMismatchException e) {
			System.out.println("wrong input");
		}
		
		System.out.println("nhập vào số bị chia");
		
		
		try {
			 y = scanner.nextInt();
		} catch (InputMismatchException e) {
			System.out.println("wrong input");
		}
		
	
		
		try {
			
			float result = divede(x, y);
			System.out.println(result);
		} catch (ArithmeticException e) {

			System.out.println("cannot divice 0");

		}
		
		finally {
			System.out.println("divide completed");
		}
	}

	public static float divede(int a, int b) {
		return a / b;
	}
}
