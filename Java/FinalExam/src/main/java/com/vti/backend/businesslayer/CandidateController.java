package com.vti.backend.businesslayer;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

import com.vti.backend.presentationlayer.CandidateService;
import com.vti.backend.presentationlayer.ICandidateService;
import com.vti.emtity.Candidate;
import com.vti.emtity.ExperienceCandidate;
import com.vti.emtity.FresherCandidate;

public class CandidateController {
	private ICandidateService candidateService;

	public CandidateController() throws FileNotFoundException, ClassNotFoundException, IOException, SQLException {
		candidateService = new CandidateService();
	}

	public Candidate login(String email, String password) throws Exception {
		return candidateService.login(email, password);
	}

	public ExperienceCandidate registerExperienceCandidate(String firstName, String lastName, String phone,
			String email, String passWord, int expInYear, String proSkill)
			throws FileNotFoundException, ClassNotFoundException, IOException, SQLException {
		return candidateService.registerExperienceCandidate(firstName, lastName, phone, email, passWord, expInYear,
				proSkill);
	}

	public FresherCandidate registerFresherCandidate(String firstName, String lastName, String phone, String email,
			String passWord, String graduationRank)
			throws FileNotFoundException, ClassNotFoundException, IOException, SQLException {
		return candidateService.registerFresherCandidate(firstName, lastName, phone, email, passWord, graduationRank);
	}
}
