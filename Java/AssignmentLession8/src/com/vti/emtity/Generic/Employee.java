package com.vti.emtity.Generic;

import java.util.Arrays;

public class Employee<T> {
	private static int id = 1;
	private String name;
	private T[] salaries;

	public Employee(String name, T[] salaries) {
		this.name = name;
		this.salaries = salaries;
		this.id = id++;
	}

	public static int getId() {
		return id;
	}

	public static void setId(int id) {
		Employee.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public T[] getSalaries() {
		return salaries;
	}

	public void setSalaries(T[] salaries) {
		this.salaries = salaries;
	}


	@Override
	public String toString() {
		return "Employee [name=" + name + ", salaries=" + Arrays.toString(salaries) + ", ID: " + id + "]";
	}

	public void print() {
		System.out.println(this.salaries[this.salaries.length - 1]);
	}

}
