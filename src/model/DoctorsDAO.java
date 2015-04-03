package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class DoctorsDAO {

	private Connection connection;
    private Statement stmt;
    private int noOfRecords;
	
    private static Connection getConnection() throws SQLException, ClassNotFoundException {
        Connection con = ConnectionFactory.getInstance().getConnection();
        return con;
    }
    
    public Iterator<Doctor> listOfDoctors(int offset, int noOfRecords){
    	
    	String query = "select SQL_CALC_FOUND_ROWS * from employee limit " + offset + ", " + noOfRecords;
    	
		List<Doctor> list = new ArrayList<Doctor>();
		Doctor doctor = null;

		try {
    	   
			connection = getConnection();
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
			}
			
			rs.close();
            
			rs = stmt.executeQuery("SELECT FOUND_ROWS()");
           
			if(rs.next())
				this.noOfRecords = rs.getInt(1);
           
		} catch (SQLException e) {
           e.printStackTrace();
		} catch (ClassNotFoundException e) {
           e.printStackTrace();
		}finally {
			try {
				if(stmt != null)
					stmt.close();
				if(connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list.iterator();
    
    }
    
    public int getNoOfRecords() {
    	return noOfRecords;
    }
    
}
