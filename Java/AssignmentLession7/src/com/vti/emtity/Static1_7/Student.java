package com.vti.emtity.Static1_7;

public class Student {
	private int id;
	private String name;
	public static int count = 0;
	public static String college = "�?ại h�?c Bách Khoa";
	public static int moneyGroup = 0;
	public static int maxStudent = 7;

	public Student(int id, String name) {
		if (count >= maxStudent) {
			System.out.println("Tối đa chỉ thêm được 7 h�?c sinh");
			return;
		}
			this.id = id;
		this.name = name;
		count++;		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public static void changecollege(String college) {
		Student.college = college;
	}

	public static String getCollege() {
		return college;
	}

	@Override
	public String toString() {
		return "Student [id= " + id + ", name= " + name + " college= " + college + "]";
	}

}
