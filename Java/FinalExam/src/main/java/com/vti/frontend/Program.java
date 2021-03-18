package com.vti.frontend;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

import com.vti.untils.ScannerUtils;

public class Program {
	public static void main(String[] args) throws FileNotFoundException, ClassNotFoundException, IOException, SQLException {
		menuLogin();
	}

	private static void menuLogin() throws FileNotFoundException, ClassNotFoundException, IOException, SQLException {
		Function function = new Function();

		System.out.println("Moi ban nhap chuc nang muon su dung:\n" + "1: Đăng kí ExperienceCandidate\n"
				+ "2: Đăng kí FresherCandidate\n" + "3: Đăng nhập\n" + "4: Thoát.");

		while (true) {
			int choose = ScannerUtils.inputApproxInt("Ban chi duoc chon tu 1 --> 5. Mời nhập lại!",
					"Moi ban nhap chuc nang: ", 4);

			switch (choose) {
			case 1:
				function.registerExperienceCandidate();
				break;
			case 2:
				function.registerFresherCandidate();
				break;
			case 3:
				function.login();
				break;
			case 4:
				System.out.println("bạn đã thoát khỏi chương trình!");
				return;
			}

		}
	}
}