import java.util.Date;
import java.util.Iterator;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Locale;
import java.util.Random;
import java.util.Scanner;

public class Program {
	@SuppressWarnings("deprecation")
	public static void main(String[] args) {
		Account accounts = new Account("lvb");
		String[] username = {"saf", "sadasf", "sdsffffae"};
		Group group = new Group("group1", accounts,LocalDate.now(), username);
		System.out.println(group);
	}
}
	
	
	

