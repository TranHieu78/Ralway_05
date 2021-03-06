import java.time.LocalDate;
import java.util.Date;
import java.util.Iterator;

public class Group {
	int id;
	String name;
	Account creator;
	LocalDate createDate;
	Account[] accounts;

// a,
//		Group(){
//		}

// b,
	Group(String name, Account creator, LocalDate createDate, Account[] accounts) {
		this.name = name;
		this.creator = creator;
		this.createDate = createDate;
		this.accounts = accounts;
	}

// c,
	Group(String name, Account creator, LocalDate createDate, String[] Username) {
		this.name = name;
		this.creator = creator;
		this.createDate = createDate;
		accounts = new Account[Username.length];
		for(int i=0; i<Username.length; i++) {
		Account account = new Account(Username[i]);
				accounts[i] = account;
		}
			
	}
	
@Override
public String toString() {
	String result = "";
	result += "Name: " + name + "\n";
	
	String accouStr = "";
	for (Account account : accounts) {
		accouStr += account.username + ", " ;
	}
	
	result += "Accounts: " + accouStr; 
	return result ;
}

}
