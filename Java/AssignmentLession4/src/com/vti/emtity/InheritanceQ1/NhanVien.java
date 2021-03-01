package com.vti.emtity.InheritanceQ1;

import java.util.Scanner;

public class NhanVien extends CanBo {
	private String work;


	public String getWork() {
		return work;
	}

	@Override
	public void input() {
		super.input();

		Scanner scanner = new Scanner(System.in);

		System.out.println("Nhập công việc: ");
		work = scanner.nextLine();
	}

	@Override
	public void getInfor() {
		super.getInfor();
		System.out.println("Công việc  : " + work);
	}
}
