package com.vti.frontend;

import com.vti.emtity.Static1_7.PrimaryStudent;
import com.vti.emtity.Static1_7.SecondaryStudent;
import com.vti.emtity.Static1_7.Student;

public class StaticQuestion6 {
	public static void main(String[] args) {
		for (int i = 0; i < 9; i++) {
			if (i < 2) {
				PrimaryStudent primaryStudent = new PrimaryStudent(i, "a");
			} else {
				SecondaryStudent secondaryStudent = new SecondaryStudent(i, "b");
			}
		}
		System.out.println(PrimaryStudent.count1);
		System.out.println(SecondaryStudent.count2);
		System.out.println(Student.count);
	}
}
