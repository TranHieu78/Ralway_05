package com.vti.backend;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Utils.ScannerUtils;

public class DepartmentDao {
	public void getDepartment() throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3306/Testing_System?autoReconnect=true&useSSL=false&characterEncoding=latin1";
		String username = "root";
		String password = "root";

		// register the driver class with DriverManager
		Class.forName("com.mysql.cj.jdbc.Driver");

		// Step 2: get a Database Connection
		Connection connection = DriverManager.getConnection(url, username, password);

		String sql = "SELECT * FROM testing_system.department";

		Statement statement = connection.createStatement();

		ResultSet resultSet = statement.executeQuery(sql);

		while (resultSet.next()) {
			System.out.println(resultSet.getInt("DepartmentID"));
			System.out.println(resultSet.getString("DepartmentName"));
		}
	}

	public void getDepartmentByID() throws Exception {

		String url = "jdbc:mysql://localhost:3306/Testing_System?autoReconnect=true&useSSL=false&characterEncoding=latin1";
		String username = "root";
		String password = "root";

		// register the driver class with DriverManager
		Class.forName("com.mysql.cj.jdbc.Driver");

		// Step 2: get a Database Connection
		Connection connection = DriverManager.getConnection(url, username, password);

		String sql = "SELECT * FROM department Where department.DepartmentID = ?";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		int x = ScannerUtils.inputPositiveInt("Hãy nhập 1 số", "Nhập ID muốn tìm: ");

		preparedStatement.setInt(1, x);

		ResultSet resultSet = preparedStatement.executeQuery();

		if (!resultSet.next()) {
			throw new Exception("Cannot find department which has id = " + x);
		}
		System.out.println(resultSet.getInt("DepartmentID"));
		System.out.println(resultSet.getString("DepartmentName"));

	}

	public boolean isDepartmentNameExists(String name) throws SQLException, ClassNotFoundException {
		String url = "jdbc:mysql://localhost:3306/Testing_System?autoReconnect=true&useSSL=false&characterEncoding=latin1";
		String username = "root";
		String password = "root";

		// register the driver class with DriverManager
		Class.forName("com.mysql.cj.jdbc.Driver");

		// Step 2: get a Database Connection
		Connection connection = DriverManager.getConnection(url, username, password);

		String sql = "SELECT * FROM department Where department.DepartmentName = ?";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setString(1, name);

		ResultSet resultSet = preparedStatement.executeQuery();

		if (resultSet.next()) {
			return true;
		}
		return false;

	}

	public void createDepartment(String name) throws Exception {
		String url = "jdbc:mysql://localhost:3306/Testing_System?autoReconnect=true&useSSL=false&characterEncoding=latin1";
		String username = "root";
		String password = "root";

		// register the driver class with DriverManager
		Class.forName("com.mysql.cj.jdbc.Driver");

		// Step 2: get a Database Connection
		Connection connection = DriverManager.getConnection(url, username, password);

		if (isDepartmentNameExists(name)) {
			throw new Exception("Department Name is Exists!");
		}

		String sql = "INSERT INTO department (departmentName)" + "VALUE  				  (		?		)";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		String x = ScannerUtils.inputString("Không được để trống", "Nhập tên department: ");

		preparedStatement.setString(1, x);

		int effectedRecordAmount = preparedStatement.executeUpdate();

		System.out.println("Đã tạo thành công " + effectedRecordAmount + " deparment");

	}

	public boolean isDepartmentIdExists(int x) throws SQLException, ClassNotFoundException {
		String url = "jdbc:mysql://localhost:3306/Testing_System?autoReconnect=true&useSSL=false&characterEncoding=latin1";
		String username = "root";
		String password = "root";

		// register the driver class with DriverManager
		Class.forName("com.mysql.cj.jdbc.Driver");

		// Step 2: get a Database Connection
		Connection connection = DriverManager.getConnection(url, username, password);

		String sql = "SELECT * FROM department Where department.DepartmentID = ?";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setInt(1, x);

		ResultSet resultSet = preparedStatement.executeQuery();

		if (resultSet.next()) {
			return true;
		}
		return false;

	}

	public void updateDepartmentName(int id, String newName) throws Exception {
		String url = "jdbc:mysql://localhost:3306/Testing_System?autoReconnect=true&useSSL=false&characterEncoding=latin1";
		String username = "root";
		String password = "root";

		// register the driver class with DriverManager
		Class.forName("com.mysql.cj.jdbc.Driver");

		// Step 2: get a Database Connection
		Connection connection = DriverManager.getConnection(url, username, password);

		if (!isDepartmentIdExists(id)) {
			throw new Exception("Cannot find department which has id = " + id);
		}

		String sql = "UPDATE department Set DepartmentName = ? " + " WHERE DepartmentID = ? ";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setString(1, newName);
		preparedStatement.setInt(2, id);

		int effectedRecordAmount = preparedStatement.executeUpdate();

		System.out.println("Đã sửa thành công " + effectedRecordAmount + " deparment");

	}

	public void deleteDepartment(int id) throws Exception {
		String url = "jdbc:mysql://localhost:3306/Testing_System?autoReconnect=true&useSSL=false&characterEncoding=latin1";
		String username = "root";
		String password = "root";

		// register the driver class with DriverManager
		Class.forName("com.mysql.cj.jdbc.Driver");

		// Step 2: get a Database Connection
		Connection connection = DriverManager.getConnection(url, username, password);

		if (!isDepartmentIdExists(id)) {
			throw new Exception("Cannot find department which has id = " + id);
		}

		String sql = "DELETE FROM department" + " WHERE DepartmentID = ? ";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setInt(1, id);

		int effectedRecordAmount = preparedStatement.executeUpdate();

		System.out.println("Đã xóa thành công " + effectedRecordAmount + " deparment");
	}

	public void getAccount() throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3306/Testing_System?autoReconnect=true&useSSL=false&characterEncoding=latin1";
		String username = "root";
		String password = "root";

		// register the driver class with DriverManager
		Class.forName("com.mysql.cj.jdbc.Driver");

		// Step 2: get a Database Connection
		Connection connection = DriverManager.getConnection(url, username, password);

		String sql = "SELECT * \r\n" + "FROM `account`\r\n"
				+ "JOIN department ON `account`.DepartmentID = department.DepartmentID \r\n"
				+ "JOIN `position` ON `position`.PositionID = `account`.PositionID;";

		Statement statement = connection.createStatement();

		ResultSet resultSet = statement.executeQuery(sql);

		while (resultSet.next()) {
			System.out.println("ID: " + resultSet.getInt("AccountID"));
			System.out.println("Email: " + resultSet.getString("Email"));
			System.out.println("Username: " + resultSet.getString("Username"));
			System.out.println("Fullname: " + resultSet.getString("Fullname"));
			System.out.println("DepartmentName: " + resultSet.getString("DepartmentName"));
			System.out.println("PositionName: " + resultSet.getString("PositionName"));
			System.out.println("CreateDate: " + resultSet.getDate("CreateDate"));
			System.out.println();
		}
	}

}
