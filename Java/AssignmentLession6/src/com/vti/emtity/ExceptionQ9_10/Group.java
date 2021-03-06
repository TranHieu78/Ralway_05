package com.vti.emtity.ExceptionQ9_10;

import java.util.Scanner;

import com.vti.backend.ScannerUtils;

public class Group extends ScannerUtils {
	Scanner scanner = new Scanner(System.in);
	private int id;
	private String name;
	private Student[] students;

	public Group() {

		id = inputInt("Please input number as int", "Please input your id: ");
		name = inputString("Please input a name", "Please input your name: ");
		AddStudents();
	}

	public void AddStudents() {
		students = new Student[1000];

		while (true) {
			System.out.print("Bạn có muốn thêm student không?(1 là có, 2 là không: ");
			int x = scanner.nextInt();

			switch (x) {
			case 1:
				System.out.print("số student muốn nhập: ");
				int y = scanner.nextInt();
				for (int i = 0; i < y; i++) {
					students[i] = new Student();
				}
			case 2:
				return;

			default:
				System.out.println("Chỉ được nhập 1 hoặc 2, mời nhập lại: ");
				break;
			}
		}

	}
}
