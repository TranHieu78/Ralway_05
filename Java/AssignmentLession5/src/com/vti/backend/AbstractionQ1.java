package com.vti.backend;

import java.util.Scanner;

import com.vti.emtity.AbstractionQ1.News;

public class AbstractionQ1 {
	public void Q1() {

		News abc = new News();
		Scanner scanner = new Scanner(System.in);

		while (true) {
			System.out.println();
			System.out.println("Mời bạn chọn chức năng\n" + "1.Insert news\n" + "2.View list news\n"
					+ "3.Average rate\n" + "4.Exit\n");
			System.out.print("Nhập: ");
			int x = scanner.nextInt();
			switch (x) {
			case 1:
				abc.AddNew();
				break;
			case 2:
				abc.Display();
				break;
			case 3:
				abc.Calculate();
				abc.Display();
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