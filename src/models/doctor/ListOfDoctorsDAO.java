package models.doctor;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.DAO;
import enums.doctor_info_view_enum;

public class ListOfDoctorsDAO extends DAO{
	
	private int noOfRecords;

	public List<Doctor> listOfDoctors(int offset, int noOfRecords){

//		select CONCAT(u.first_name, " ", u.last_name) as `name`, c.name, s.name from doctors d, cities c, specializations s, 
//		users u where d.city_id = c.id and d.specialization_id = s.id and d.user_id = u.id limit 0, 10


		String query = "select d.id, CONCAT(u.first_name, ' ', u.last_name) as `name`, c.name, s.name"
						+ " from doctors d, cities c, specializations s, users u where d.city_id = c.id and d.specialization_id = s.id"
						+ " and d.user_id = u.id";

		query += " limit " + offset + ", " + noOfRecords;
		
		List<Doctor> list = new ArrayList<Doctor>();
		Doctor doctor = null;

		try {
			
			connection = getConnection();
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while (rs.next()) {
				doctor = new Doctor(rs.getInt(1));
				for(doctor_info_view_enum i : doctor_info_view_enum.values()){
					doctor.setInformation(i.toString(), rs.getString(i.getColumnNo()));
				}
				list.add(doctor);
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
		
		return list;
	
	}
	
	public int getNoOfRecords() {
		return noOfRecords;
	}
	
}
