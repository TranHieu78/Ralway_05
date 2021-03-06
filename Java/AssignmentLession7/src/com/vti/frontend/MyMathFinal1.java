package com.vti.frontend;

public class MyMathFinal1 {
public static void main(String[] args) {
	final double PI = 3.14f;
	
	System.out.println(MyMathFinal1.sum(5, PI));
}

public static float sum(int a, double b) {
	return (float) (a+b);
}
}
