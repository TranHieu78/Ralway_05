package com.vti.backend;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import com.vti.emtity.Collection.Student;

import Utils.ScannerUtils;

public class CollectionQ3 {
	Set<Student> students = new HashSet<>();

	int n = ScannerUtils.inputPositiveInt("Hãy nhập 1 số", "Nhập số lượng student muốn nhập: ");

	public void Q1() {

		for (int i = 0; i < n; i++) {
			Student studente = new Student();
			students.add(studente);
		}
	}

//	a) In ra tổng số phần tử của students
	public void print() {
		for (Student student : students) {
			System.out.println(student);
		}
	}

//	b) Lấy phần tử thứ 4 của students

	public void print4() {
		Iterator<Student> a = students.iterator();
		a.next();
		a.next();
		a.next();
		System.out.println(a.next());
	}

//	c) In ra phần tử đầu và phần tử cuối của students

	public void printFirstAndEnd() {
		Iterator<Student> a = students.iterator();
		for (int i = 0; i < n; i++) {
			if (i == 0) {
				System.out.println(a.next());
				continue;
			} else if (i == n - 1) {
				System.out.println(a.next());
				return;
			}
			a.next();
		}

	}

//	d) Thêm 1 phần tử vào vị trí đầu của students

}
