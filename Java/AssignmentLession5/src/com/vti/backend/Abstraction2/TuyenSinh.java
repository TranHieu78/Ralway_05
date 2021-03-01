package com.vti.backend.Abstraction2;

import java.util.ArrayList;
import java.util.Scanner;

import com.vti.emtity.AbstractionQ2.People;

public class TuyenSinh implements ITuyenSinh {

	Scanner scanner = new Scanner(System.in);
	ArrayList<People> Admissions = new ArrayList<>();

	public void add() {
		System.out.println("số thí sinh muốn nhập");
		int x = scanner.nextInt();

		for (int i = 0; i < x; i++) {
			People people = new People();
			people.AddNew();
			Admissions.add(people);
		}
	}

	public void showInfo() {
		for (People people : Admissions) {
			System.out.println(people);
		}
	}

	public void findInfo() {
		System.out.println("Nhập sbd cần tìm: ");
		String sbd = scanner.nextLine();

		for (People examinee : Admissions) {
			if (examinee.getMaBD().equals(sbd)) {
				System.out.println(examinee);
			}
		}
	}
}
