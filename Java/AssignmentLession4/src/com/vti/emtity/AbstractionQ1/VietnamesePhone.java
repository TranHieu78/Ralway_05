package com.vti.emtity.AbstractionQ1;

public class VietnamesePhone extends Phone{

	@Override
	public void insertContact(String name, String phone) {
		System.out.println("Insert new contact with " + name + " and phone " + phone);
		
	}

	@Override
	public void removeContact(String name) {
		System.out.println("Removing contact with name :" + name);
		
	}

	@Override
	public void updateContact(String name, String newPhone) {
		System.out.println("Update contact " + name + " with new phone " + newPhone);
		
	}

	@Override
	public void searchContact(String name) {
		System.out.println("Search contact " + name + "...");
		
	}

}
