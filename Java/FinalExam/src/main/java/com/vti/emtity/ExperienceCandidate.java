package com.vti.emtity;

public class ExperienceCandidate extends Candidate {

	private int expInYear;
	private String proSkill;

	public ExperienceCandidate(String firstName, String lastName, String phone, String email,String passWord, int expInYear,
			String proSkill) {
		super(firstName, lastName, phone, email, passWord);
		this.expInYear = expInYear;
		this.proSkill = proSkill;
	}

	public int getExpInYear() {
		return expInYear;
	}

	public String getProSkill() {
		return proSkill;
	}

	@Override
	public void candidateInfo() {
		super.candidateInfo();
		System.out.println("expInYear: " + expInYear);
		System.out.println("proSkill: " + proSkill);
	}

}
