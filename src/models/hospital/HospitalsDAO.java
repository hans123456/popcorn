package models.hospital;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.DAO;

public class HospitalsDAO extends DAO{

	public List<Hospital> getHospitals(){
		
		List<Hospital> list = new ArrayList<Hospital>();
		Hospital hospital = null;
		
		String query = "SELECT id, name FROM hospitals";
		
		try {
			
			connection = getConnection();
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while (rs.next()) {
				hospital = new Hospital(rs.getInt(1), rs.getString(2));
				list.add(hospital);
			}
			
			rs.close();
			
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
		
		return list;
		
	}
	
}
