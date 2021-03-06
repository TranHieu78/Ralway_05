package com.vti.emtity.ExceptionQ9_10;

import java.util.Scanner;

import com.vti.backend.ScannerUtils;

public class Student extends ScannerUtils {
	private Scanner scanner;
	private String name;
	private int age;
	private String department;
	private String posion;
	private Group group;


	public Student()  {
		scanner = new Scanner(System.in);
		name = inputString("Please input a name", "Please input your name: ");
		age = inputInt("Please input number as int", "Please input your age: ");
		department = inputString("Please input a name", "Please input your department: ");
		posion = inputString("Please input a name", "Please input your posion: ");
		System.out.println();
		
		
	}

	

	public String getName() {
		return name;
	}

	public int getAge() {
		return age;
	}

	public String getDepartment() {
		return department;
	}

	public String getPosion() {
		return posion;
	}

	@Override
	public String toString() {
		return "Student [name= " + name + ", age= " + age + ", department= " + department + ", posion= " + posion + "]";
	}

}
