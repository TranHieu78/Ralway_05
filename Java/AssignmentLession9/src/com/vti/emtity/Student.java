package com.vti.emtity;

public class Student {
	private static int id = 1;
	private String name;
	
	public Student() {
		
	}
	
	public Student(String name) {
		super();
		this.name = name;
		this.id = id++;
	}


	/** 
	 * @deprecated replaced by {@link #getId2()}}
	 */
	public static int getId() {
		return id;
	}
	
	public static void getId2() {
		System.out.println("MSV: " + id); ;
	}

	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "Student [name= " + name + "]";
	}
	
}
