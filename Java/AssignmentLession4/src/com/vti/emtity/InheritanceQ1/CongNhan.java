package com.vti.emtity.InheritanceQ1;

import java.util.Scanner;

public class CongNhan extends CanBo {
	private int level;

	public int getLevel() {
		return level;
	}

	@Override
	public void input() {
		super.input();

		Scanner scanner = new Scanner(System.in);

		System.out.println("Nhập bậc của công nhân: ");
		level = scanner.nextByte();
	}

	@Override
	public void getInfor() {
		super.getInfor();
		System.out.println("Bậc  : " + level);
	}
}
