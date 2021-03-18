package com.vti.frontend;
import java.util.Scanner;

public class Ex1Qu3 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int[] numbers = new int[4];

		System.out.println("nhập 4 số nguyên: ");
		for (int i = 0; i < 4; i++) {
			numbers[i] = scanner.nextInt();
		}

		int maxValue = getMaxValue(numbers);
		int minValue = getMinValue(numbers);

		System.out.println("Max Value: " + maxValue);
		System.out.println("Min Value: " + minValue);
		
		scanner.close();
	}

	public static int getMaxValue(int[] numbers) {
		int maxValue = numbers[0];
		for (int i = 0; i < numbers.length; i++) {
			if (numbers[i] > maxValue) {
				maxValue = numbers[i];
			}
		}
		return maxValue;
	}

	public static int getMinValue(int[] numbers) {
		int minValue = numbers[0];
		for (int i = 0; i < numbers.length; i++) {
			if (numbers[i] < minValue) {
				minValue = numbers[i];
			}
		}
		return minValue;
	}
}
