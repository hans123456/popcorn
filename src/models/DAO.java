package models;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public abstract class DAO {

	protected Connection connection;
	protected Statement stmt;
	
	protected static Connection getConnection() throws SQLException, ClassNotFoundException {
		Connection con = ConnectionFactory.getInstance().getConnection();
		return con;
	}
	
}
