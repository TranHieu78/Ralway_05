package com.vti.emtity.Comparing;

import java.time.LocalDate;
import java.util.Comparator;
import java.util.Scanner;

import Utils.ScannerUtils;

public class Student {
	private static int id;
	private String name;
	private String date;
	private int diem;

	public Student() {
		input();
	}
	
	

	public Student(String name, String date, int diem) {
		this.name = name;
		this.date = date;
		this.diem = diem;
		id++;
	}



	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getDate() {
		return date;
	}

	public int getDiem() {
		return diem;
	}

	public void input() {

		name = ScannerUtils.inputString("Không được để trống", "Mời nhập tên : ");


		date = ScannerUtils.inputString("Không được để trống", "Mời nhập date : ");

	
		diem = ScannerUtils.inputPositiveInt("Hãy nhập 1 số", "Mời nhập điểm : ");
		id++;
	}



	@Override
	public String toString() {
		return "Student [name= " + name + ", date= " + date + ", diem= " + diem + "]";
	}


}
