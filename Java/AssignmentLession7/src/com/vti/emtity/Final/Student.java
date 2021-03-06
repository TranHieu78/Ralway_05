package com.vti.emtity.Final;

public class Student {
	final int id = 1;
	private String name;
	public Student(String name) {
		super();
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public final void study() {
		System.out.println("đang học bài");
	}
}
