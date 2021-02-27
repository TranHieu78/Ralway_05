package com.vti.emtity;

public class absHighSchoolStudent extends abstractStudent {
	String clazz;
	String desiredUniversity;

	public absHighSchoolStudent(String name, int id, String clazz, String desiredUniversity) {
		super(name, id);
		this.clazz = clazz;
		this.desiredUniversity = desiredUniversity;
	}
}
