package com.vti.backend;

import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

import com.vti.emtity.PolymorphismQ1.Student;

public class PolymorphismQ1 {
	Scanner scanner = new Scanner(System.in);
	Random random = new Random();
	ArrayList<Student> students = new ArrayList<>();

	public void ctrinh() {
		System.out.println("Nhập 10 học sinh");
		for (int i = 0; i < 10; i++) {
			Student studente = new Student();
			System.out.println("Học sinh thứ " + (i + 1));

			System.out.println("Mời bạn nhập name: ");
			studente.setName(scanner.nextLine());

			studente.setId(i + 1);

			studente.setGroup(random.nextInt(3) + 1);

			students.add(studente);
		}

		System.out.println();
		
		for (Student student2 : students) {
			System.out.println(student2.getName() + " " + student2.getGroup());
		}

		System.out.println();
		
		System.out.println("cả lớp điểm danh");
		for (Student student : students) {
			student.diemDanh();
		}

		System.out.println("nhóm đi học bài: ");
		int x = scanner.nextInt();

		for (int i = 0; i < students.size(); i++) {
			if (x == students.get(i).getGroup()) {
				students.get(i).hocBai();
			} else
				continue;
		}

		System.out.println();
		
		System.out.println("nhóm đi dọn vệ sinh: ");
		int z = scanner.nextInt();
		for (int i = 0; i < students.size(); i++) {
			if (z == students.get(i).getGroup()) {
				students.get(i).donVS();
			} else
				continue;
		}
	}
}
