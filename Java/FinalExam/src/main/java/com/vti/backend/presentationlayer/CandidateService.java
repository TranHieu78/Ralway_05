package com.vti.backend.presentationlayer;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

import com.vti.backend.datalayer.CandidateRopostory;
import com.vti.backend.datalayer.ICandidateRopostory;
import com.vti.emtity.Candidate;
import com.vti.emtity.ExperienceCandidate;
import com.vti.emtity.FresherCandidate;

public class CandidateService implements ICandidateService {

	private ICandidateRopostory candidateRopostory;

	public CandidateService() throws FileNotFoundException, ClassNotFoundException, IOException, SQLException {
		candidateRopostory = new CandidateRopostory();
	}

	public Candidate login(String email, String password) throws Exception {
		return candidateRopostory.login(email, password);
	}

	public ExperienceCandidate registerExperienceCandidate(String firstName, String lastName, String phone,
			String email,String passWord, int expInYear, String proSkill)
			throws FileNotFoundException, ClassNotFoundException, IOException, SQLException {
		return candidateRopostory.registerExperienceCandidate(firstName, lastName, phone, email, passWord, expInYear, proSkill);
	}

	public FresherCandidate registerFresherCandidate(String firstName, String lastName, String phone, String email,String passWord,
			String graduationRank) throws FileNotFoundException, ClassNotFoundException, IOException, SQLException {
		return candidateRopostory.registerFresherCandidate(firstName, lastName, phone, email, passWord, graduationRank);
	}

}
