package com.vti.emtity;

import java.time.LocalDate;
import java.util.Date;

public class Account {
	private int id;
	private String email;
	private String username;
	private String fullname;
	private Deparment deparment;
	private Position position;
	private LocalDate createDate;
	private Group[] groups;

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

	Account(String username) {
		this.username = username;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public String getUseName() {
		return username;
	}
	public void setUserName(String username) {
		this.username = username;
	}
	
	
	public  Group[] getGroups() {
		return groups;	
	}
	public void setGroups(Group[] groups) {
		this.groups = groups;
	}
	
	
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	
	
	
	public Deparment getDeparment() {
		return deparment;
	}
	public void setFullname(Deparment deparment) {
		this.deparment = deparment;
	}
	
	
	public Position getPosition() {
		return position;
	}
	public void setFullname(Position position) {
		this.position = position;
	}
	
	
	public LocalDate getCreateDate() {
		return createDate;
	}
	public void setCreateDate(LocalDate createDate) {
		this.createDate = createDate;
	}
	
	
}
