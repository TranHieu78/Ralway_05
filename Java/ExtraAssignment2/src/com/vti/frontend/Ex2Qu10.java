package com.vti.frontend;


public class Ex2Qu10 {
	public static void main(String[] args) {

		
		for (int i = 100; i < 1000; i++) {
			String x = String.valueOf(i);
			String[] c = x.split("");
			String a = c[0];
			c[0] = c[2];
			c[2] = a;
			String b = c[0].concat(c[1].concat(c[2]));
			System.out.println(x.concat(b));
		}
	}
}
