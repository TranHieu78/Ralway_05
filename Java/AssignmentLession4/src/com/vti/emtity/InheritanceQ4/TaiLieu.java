package com.vti.emtity.InheritanceQ4;

import java.util.Scanner;

public class TaiLieu {
	private static int counter = 1000;

	private int maTaiLieu;
	private String publisher;
	private int number;

	public TaiLieu() {
		maTaiLieu = ++counter;
	}

	public int getMaTaiLieu() {
		return maTaiLieu;
	}
	
	public String getPublisher() {
		return publisher;
	}	

	public int getNumber() {
		return number;
	}

	public void input() {
		Scanner scanner = new Scanner(System.in);

		System.out.println("Mã tài liệu: " + maTaiLieu);

		System.out.println("Nhập tên NXB: ");
		publisher = scanner.nextLine();

		System.out.println("Nhập số bản phán hành: ");
		number = scanner.nextInt();
	}
	
	public void getInfor() {
		System.out.println("Mã tài liệu: " + maTaiLieu);
		System.out.println("Tên NXB: " + publisher);
		System.out.println("Số bản phán hành: " + number);
	}
}
