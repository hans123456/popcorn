package models.doctor;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import models.DAO;
import models.user.User;
import tables.Available_times_Table;
import tables.Cities_Table;
import tables.Doctors_Table;
import tables.Hospitals_Table;
import tables.Specializations_Table;
import tables.Users_Table;
import enums.doctor_info_enum;
import enums.user_info_enum;
import enums.user_registration_enum;

public class DoctorApplyDAO extends DAO {
	public boolean registerDoctor(Doctor doctor, User user) {

		boolean result = true;
		Doctors_Table d = new Doctors_Table();
		Hospitals_Table h = new Hospitals_Table();
		Specializations_Table s = new Specializations_Table();
		Users_Table u = new Users_Table();
		Cities_Table c = new Cities_Table();

		int user_id = 0;

		String userQuery = "SELECT " + u.ID + " FROM " + u.TABLE_NAME
				+ " WHERE lower(" + u.EMAIL + ") = lower('"
				+ user.getInformation(user_registration_enum.EMAIL.getKey())
				+ "') ";

		try {
			connection = getConnection();
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(userQuery);

			if (rs.next()) {
				user_id = rs.getInt(1);
			}

			rs.close();

			String register = "INSERT INTO " + d.TABLE_NAME + " ( "
					+ d.HOSPITAL_ID + ", " + d.SPECIALIZATION_ID + ", "
					+ d.CITY_ID + ", " + d.USER_ID + " ) values ("
					+ Integer.parseInt(doctor.getInformation(doctor_info_enum.HOSPITAL.toString())) + ", " 
					+ Integer.parseInt(doctor.getInformation(doctor_info_enum.SPECIALIZATION.toString())) + ", "
					+ Integer.parseInt(doctor.getInformation(doctor_info_enum.CITY.toString()))
					+ ", " + user_id + " ) ";

			// System.out.println(register);

			stmt.execute(register);

		} catch (SQLException e) {
			e.printStackTrace();
			result = false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;

	}

	public boolean addSchedule(Doctor doctor, User user) {

		boolean result = true;
		Doctors_Table d = new Doctors_Table();
		Users_Table u = new Users_Table();
		Available_times_Table a = new Available_times_Table();
		
		int user_id = 0;
		String userQuery = "SELECT " + u.ID + " FROM " + u.TABLE_NAME
				+ " WHERE lower(" + u.EMAIL + ") = lower('"
				+ user.getInformation(user_registration_enum.EMAIL.getKey())
				+ "') ";
		
		int doctor_id = 0;
		
		String doctorQuery = "";
		String schedule = "";
		
		try {
			connection = getConnection();
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(userQuery);
			
			if (rs.next()) {
				user_id = rs.getInt(1);
			}
			
			rs.close();
			
			doctorQuery = "SELECT " + d.ID + " FROM " + d.TABLE_NAME + " WHERE " +  d.USER_ID + " = " + user_id;
			
			rs = stmt.executeQuery(doctorQuery);
			
			if (rs.next()) {
				doctor_id = rs.getInt(1);
			}
			
			rs.close();
			
			for(Map.Entry<String, List<String>> entry: doctor.getSchedule().entrySet()) {
				for(String time: entry.getValue()) {
				schedule = "INSERT INTO " + a.TABLE_NAME + " ( " + a.DAY_ID + ", " + a.DOCTOR_ID + ", " + a.TIME_ID +
							" ) values ( " + Integer.parseInt(entry.getKey())+ ", " + doctor_id + ", " + Integer.parseInt(time) + " )";
				
				stmt.execute(schedule);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
			result = false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;

	}
	
	public boolean deleteDoctor(Doctor doctor, User user){
		
		boolean result = true;
		Doctors_Table d = new Doctors_Table();
		Users_Table u = new Users_Table();
		
		int user_id = 0;
		String userQuery = "SELECT " + u.ID + " FROM " + u.TABLE_NAME
				+ " WHERE lower(" + u.EMAIL + ") = lower('"
				+ user.getInformation(user_registration_enum.EMAIL.getKey())
				+ "') ";
		
		int doctor_id = 0;
		
		String query = "";
		//assume everyone has unique email...
		//String query = "DELETE FROM " + u.TABLE_NAME + " WHERE lower(" + u.EMAIL + ") = lower('" + user.getInformation(user_registration_enum.EMAIL.getKey()) + "') ";
		
		try {
			connection = getConnection();
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(userQuery);
			
			if (rs.next()) {
				user_id = rs.getInt(1);
			}
			
			rs.close();
			
			query = "DELETE FROM " + d.TABLE_NAME + " WHERE " + d.ID  + " = " + doctor_id;
			
			stmt.executeUpdate(query);
			
		} catch (SQLException e) {
		   e.printStackTrace();
		   result = false;
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
		
		return result;
		
	}
}
