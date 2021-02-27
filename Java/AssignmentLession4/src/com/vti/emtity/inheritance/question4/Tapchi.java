package com.vti.emtity;

import java.util.Scanner;

public class Tapchi extends TaiLieu{
	private int soPhatHanh;
	private byte thangPhatHanh;

	public int getSoPhatHanh() {
		return soPhatHanh;
	}

	public byte getThangPhatHanh() {
		return thangPhatHanh;
	}

	public void input() {
		super.input();

		Scanner scanner = new Scanner(System.in);

		System.out.println("Nhập số phát hành: ");
		soPhatHanh = scanner.nextInt();

		System.out.println("Nhập tháng phát hành: ");
		thangPhatHanh = scanner.nextByte();
	}

	public void getInfor() {
		super.getInfor();

		System.out.println("Số phát hành: " + soPhatHanh);
		System.out.println("Tháng phát hành: " + thangPhatHanh);
	}
}
