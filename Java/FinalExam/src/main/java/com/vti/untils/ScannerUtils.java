package com.vti.untils;

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

	public static int inputNegativeInt(String errorMessage, String input) {

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
				if (x > 0 && x <= a) {
					return x;
				} else
					System.out.println("Không được nhập số âm");
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

	public static int inputApproxInt1(String errorMessage, String input, long a) {

		while (true) {
			try {
				Scanner scanner = new Scanner(System.in);
				System.out.print(input);
				int x = scanner.nextInt();
				if (x >= 0 && x <= a) {
					return x;
				} else
					System.out.println("Không được nhập số âm");
			} catch (Exception e) {
				System.out.println(errorMessage);
				continue;
			}
		}
	}

	@SuppressWarnings("resource")
	public static String inputEmail1(String errorMessage, String input, String firstName, String lastName) {

		while (true) {

			Scanner scanner = new Scanner(System.in);
			System.out.print(input);
			String x = scanner.nextLine();
			if (x.isEmpty()) {
				System.out.println(errorMessage);
			}
			String[] a = x.split("");
			String b = "@";
			String c = a[0];

			for (int i = a.length - 10; i < a.length; i++) {
				b = b.concat(a[i]);
			}
			if (!b.toLowerCase().equals(("@com.vti.vn"))) {
				System.out.println("Sai định dạng");
			}

			for (int i = 1; i < a.length - 11; i++) {
				c = c.concat(a[i]);
			}
			
			String j = c;

			String[] d = j.split("\\.");
			

			if (!d[0].toLowerCase().equals(lastName)) {
				System.out.println("Sai định dạng");
			}

			String[] e = firstName.split(" ");
			
			String f = e[0];
 
			for (int i = 1; i < e.length; i++) {
				f = f.concat(e[i]);
			}

			if (!d[1].toLowerCase().equals(f)) {
				System.out.println("Sai định dạng");
			}

			return x;
		}
	}

	public static String inputPhone(String errorMessage, String input) {

		while (true) {

			Scanner scanner = new Scanner(System.in);
			System.out.print(input);
			long x = scanner.nextLong();
			try {
				if (x < 0) {
					System.out.println("Không được nhập số âm");
				}
			} catch (Exception e) {
				System.out.println(errorMessage);
				continue;
			}

			String a = Long.toString(x);
			if (a.length() <= 11 && a.length() >= 8) {
				return a;
			} else {
				System.out.println("Nhập từ 9 đến 12 số");
			}

		}

	}

	public static String inputGraduationRank(String errorMessage, String input) {

		while (true) {

			Scanner scanner = new Scanner(System.in);
			System.out.print(input);
			String x = scanner.nextLine();
			if (x.isEmpty()) {
				System.out.println(errorMessage);
			} else if (!x.toLowerCase().equals("excellence")) {
				System.out.println("Nhập sai");
			} else if (!x.toLowerCase().equals("Good")) {
				System.out.println("Nhập sai");
			} else if (!x.toLowerCase().equals("Fair")) {
				System.out.println("Nhập sai");
			} else if (!x.toLowerCase().equals("Poor")) {
				System.out.println("Nhập sai");
			} else
				return x;

		}
	}

	public static String inputPassword(String errorMessage, String input) {
		while (true) {
			String password = ScannerUtils.inputString(errorMessage, input);
			if (password.length() < 6 || password.length() > 12) {
				System.err.println(errorMessage);
				System.out.print("Mời bạn nhập lại password: ");
				continue;
			}

			boolean hasAtLeast1Character = false;

			for (int i = 0; i < password.length(); i++) {
				if (Character.isUpperCase(password.charAt(i)) == true) {
					hasAtLeast1Character = true;
					break;
				}
			}
			if (hasAtLeast1Character == true) {
				return password;
			} else {
				System.err.println(errorMessage);
				System.out.print("Mời bạn nhập lại password: ");
			}
		}
	}

	public static String inputemail(String errorMessage, String input) {
		while (true) {
			String email = ScannerUtils.inputString(errorMessage, input);
			if (email == null || !email.contains("@gmail.com")) {
				System.err.println(errorMessage);
				System.out.print("Mời bạn nhập lại email: ");
			} else {
				return email;
			}
		}
	}
}
