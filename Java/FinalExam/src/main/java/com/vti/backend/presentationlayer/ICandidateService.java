package com.vti.backend.presentationlayer;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

import com.vti.emtity.Candidate;
import com.vti.emtity.ExperienceCandidate;
import com.vti.emtity.FresherCandidate;

public interface ICandidateService {
	Candidate login(String email, String password) throws Exception;
	
	 ExperienceCandidate registerExperienceCandidate(String firstName, String lastName, String phone, String email,String passWord,
				int expInYear, String proSkill)
				throws FileNotFoundException, ClassNotFoundException, IOException, SQLException;

		FresherCandidate registerFresherCandidate(String firstName, String lastName, String phone, String email,
				String passWord,
					String graduationRank) throws FileNotFoundException, ClassNotFoundException, IOException, SQLException;
}
