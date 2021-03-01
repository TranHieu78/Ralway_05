package com.vti.frontend;

import java.util.Scanner;

import com.vti.backend.Abstraction2.TuyenSinh;

public class Abstractionq2 {
	public static void main(String[] args) {
		TuyenSinh tuyensinh = new TuyenSinh();
		Scanner scanner = new Scanner(System.in);

		while (true) {
			System.out.println();
			System.out.println("Mời bạn chọn chức năng\n" + "1.Thêm mới thí sinh.\n"
					+ "2.Hiện thị thông tin của thí sinh và khối thi của thí sinh.\n" + "3.Tìm kiếm theo số báo danh.\n"
					+ "4.Thoát khỏi chương trình.");
			System.out.print("Nhập: ");
			int x = scanner.nextInt();
			switch (x) {
			case 1:
				tuyensinh.add();
				break;
			case 2:
				tuyensinh.showInfo();
				break;
			case 3:
				tuyensinh.findInfo();
				break;
			case 4:
				return;
			default:
				System.out.println("Mời bạn nhập lại");
				break;
			}

		}
	}
}
