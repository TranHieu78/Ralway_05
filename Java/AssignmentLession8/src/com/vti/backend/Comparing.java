package com.vti.backend;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

import com.vti.emtity.Comparing.CompartorName;
import com.vti.emtity.Comparing.Student;

import Utils.ScannerUtils;

public class Comparing {
	public void Qu1() {
		
		int x = ScannerUtils.inputPositiveInt("Hãy nhập 1 số", "Số học sinh muốn tạo: ");
		
		List<Student> students = new ArrayList<>();
		
		
		for (int i =0;i<x;i++) {
			Student student = new Student();	
			student.input();
			students.add(student);
		}
		
		Collections.sort(students, new CompartorName());
		
		for (Student student : students) {
			System.out.println(student);
		}
	}
	
	public void Qu2() {
//		int x = ScannerUtils.inputPositiveInt("Hãy nhập 1 số", "Số học sinh muốn tạo: ");
		
		List<Student> students = new ArrayList<>();
		
		students.add(new Student("Kim", "2020-05-29", 8));
		students.add(new Student("Kim", "2020-05-29", 10));
		students.add(new Student("Kiên", "2015-05-04", 6));
		students.add(new Student("Duy", "2020-01-29", 5));
		students.add(new Student("Thắng", "2020-04-29", 8));
		students.add(new Student("Bích", "2020-02-29", 3));
//		for (int i =0;i<x;i++) {
//			Student student = new Student();	
//			student.input();
//			students.add(student);
//		}
		
		Collections.sort(students, new CompartorName());
		
		for (Student student : students) {
			System.out.println(student);
		}
	}
	
}
