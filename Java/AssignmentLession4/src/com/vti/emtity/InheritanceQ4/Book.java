package com.vti.emtity.InheritanceQ4;

import java.util.Scanner;

public class Book extends TaiLieu {
	private String tenTacGia;
	private int soTrang;

	public String getTenTacGia() {
		return tenTacGia;
	}

	public int getSoTrang() {
		return soTrang;
	}

	public void input() {
		super.input();

		Scanner scanner = new Scanner(System.in);

		System.out.println("Nhập tên tác giả: ");
		tenTacGia = scanner.nextLine();

		System.out.println("Nhập số trang: ");
		soTrang = scanner.nextInt();
	}

	public void getInfor() {
		super.getInfor();

		System.out.println("Tên tác giả: " + tenTacGia);
		System.out.println("Số trang: " + soTrang);
	}
}
