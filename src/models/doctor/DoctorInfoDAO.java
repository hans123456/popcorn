package models.doctor;

import java.sql.ResultSet;
import java.sql.SQLException;

import enums.doctor_info_enum;
import models.DAO;

public class DoctorInfoDAO extends DAO{

	public Doctor getDoctorInfo(int id){
		
		Doctor doctor = null;
		
		String query = "select d.id, CONCAT(u.first_name, ' ', u.last_name) as `name`, c.name, h.name, s.name"
						+ " from doctors d, cities c, hospitals h, specializations s, users u where d.city_id = c.id and d.hospital_id = h.id "
						+ " and d.specialization_id = s.id and d.user_id = u.id and d.id=" + id;
		
		try {
			
			connection = getConnection();
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while (rs.next()) {
				doctor = new Doctor(rs.getInt(1));
				for(doctor_info_enum i : doctor_info_enum.values()){
					doctor.setInformation(i.toString(), rs.getString(i.getColumnNo()));
				}
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
		
		return doctor;
		
	}

}
