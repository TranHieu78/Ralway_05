package com.vti.backend.datalayer;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.vti.emtity.Candidate;
import com.vti.emtity.ExperienceCandidate;
import com.vti.emtity.FresherCandidate;
import com.vti.untils.JDBCUntils;

public class CandidateRopostory implements ICandidateRopostory {
	private JDBCUntils jdbcUtils;

	public void jdbcConnec() throws IOException {
		jdbcUtils = new JDBCUntils();
	}

	public ExperienceCandidate registerExperienceCandidate(String firstName, String lastName, String phone,
			String email, String passWord, int expInYear, String proSkill)
			throws FileNotFoundException, ClassNotFoundException, IOException, SQLException {
		String url = "jdbc:mysql://localhost:3306/Final_Exam?autoReconnect=true&useSSL=false&characterEncoding=latin1";
		String username = "root";
		String password = "root";

		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection connection = DriverManager.getConnection(url, username, password);

		String sql = "INSERT INTO experiencecandidate (FirstName,		LastName,		Phone,		Email,	 passWord,	ExpInYear,		ProSkill)\r\n"
				+ "VALUES						  (		?				?				?			?			?			?			?	)";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setString(1, firstName);
		preparedStatement.setString(2, lastName);
		preparedStatement.setString(3, phone);
		preparedStatement.setString(4, email);
		preparedStatement.setString(5, passWord);
		preparedStatement.setInt(6, expInYear);
		preparedStatement.setString(7, proSkill);
		return ExperienceCandidate(firstName, lastName, phone, email, passWord, expInYear, proSkill);

	}

	private ExperienceCandidate ExperienceCandidate(String firstName, String lastName, String phone, String email,
			String passWord, int expInYear, String proSkill) {
		// TODO Auto-generated method stub
		return null;
	}

	public FresherCandidate registerFresherCandidate(String firstName, String lastName, String phone, String email,
			String passWord, String graduationRank)
			throws FileNotFoundException, ClassNotFoundException, IOException, SQLException {
		String url = "jdbc:mysql://localhost:3306/Final_Exam?autoReconnect=true&useSSL=false&characterEncoding=latin1";
		String username = "root";
		String password = "root";

		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection connection = DriverManager.getConnection(url, username, password);

		String sql = "INSERT INTO fresherCandidate (FirstName,		LastName,		Phone,		Email,		GraduationRank)\r\n"
				+ "VALUES						  (		?				?				?			?			?			)";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setString(1, firstName);
		preparedStatement.setString(2, lastName);
		preparedStatement.setString(3, phone);
		preparedStatement.setString(4, email);
		preparedStatement.setString(5, graduationRank);
		return FresherCandidate(firstName, lastName, phone, email, passWord, graduationRank);
	}

	private FresherCandidate FresherCandidate(String firstName, String lastName, String phone, String email,
			String passWord, String graduationRank) {
		// TODO Auto-generated method stub
		return null;
	}

	public Candidate login(String email, String password1) throws Exception {
		// step 2: get connect
		String url = "jdbc:mysql://localhost:3306/Final_Exam?autoReconnect=true&useSSL=false&characterEncoding=latin1";
		String username = "root";
		String password = "root";


		Class.forName("com.mysql.cj.jdbc.Driver");


		Connection connection = DriverManager.getConnection(url, username, password);

		try {

			// Step 3: Create a statement object

			String sql = "SELECT * FROM final_exam.experiencecandidate\r\n"
					+ "JOIN FresherCandidate ON experiencecandidate.Email = FresherCandidate.Email;";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			// set parameter
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password1);

			// Step 4: Execute Query

			ResultSet resultSet = preparedStatement.executeQuery();

			// Step 5: Handling result
			if (resultSet.next()) {
				String firstName = resultSet.getString("Candidate");
				String lastName = resultSet.getString("lastName");
				String phone = resultSet.getString("phone");

				Candidate user = new Candidate(firstName, lastName, phone, email, password1);
				return user;
			} else {
				throw new Exception("Tai khoan hoac mat khau sai!");
			}

		} finally {
			connection.close();
		}
	}

}
