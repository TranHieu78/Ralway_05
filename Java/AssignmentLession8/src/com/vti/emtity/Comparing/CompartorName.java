package com.vti.emtity.Comparing;

import java.util.Collections;
import java.util.Comparator;

public class CompartorName implements Comparator<Student> {

	@Override
	public int compare(Student student1, Student student2) {
		if (student1.getName() == null) {
			return -1;
		}

		if (student2.getName() == null) {
			return 1;
		}

		String[] s = student1.getName().split(" ");
		String[] a = student2.getName().split(" ");

		if(a[a.length - 1].compareTo(s[s.length - 1]) == 0) {
			if(student1.getDate().compareTo(student2.getDate()) <0  ) {
				return 1;
			}else if(student1.getDate().compareTo(student2.getDate()) > 0  ) {
				return -1;
			}else {
				if(student1.getDiem() < student2.getDiem()) {
					return 1;
				}else if(student1.getDiem() > student2.getDiem()) {
					return -1;
				}
			}
		} 
			
		return a[a.length - 1].compareTo(s[s.length - 1]);

	}
}
