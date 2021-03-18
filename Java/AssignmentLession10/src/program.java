import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class program {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3306/TestingSystem?autoReconnect=true&useSSL=false&characterEncoding=latin1";
		String username = "root";
		String password = "root";

		// register the driver class with DriverManager
		Class.forName("com.mysql.cj.jdbc.Driver");

		// Step 2: get a Database Connection
		Connection connection = DriverManager.getConnection(url, username, password);

		String sql = "SELECT id, username, email FROM testingsystem.user";

		Statement statement = connection.createStatement();

		ResultSet resultSet = statement.executeQuery(sql);

		while (resultSet.next()) {
			System.out.println(resultSet.getInt("id"));
			System.out.println(resultSet.getString("username"));
			System.out.println(resultSet.getString("email"));

		}
		
	}
	
	public void update() throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3306/TestingSystem?autoReconnect=true&useSSL=false&characterEncoding=latin1";
		String username = "root";
		String password = "root";

		// register the driver class with DriverManager
		Class.forName("com.mysql.cj.jdbc.Driver");

		// Step 2: get a Database Connection
		Connection connection = DriverManager.getConnection(url, username, password);
		
		Statement statement = connection.createStatement();
		
		String sql = "INSERT INTO `Group` (`name` ,			`author_ID`, 		create_time)"
				+ 		"VALUE			('Java Fresher',			4, 			'2020-03-03')";
		
		int effectedRecordAmount = statement.executeUpdate(sql);
		
		System.out.println("Effected Record Amount" + effectedRecordAmount);
	} 

}
