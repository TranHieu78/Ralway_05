package com.vti.frontend;

import java.sql.Date;

import com.vti.emtity.Student;

public class AnnotationsQ1_2 {
	@SuppressWarnings({ "deprecation", "static-access" })
	public static void main(String[] args) {
		Date date = new Date(2021, 15, 18);
		
		Student student = new Student("Nguyễn Văn A");
		System.out.println(student.getName());
		System.out.println(student.getId());
		student.getId2();
		
	}
}
