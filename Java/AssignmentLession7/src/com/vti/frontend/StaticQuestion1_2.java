package com.vti.frontend;

import com.vti.emtity.Static1_7.Student;

public class StaticQuestion1_2 {
public static void main(String[] args) {
	Student student1 = new Student(1,"Nguyễn Văn A");
	Student student2 = new Student(2,"Nguyễn Văn B");
	Student student3 = new Student(3,"Nguyễn Văn C");
	
	Student[] students = {student1, student2, student3};
	
//	for (Student student : students) {
//		System.out.println(student);
//	}
//	
//	Student.college = "Đại học công nghệ";
//	
//	for (Student student : students) {
//		System.out.println(student);
//	}
	
	
	student1.moneyGroup = Student.moneyGroup + 100;
	student2.moneyGroup = Student.moneyGroup + 100;
	student3.moneyGroup = Student.moneyGroup + 100;
	System.out.println(Student.moneyGroup);
	
	student1.moneyGroup = Student.moneyGroup - 50;
	System.out.println(Student.moneyGroup);
	
	student2.moneyGroup = Student.moneyGroup - 20;
	System.out.println(Student.moneyGroup);
	
	student3.moneyGroup = Student.moneyGroup - 150;
	System.out.println(Student.moneyGroup);
	
	student1.moneyGroup = Student.moneyGroup + 50;
	student2.moneyGroup = Student.moneyGroup + 50;
	student3.moneyGroup = Student.moneyGroup + 50;
	System.out.println(Student.moneyGroup);
	
	
	

}
}
