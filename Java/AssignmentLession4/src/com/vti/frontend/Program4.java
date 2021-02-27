package com.vti.frontend;

import com.vti.emtity.Student;

public class Program4 {
	@SuppressWarnings("deprecation")
	public static void main(String[] args) {
		Student student1 = new Student("Nguyen van a","Ha Noi");
		student1.setPoint(8);
		Student[] students = {student1};
			System.out.println(student1);
	}
}
