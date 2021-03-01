	package com.vti.frontend;

import java.util.Scanner;

import com.vti.backend.Excercise5;

public class Program5 {
	public static void main(String[] args) {
		Excercise5 QlCB1 = new Excercise5();
		Excercise5 QlTV1 = new Excercise5();
		Scanner scanner = new Scanner(System.in);
		
		
// 	Q1-2
		
		while (true) {
			System.out.println();
			System.out.println("Mời bạn chọn chức năng\n" + "1.Thêm mới cán bộ.\n" + "2.Tìm kiếm theo họ tên.\n" + "3.Hiện thị thông tin về danh sách các cán bộ.\n"
					+ "4.Nhập vào tên của cán bộ và delete cán bộ đó.\n" + "5.Thoát khỏi chương trình.");
			System.out.print("Nhập: ");
					int x = scanner.nextInt();
			switch (x) {
			case 1: 
				QlCB1.addCanbo();
				break;
				case 2:
					QlCB1.findCanBo();
					break;
				case 3:
					QlCB1.inforCanBo();
					break;
				case 4:
					QlCB1.deleteCanbo();
					break;
				case 5:
					return;
			default:
				System.out.println("Mời bạn nhập lại");
				break;
			}
			
		}
		
		
// Q4
//		while (true) {
//			System.out.println();
//			System.out.println("Mời bạn chọn chức năng\n" + "1.Thêm mới tài liêu: Sách, tạp chí, báo.\n" + "2.Xoá tài liệu theo mã tài liệu.\n" + "3.Hiện thị thông tin về tài liệu.\n"
//					+ "4.Tìm kiếm tài liệu theo loại: Sách, tạp chí, báo.\n" + "5.Thoát khỏi chương trình.");
//			System.out.print("Nhập: ");
//					int x = scanner.nextInt();
//			switch (x) {
//			case 1: 
//				QlTV1.AddTaiLieu();
//				break;
//				case 2:
//					QlTV1.deleteTaiLieu();
//					break;
//				case 3:
//					QlTV1.inforTaiLieu();
//					break;
//				case 4:
//					QlTV1.findTaiLieu();
//					break;
//				case 5:
//					return;
//			default:
//				System.out.println("Mời bạn nhập lại");
//				break;
//			}
//			
//		}
		
		
		
		
		
		
	}
}