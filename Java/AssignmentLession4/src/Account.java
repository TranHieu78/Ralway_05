import java.time.LocalDate;
import java.util.Date;

public class Account {
	int id;
	String email;
	String username;
	String fullname;
	Deparment deparment;
	Position position;
	LocalDate createDate;
	Group[] groups;

// a,
//	Account() {
//	}

// b,
	Account(int id, String email, String username, String FirstName, String LastName) {
		this.id = id;
		this.email = email;
		this.username = username;
		this.fullname = FirstName + LastName;
	}

// c,
	Account(int id, String email, String username, String FirstName, String LastName, Position position) {
		this.id = id;
		this.email = email;
		this.username = username;
		this.fullname = FirstName + LastName;
		this.position = position;
		this.createDate = LocalDate.now();
	}

// d,
	Account(int id, String email, String username, String FirstName, String LastName, LocalDate createDate,
			Position position) {
		this.id = id;
		this.email = email;
		this.username = username;
		this.fullname = FirstName + LastName;
		this.position = position;
		this.createDate = createDate;
	}
	
	Account(String username){
		this.username = username;
	}
}
