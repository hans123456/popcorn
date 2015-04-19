package models.doctor;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.DAO;
import tables.Appointments_Table;
import tables.Available_times_Table;
import tables.Cancelled_appointments_Table;
import tables.Cities_Table;
import tables.Doctors_Table;
import tables.Hospitals_Table;
import tables.Specializations_Table;
import tables.Users_Table;
import enums.doctor_info_enum;

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
	
	public List<Time> getAvailableTimes(String date, int did){
		
		List<Time> times = new ArrayList<Time>();
		Time time = null;
		
		Available_times_Table av = new Available_times_Table();
		Appointments_Table ap = new Appointments_Table();
		Doctors_Table d = new Doctors_Table();
		Users_Table u = new Users_Table();
		Cancelled_appointments_Table c = new Cancelled_appointments_Table();
		
		String query = "SELECT " + av.TIME_ID + " as `time id`, '' as `name`, '' as `appointee id`" + 
						" FROM " + d.TABLE_NAME + "," + av.TABLE_NAME +
						" WHERE " + d.ID + "=" + av.DOCTOR_ID + " and " + d.ID + "=" + did + " and " + 
						av.DAY_ID + "= DAYOFWEEK(' " + date + "') and " +
						av.TIME_ID + " NOT IN (" + 
						"SELECT " + ap.TIME_ID + " FROM " + d.TABLE_NAME + "," + ap.TABLE_NAME + 
						" WHERE " + " NOT EXISTS ( " + " SELECT " + c.APPOINTMENT_ID + " from " + c.TABLE_NAME +
						" WHERE " + ap.ID + " = " + c.APPOINTMENT_ID + " ) " + " and " +
						d.ID + "=" + ap.DOCTOR_ID + " and " +
						ap.DATE + "='" + date + "' and " + 
						d.ID + "=" + did + ") " + 
						"UNION " + "SELECT " + ap.TIME_ID + " as `time id`, CONCAT( " + u.FIRSTNAME + ", ' ', " + u.LASTNAME +
						") as `name`, " + u.ID + " FROM " + d.TABLE_NAME + "," + ap.TABLE_NAME + "," + u.TABLE_NAME + 
						" WHERE " + " NOT EXISTS ( SELECT " + c.APPOINTMENT_ID + " from " + c.TABLE_NAME + " WHERE " + ap.ID + " = " + c.APPOINTMENT_ID + ") and " +
						 d.ID + "=" + ap.DOCTOR_ID + " and " + u.ID + "=" + ap.USER_ID + " and " + 
						ap.DATE + "='" + date + "' and " + d.ID + "=" + did;
		

		
		try {
			
			connection = getConnection();
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while (rs.next()) {
				time = new Time(rs.getInt(1), rs.getString(2), rs.getString(3));
				times.add(time);
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
		
		return times;
		
	}
	
}
