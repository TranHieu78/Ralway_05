package com.vti.frontend.Generic;

import com.vti.emtity.Generic.Student;

public class Question1_2 {
	public static void main(String[] args) {
		Student<Integer> student = new Student<>(1, "a");
		Student<Float> student1 = new Student<>(1.1f, "a");
		Student<Double> student2 = new Student<>(2.3d, "a");
		
		print(4);
		print(student);
		print(4.0);
	}
	
  static  <T> void print(T a) {
	  System.out.println(a);
	}
}
