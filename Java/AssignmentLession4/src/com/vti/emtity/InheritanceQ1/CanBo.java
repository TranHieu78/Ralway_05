package com.vti.emtity.InheritanceQ1;

import java.util.Scanner;

public abstract class CanBo {
	private String hoTen;
	private byte tuoi;
	private String gioiTinh;
	private String diaChi;

	public CanBo() {
	}

	public String getHoTen() {
		return hoTen;
	}

	public Byte getTuoi() {
		return tuoi;
	}

	public String getGioiTinh() {
		return gioiTinh;
	}

	public String getDiachi() {
		return diaChi;
	}

	public void input() {
		Scanner scanner = new Scanner(System.in);

		System.out.println("Nhập giới tính: ");
		gioiTinh = scanner.nextLine();
		
		System.out.println("Nhập địa chỉ: ");
		diaChi = scanner.nextLine();
		
		System.out.println("Nhập họ tên: ");
		hoTen = scanner.nextLine();

		System.out.println("Nhập tuổi: ");
		tuoi = scanner.nextByte();



	}

	public void getInfor() {
		System.out.println("Họ tên      : " + hoTen);
		System.out.println("Tuổi        : " + tuoi);
		System.out.println("Giới tính   : " + gioiTinh);
		System.out.println("Địa chỉ     : " + diaChi);
	}

	@Override
	public String toString() {
		return "CanBo{" + "hoten='" + hoTen + '\'' + ", tuoi=" + tuoi + ", gt=" + gioiTinh + ", diachi='" + diaChi
				+ '\'' + '}';
	}
}
