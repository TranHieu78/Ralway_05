package com.vti.emtity.EncapsulationQ1;

public class Student {
	private int id;
	private String name;
	private String hometown;
	private float point;
	Student[] students;

	public Student(String name, String hometown) {
		this.name = name;
		this.hometown = hometown;
		this.point = 0;
	}

	public float getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public void addPoint(int point) {
		this.point = this.point + point;
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

	public String getHometown() {
		return hometown;
	}

	public void setHometown(String hometown) {
		this.hometown = hometown;
	}

	public String toString() {
		String grade;
		if (point < 4.0) {
			grade = "Yeu";
		} else if (point < 6) {
			grade = "Trung binh";
		} else if (point < 8) {
			grade = "Kha";
		} else {
			grade = "Gioi";
		}

		return "Student{" + "id=" + id + ", name='" + name + '\'' + ", hometown='" + hometown + '\'' + ", Point			="
				+ point + ", xepLoai='" + grade + '\'' + '}';
	}

}
