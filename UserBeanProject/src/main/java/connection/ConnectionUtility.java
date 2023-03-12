package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtility {
	private static Connection con;
	static {
		try {
			 String dbDriver = "org.postgresql.Driver";
			 String dbUrl = "jdbc:postgresql://localhost:5432/";
			 String dbName = "todo";
			 String dbUserName = "postgres";
			 String dbPassword = "mohan";
			 
			 Class.forName(dbDriver);
			 con=DriverManager.getConnection(dbUrl+dbName, dbUserName, dbPassword);
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static Connection initializeDatabase() {
		return con;
	}
	
}
