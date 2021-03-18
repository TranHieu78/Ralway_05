package com.vti.emtity;

public class FresherCandidate extends Candidate {

	private String graduationRank;

	public FresherCandidate(String firstName, String lastName, String phone, String email, String passWord,
			String graduationRank) {
		super(firstName, lastName, phone, email, passWord);
		this.graduationRank = graduationRank;
	}

	public String getGraduationRank() {
		return graduationRank;
	}

	@Override
	public void candidateInfo() {
		super.candidateInfo();
		System.out.println("graduationRank: " + graduationRank);
	}

}
