package models.hospital;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.DAO;
import Tables.Hospitals_Table;

public class HospitalsDAO extends DAO{

	public List<Hospital> getHospitals(){
		
		List<Hospital> list = new ArrayList<Hospital>();
		Hospital hospital = null;
		
		Hospitals_Table h = new Hospitals_Table();
		
		String query = "SELECT " + h.ID + ", " + h.NAME + " FROM " + h.TABLE_NAME + " order by " + h.NAME + " asc";
		
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
