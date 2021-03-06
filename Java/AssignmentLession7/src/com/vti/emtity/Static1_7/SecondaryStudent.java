package com.vti.emtity.Static1_7;

public class SecondaryStudent extends Student {
	public static int count2 = 0;

	public SecondaryStudent(int id, String name) {
		super(id, name);
		count2++;
	}

}
