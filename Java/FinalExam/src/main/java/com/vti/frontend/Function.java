package com.vti.frontend;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

import com.vti.backend.businesslayer.CandidateController;
import com.vti.emtity.Candidate;
import com.vti.emtity.ExperienceCandidate;
import com.vti.untils.ScannerUtils;

public class Function {
	private CandidateController candidateController;

	public Function() throws FileNotFoundException, ClassNotFoundException, IOException, SQLException {
		candidateController = new CandidateController();
	}

	public void registerExperienceCandidate()
			throws FileNotFoundException, ClassNotFoundException, IOException, SQLException {
		String firstName = ScannerUtils.inputString("Không được để trống", "Mời nhập first name: ");
		String lastName = ScannerUtils.inputString("Không được để trống", "Mời nhập last name: ");
		String phone = ScannerUtils.inputPhone("Hãy nhập số!", "Mời nhập phone: ");
		String email = ScannerUtils.inputEmail1("Không được để trống", "Mời nhập email: ", firstName, lastName);
		String passWord = ScannerUtils.inputPassword("Không được để trống", "Mời nhập password: ");
		int expInYear = ScannerUtils.inputApproxInt1("Hãy nhập số!", "Mời nhập expInYear: ", 10);
		String proSkill = ScannerUtils.inputString("Không được để trống", "Mời nhập pro skill: ");

		candidateController.registerExperienceCandidate(firstName, lastName, phone, email, passWord, expInYear,
				proSkill);

		System.out.println("Đăng kí thành công");
	}

	public void registerFresherCandidate()
			throws FileNotFoundException, ClassNotFoundException, IOException, SQLException {
		String firstName = ScannerUtils.inputString("Không được để trống", "Mời nhập first name: ");
		String lastName = ScannerUtils.inputString("Không được để trống", "Mời nhập last name: ");
		String phone = ScannerUtils.inputPhone("Hãy nhập số!", "Mời nhập phone: ");
		String email = ScannerUtils.inputEmail1("Không được để trống", "Mời nhập email: ", firstName, lastName);
		String passWord = ScannerUtils.inputPassword("Không được để trống", "Mời nhập password: ");
		String graduationRank = ScannerUtils.inputGraduationRank("Không được để trống", "Mời nhập graduationRank: ");

		candidateController.registerFresherCandidate(firstName, lastName, phone, email, passWord, graduationRank);

		System.out.println("Đăng kí thành công");
	}

	public Candidate login() {
		while (true) {
			String email = ScannerUtils.inputemail("Email chưa đúng định dạng.",
					"Mời bạn nhập vào Email của account: ");

			String password = ScannerUtils.inputPassword(
					"Password phai dai tu 6--> 12 ki tu va co it nhat 1 chu viet hoa!", "Mời bạn nhập password: ");
			try {
				return candidateController.login(email, password);

			} catch (Exception e) {
				System.err.println(e.getMessage() + "\n");
			}
		}
	}

}
