package com.vti.frontend.Generic;

import com.vti.emtity.Generic.Employee;

public class Question5 {
	public static void main(String[] args) {
		Integer[] a = { 1, 2, 3, 4, 5 };
		Employee<Integer> employee = new Employee<>("a", a);
		System.out.println(employee);
		employee.print();
		
		Float[] b = { 1f, 2f, 3f, 4f, 5f };
		Employee<Integer> employee1 = new Employee<>("a", a);
		System.out.println(employee);
		employee.print();
		
		Double[] c = { 1d, 2d, 3d, 4d, 5d };
		Employee<Integer> employee2 = new Employee<>("a", a);
		System.out.println(employee);
		employee.print();
	}
}
