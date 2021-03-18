package com.vti.backend;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

import com.vti.emtity.Collection.Student;

import Utils.ScannerUtils;

public class CollectionQ1 {
	ArrayList<Student> students = new ArrayList<>();
	Student studente = new Student();

	public void Q1() {

		int n = ScannerUtils.inputPositiveInt("Hãy nhập 1 số", "Nhập số lượng student muốn nhập: ");

		for (int i = 0; i < n; i++) {
			studente.inputStudent();
			students.add(studente);
		}
	}

	public void print() {
		for (Student student : students) {
			System.out.println(student);
		}
	}

	public void a() {
		System.out.println(students.size());
	}

	public void b() {
		System.out.println(students.get(4));
	}

	public void c() {
		System.out.println(students.get(0));
		System.out.println(students.get(students.size() - 1));
	}

	public void d() {
		students.add(0, new Student("avc"));
		System.out.println("danh sách sau khi thay đổi");
		print();
	}

	public void e() {
		students.add(students.size(), new Student("avc"));
		System.out.println("danh sách sau khi thay đổi");
		print();
	}

	public void f() {
		Collections.reverse(students);
		System.out.println("danh sách sau khi thay đổi");
		print();
	}

	public void g() {
		int a = ScannerUtils.inputPositiveInt("ID là 1 số", "Nhập ID: ");
		System.out.println(students.get(a - 1));
	}

	public void h() {
		String a = ScannerUtils.inputString("Không được để trống", "Nhập name: ");
		for (Student student : students) {
			if (a.toLowerCase().contains(student.getName().toLowerCase())) {
				System.out.println(student);
			}
		}
	}

	public void i() {
		for (int i = 0; i < students.size(); i++) {
			for (int j = i + 1; j < students.size(); j++) {
				// So sánh tên của student
				if (students.get(i).getName().equals(students.get(j).getName())) {
					System.out.println("Các student trùng tên: ");
					System.out.println(students.get(i));
					System.out.println(students.get(j));
				}
			}
		}
	}
	
	public void j() {
		for (Student student : students) {
			if (student.getId() == 2) {
				student.setName(null);
			}
		}

		System.out.println("Danh sách student sau khi xóa name id 2: ");
		print();
	}
	
	public void k() {
		for (Student student : students) {
			if (student.getId() == 5) {
				students.remove(4);
			}
		}

		System.out.println("Danh sách student sau khi xóa name id 2: ");
		print();
	}
	
	public void l() {
		ArrayList<Student> studentCopies = new ArrayList<>();
		
		for (Student student : students) {
			studentCopies.add(student);
		}
		
		for (Student student : studentCopies) {
			System.out.println(student);
		}
	}
}
