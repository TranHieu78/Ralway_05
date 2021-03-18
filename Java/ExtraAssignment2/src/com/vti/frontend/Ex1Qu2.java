package com.vti.frontend;
import java.util.Scanner;

public class Ex1Qu2 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("nhập 1 số từ 0 đến 68399: ");
		int a = scanner.nextInt();
		
		int y = a/3600;
		int x = (a-y*3600)/60;
		int z = a - x*60 - y*3600;
		
		System.out.print(String.format("%02d:%02d:%02d",y,x,z));
		
		scanner.close();
	}
	
	
}
