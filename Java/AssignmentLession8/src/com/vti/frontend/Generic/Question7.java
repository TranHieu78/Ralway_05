package com.vti.frontend.Generic;

import com.vti.emtity.Generic.Phone;

public class Question7 {
	public static void main(String[] args) {
		Phone<String, String> phone = new Phone<>("hieu@gmail.com", "0976686297");
		System.out.println(phone.getPhoneNumber());
		System.out.println(phone.getKey());
		
		Phone<Integer, String> phone1 = new Phone<>(1, "0976686297");
		System.out.println(phone1.getPhoneNumber());
		System.out.println(phone1.getKey());
		
		Phone<String, String> phone2 = new Phone<>("Trần Đức Hiếu", "0976686297");
		System.out.println(phone2.getPhoneNumber());
		System.out.println(phone2.getKey());
	}
}
