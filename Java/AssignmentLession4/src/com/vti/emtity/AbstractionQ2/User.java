package com.vti.emtity.AbstractionQ2;

public abstract class User {
		private String name;
		private double salaryRatio;
		
		
		public User(String name,double salaryRatio ) {
			this.name = name;
			this.salaryRatio = salaryRatio;
		}
		
		public String getName() {
			return name;
		}
		
		public double getSalaryRatio() {
			return salaryRatio;
		}
		
		public void setName(String name) {
			this.name = name;
		}
		
		public void setSalaryRatio(double salaryRatio) {
			this.salaryRatio = salaryRatio;
		}
		
		public abstract	 double calculatePay();
	
		public void displayInfo() {
			System.out.println("Name: " + name);
			System.out.println("Salary ratio: " + salaryRatio);
			System.out.println("Pay: " + calculatePay());
		}
}	
	