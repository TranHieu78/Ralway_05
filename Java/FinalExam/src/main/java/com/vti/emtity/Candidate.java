package com.vti.emtity;

import com.vti.untils.ScannerUtils;

public class Candidate {
	private String firstName;
	private String lastName;
	private String phone;
	private String email;
	private String passWord;

	public Candidate(String firstName, String lastName, String phone2, String email, String passWord) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.phone = phone2;
		this.email = email;
		this.passWord = passWord;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public String getPassWord() {
		return passWord;
	}

	public void candidateInfo() {
		System.out.println("firstName: " + firstName);
		System.out.println("lastName: " + lastName);
		System.out.println("phone: " + phone);
		System.out.println("email: " + email);
		System.out.println("passWord: " + passWord);
	}

}
