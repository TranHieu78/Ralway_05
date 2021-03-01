package com.vti.emtity.AbstractionQ2;

import java.util.Scanner;

public class People {
	private String maBD;
	private String name;
	private String address;
	private int mucUT;
	private Khoi khoiThi;
	
	
	public String getMaBD() {
		return maBD;
	}
	public void setMaBD(String maBD) {
		this.maBD = maBD;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getMucUT() {
		return mucUT;
	}
	public void setMucUT(int mucUT) {
		this.mucUT = mucUT;
	}
	public Khoi getKhoiThi() {
		return khoiThi;
	}
	public void setKhoiThi(Khoi khoiThi) {
		this.khoiThi = khoiThi;
	}
	
	public void AddNew() {
		Scanner scanner = new Scanner(System.in);
		khoiThi = new Khoi();
		
		System.out.println("Mời bạn nhập khoiThi:  (A hoặc B hoặc C)");
		khoiThi.setTen(scanner.nextLine());
		
		System.out.println("Mời bạn nhập maBD: ");
		maBD = scanner.nextLine();
		
		System.out.println("Mời bạn nhập name: ");
		name = scanner.nextLine();
				
		System.out.println("Mời bạn nhập address: ");
		address = scanner.nextLine();
				
		System.out.println("Mời bạn nhập mucUT: ");
		mucUT = scanner.nextInt();
		
	
	}
	@Override
	public String toString() {
		return "People [maBD= " + maBD + ", name= "  + name + ", address= " + address + ", mucUT= " + mucUT + ", khoiThi= "
				+ khoiThi.getMonThi() + "]";
	}
	
	
}
