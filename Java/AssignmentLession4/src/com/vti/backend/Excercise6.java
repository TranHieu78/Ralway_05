package com.vti.backend;

import com.vti.emtity.AbstractionQ1.Phone;
import com.vti.emtity.AbstractionQ1.VietnamesePhone;
import com.vti.emtity.AbstractionQ2.Employee;
import com.vti.emtity.AbstractionQ2.Manager;
import com.vti.emtity.AbstractionQ2.Waiter;

public class Excercise6 {
	public void question1() {
		Phone phone = new VietnamesePhone();
		phone.insertContact("Đăng Black", "0825294200");
		phone.removeContact("Đăng Black");
		phone.updateContact("Đăng Black", "0962282193");
		phone.searchContact("Đăng Black");
	}

	public void Q2_3() {
		Employee x = new Employee("Hiếu", 6.3);
		x.displayInfo();
		System.out.println();
		
		Manager c = new Manager("Hạnh", 5.2);
		c.displayInfo();
		System.out.println();
		
		Waiter z = new Waiter("Nguyên", 2.6);
		z.displayInfo();
		System.out.println();
	}
}
