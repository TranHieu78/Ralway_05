package com.vti.emtity.PolymorphismQ2;

import java.util.Scanner;

public class Student extends Person {
	private int maSV;
	private float diemTB;
	private String email;
	
	private String x;

	public int getMaSV() {
		return maSV;
	}

	public void setMaSV(int maSV) {
		this.maSV = maSV;
	}

	public float getDiemTB() {
		return diemTB;
	}

	public void setDiemTB(float diemTB) {
		this.diemTB = diemTB;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void input() {
		super.input();

		Scanner scanner = new Scanner(System.in);
		
		System.out.println("M�?i bạn nhập email: ");
		email = scanner.nextLine();

		System.out.println("M�?i bạn nhập mã sinh viên: ");
		maSV = scanner.nextInt();

		System.out.println("M�?i bạn nhập điểm trung bình: ");
		diemTB = scanner.nextFloat();

		
	}

	public void xeploai() {
		
		if (diemTB > 8) {
			x = "�?ược h�?c bổng";
		} else {
			x = "Không được h�?c bổng";
		}
	}

	public void showInfo() {
		super.showInfo();

		System.out.println(" mã sinh viên: " + maSV + "\n �?iểm trung bình: " + diemTB + "\n Email: " + email + "\n Xếp loại: " + x);
	}
}
