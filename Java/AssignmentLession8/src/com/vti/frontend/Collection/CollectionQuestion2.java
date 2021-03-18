package com.vti.frontend.Collection;

import java.util.ArrayDeque;
import java.util.List;
import java.util.Queue;
import java.util.Stack;

public class CollectionQuestion2 {
	public static void main(String[] args) {
		Stack<String> students = new Stack<>();
		students.push("Nguyễn Văn A");
		students.push("Trần Văn Nam");
		students.push("Nguyễn Văn Huyên");
		students.push("Nguyễn Văn Nam");

		System.out.println(students.pop());
		System.out.println(students.pop());
		System.out.println(students.pop());
		System.out.println(students.pop());
		System.out.println();
		
		Queue<String> studentss = new ArrayDeque<>();
		studentss.add("Nguyễn Văn A");
		studentss.add("Trần Văn Nam");
		studentss.add("Nguyễn Văn Huyên");
		studentss.add("Nguyễn Văn Nam");

		System.out.println(studentss.poll());
		System.out.println(studentss.poll());
		System.out.println(studentss.poll());
		System.out.println(studentss.poll());

	}
}
