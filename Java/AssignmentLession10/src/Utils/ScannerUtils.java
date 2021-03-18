package Utils;

import java.util.Scanner;

public class ScannerUtils {

	public static int inputPositiveInt(String errorMessage, String input) {

		while (true) {
			try {
				Scanner scanner = new Scanner(System.in);
				System.out.print(input);
				int x = scanner.nextInt();
				if (x > 0) {
					return x;
				} else {
					System.out.println("Wrong inputing! The number must be greater than 0, please input again.");
					continue;
				}
			} catch (Exception e) {
				System.out.println(errorMessage);
				continue;
			}
		}
	}
	
	public  static int inputNegativeInt(String errorMessage, String input) {

		while (true) {
			try {
				Scanner scanner = new Scanner(System.in);
				System.out.print(input);
				int x = scanner.nextInt();
				if (x < 0) {
					return x;
				} else {
					System.out.println("Wrong inputing! The number must be smaller than 0, please input again.");
					continue;
				}
			} catch (Exception e) {
				System.out.println(errorMessage);
				continue;
			}
		}
	}
	
	public static int inputInt(String errorMessage, String input) {

		while (true) {
			try {
				Scanner scanner = new Scanner(System.in);
				System.out.print(input);
				int x = scanner.nextInt();
				return x;
			} catch (Exception e) {
				System.out.println(errorMessage);
				continue;
			}
		}
	}
	
	public static int inputApproxInt(String errorMessage, String input, int a) {

		while (true) {
			try {
				Scanner scanner = new Scanner(System.in);
				System.out.print(input);
				int x = scanner.nextInt();
				if (x >= a) {
					return x;
				} else if (x < a && x > 0) {
					System.out.println("Wrong inputing! The number must be greater than " + a + ", please input again.");
					continue;
				}else	{
					System.out.println("Wrong inputing! The number must be greater than 0, please input again.");
					continue;
				}
			} catch (Exception e) {
				System.out.println(errorMessage);
				continue;
			}
		}
	}
	
	public static float inputFloat(String errorMessage, String input) {

		while (true) {
			try {
				Scanner scanner = new Scanner(System.in);
				System.out.print(input);
				float x = scanner.nextFloat();
				if (x >= 0) {
					return x;
				} else {
					System.out.println("Wrong inputing! The number must be greater than 0, please input again.");
					continue;
				}
			} catch (Exception e) {
				System.out.println(errorMessage);
				continue;
			}
		}
	}

	public static double inputDouble(String errorMessage, String input) {

		while (true) {
			try {
				Scanner scanner = new Scanner(System.in);
				System.out.print(input);
				double x = scanner.nextDouble();
				if (x >= 0) {
					return x;
				} else {
					System.out.println("Wrong inputing! The number must be greater than 0, please input again.");
					continue;
				}
			} catch (Exception e) {
				System.out.println(errorMessage);
				continue;
			}
		}
	}
	
	public static String inputString(String errorMessage, String input) {

		while (true) {
		
				Scanner scanner = new Scanner(System.in);
				System.out.print(input);
				String x = scanner.nextLine();
				if (!x.isEmpty()) {
					return x;
				} else {
					System.out.println(errorMessage);
					continue;
				}

			}
		}
	
}
