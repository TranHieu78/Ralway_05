package com.vti.emtity.PolymorphismQ2;

import java.util.Scanner;

public class Person {
	private String name;
	private String gender;
	private String date;
	private String address;
	
	public Person() {
	}
	
	public Person(String name, String gender, String date, String address ) {
		this.name= name;
		this.gender= gender;
		this.date= date;
		this.address= address;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	public void input() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("M�?i bạn nhập Name: ");
		name = scanner.nextLine();
		
		System.out.println("M�?i bạn nhập gender: ");
		gender = scanner.nextLine();
				
		System.out.println("M�?i bạn nhập date: ");
		date = scanner.nextLine();
				
		System.out.println("M�?i bạn nhập address: ");
		address = scanner.nextLine();
		
	}
	

	public void showInfo() {
		System.out.println();
		System.out.println("Ngư�?i bạn vừa nhập \n name= " + name + "\n gender= " + gender + "\n date= " + date + "\n address= " + address ); 
	}
		
}
