package com.vti.emtity.Collection;

import java.util.Scanner;

/**
 * @author thaih
 *
 */
public class Student {
	public static int count = 0;
	private String name;
	private int id;
	
	public Student() {
		inputStudent();

	}

	public Student(String name) {
		this.name = name;
		count++;
	}

	public void inputStudent() {
		Scanner scanner = new Scanner(System.in);

		System.out.print("nhập tên học sinh: ");
		name = scanner.nextLine();
		count++;
		id = count;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Student [name=" + name + "  Id: " + id + "]";
	}

}
