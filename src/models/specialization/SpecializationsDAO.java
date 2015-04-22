package models.specialization;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.DAO;

public class SpecializationsDAO extends DAO{

	public List<Specialization> getSpecializations(){
		
		List<Specialization> list = new ArrayList<Specialization>();
		Specialization specialization = null;
		
		String query = "SELECT id, name FROM specializations";
		
		try {
			
			connection = getConnection();
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while (rs.next()) {
				specialization = new Specialization(rs.getInt(1), rs.getString(2));
				list.add(specialization);
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
