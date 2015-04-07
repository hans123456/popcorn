package models.doctor;

import java.sql.ResultSet;
import java.sql.SQLException;

import tables.Cities_Table;
import tables.Doctors_Table;
import tables.Hospitals_Table;
import tables.Specializations_Table;
import tables.Users_Table;
import enums.doctor_info_enum;
import models.DAO;

public class DoctorInfoDAO extends DAO{

	public Doctor getDoctorInfo(int id){
		
		Doctor doctor = null;
		
		Users_Table u = new Users_Table();
		Doctors_Table d = new Doctors_Table();
		Hospitals_Table h = new Hospitals_Table();
		Cities_Table c = new Cities_Table();
		Specializations_Table s = new Specializations_Table();
		
		String query = "select " + d.ID + ", CONCAT(" + u.FIRSTNAME + ", ' ', " + u.LASTNAME + ") as `name`, " + 
						c.NAME + ", " + h.NAME + ", " + s.NAME	+ " from " + d.TABLE_NAME + ", " + c.TABLE_NAME + 
						", " + h.TABLE_NAME + ", " + s.TABLE_NAME + ", " + u.TABLE_NAME + " where " + 
						d.CITY_ID + " = " + c.ID + " and " + d.HOSPITAL_ID + " = " + h.ID + " and " + 
						d.SPECIALIZATION_ID + " = " + s.ID + " and " + d.USER_ID + " = " + u.ID + " and " + d.ID + " = " + id;
		
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
