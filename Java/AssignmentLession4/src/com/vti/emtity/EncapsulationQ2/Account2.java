package com.vti.emtity.EncapsulationQ2;

public class Account2 {
	private int id;
	private String name;
	private int balance;

	 Account2(int id, String name, int balance) {
		this.id = id;
		this.name = name;
		this.balance = balance;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public int getBalance() {
		return balance;
	}

	public int credit(int amount) {
		return amount;
	}

	public int debit(int amount) {
		return amount;
	}

	public void tranferTo(Account2 account, int amount) {
		System.out.println("Tranfer " + account + " to " + account.getName());
	}
}
