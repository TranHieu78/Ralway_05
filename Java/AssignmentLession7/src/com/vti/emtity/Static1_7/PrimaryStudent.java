package com.vti.emtity.Static1_7;

public class PrimaryStudent extends Student{
	public static int count1 =0;

	public PrimaryStudent(int id, String name) {
		super(id, name);
		count1++;
	}

}
