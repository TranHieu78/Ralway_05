package com.vti.emtity.AbstractionQ2;

public class Manager extends User {

	public Manager(String name, double salaryRatio) {
		super(name, salaryRatio);
		// TODO Auto-generated constructor stub
	}

	@Override
	public double calculatePay() {
		return getSalaryRatio() * 520;
	}

}
