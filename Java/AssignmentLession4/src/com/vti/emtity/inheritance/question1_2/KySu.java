package com.vti.emtity;

import java.util.Scanner;

public class KySu extends CanBo{
		private String nghanh;
		
		public String getNghanh() {
			return nghanh;
		}

		@Override
		public void input() {
			super.input();

			Scanner scanner = new Scanner(System.in);

			System.out.println("Nhập ngành đào tạo: ");
			nghanh = scanner.nextLine();
		}

		@Override
		public void getInfor() {
			super.getInfor();
			System.out.println("Ngành đào tạo  : " + nghanh);
		}
}
