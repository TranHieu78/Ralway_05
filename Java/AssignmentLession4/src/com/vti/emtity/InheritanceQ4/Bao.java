package com.vti.emtity.InheritanceQ4;

import java.time.LocalDate;
import java.util.Scanner;

public class Bao extends TaiLieu {
	private String ngayPhatHanh;

	public String getNgayPhatHanh() {
		return ngayPhatHanh;
	}

	public void input() {
		super.input();

		Scanner scanner = new Scanner(System.in);

		System.out.println("Nhập ngày phát hành: ");
		ngayPhatHanh = scanner.nextLine();
	}

	public void getInfor() {
		super.getInfor();

		System.out.println("Ngày phát hành: " + getNgayPhatHanh());
	}

	
}
