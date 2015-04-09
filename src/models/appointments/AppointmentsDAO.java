package models.appointments;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.DAO;
import tables.Appointments_Table;
import tables.Doctors_Table;
import tables.Times_Table;
import tables.Users_Table;

public class AppointmentsDAO extends DAO{
	
	public List<Appointment> getUserAppointmentForDoctor(String date, int uid, int did){
		
		List<Appointment> appointments = new ArrayList<Appointment>();
		Appointment appointment = null;
		
		Appointments_Table a = new Appointments_Table();
		Users_Table u = new Users_Table();
		Doctors_Table d = new Doctors_Table();
		Times_Table t = new Times_Table();
		
		String query = "SELECT " + a.ID + ", CONCAT(" + u.FIRSTNAME + ",' '," + u.LASTNAME + ") as `name`, " + 
						"DATE_FORMAT(" + a.DATE + ", '%d %M, %Y') as `date`, DATE_FORMAT("+ t.TIME + ",'%I%p') as `time` FROM " + 
						a.TABLE_NAME + "," + u.TABLE_NAME + "," + d.TABLE_NAME + "," + t.TABLE_NAME +
						" WHERE " + d.USER_ID + "=" + u.ID + " and " + t.ID + "=" + a.TIME_ID + " and " + 
						a.DATE + " > NOW() and " + a.DOCTOR_ID + "=" + did + " and " + u.ID + "=" + uid;
		
		System.out.println(query);
		
		try {
			
			connection = getConnection();
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				appointment = new Appointment(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
				appointments.add(appointment);
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
		
		return appointments;
		
	}
	
	private int noOfRecords;

	public List<Appointment> getUserAppointments(int uid){
		
		List<Appointment> appointments = new ArrayList<Appointment>();
		Appointment appointment = null;
		
		Appointments_Table a = new Appointments_Table();
		Users_Table u = new Users_Table();
		Doctors_Table d = new Doctors_Table();
		Times_Table t = new Times_Table();
		
		String query = "SELECT " + a.ID + ", CONCAT(" + u.FIRSTNAME + ",' '," + u.LASTNAME + ") as `name`, " + 
						"DATE_FORMAT(" + a.DATE + ", '%d %M, %Y') as `date`, DATE_FORMAT("+ t.TIME + ",'%I%p') as `time` FROM " + 
						a.TABLE_NAME + "," + u.TABLE_NAME + "," + d.TABLE_NAME + "," + t.TABLE_NAME +
						" WHERE " + d.USER_ID + "=" + u.ID + " and " + t.ID + "=" + a.TIME_ID + " and " + 
						a.DATE + " > NOW() and " + u.ID + "=" + uid;
		
		System.out.println(query);
		
		try {
			
			connection = getConnection();
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				appointment = new Appointment(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
				appointments.add(appointment);
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
		
		return appointments;
		
	}
	
	public boolean addAppointment(String date, int time, int uid, int did){
		
		Appointments_Table a = new Appointments_Table();
		String query = "";
		boolean result = false;
		
		try {
			
			connection = getConnection();
			stmt = connection.createStatement();
			stmt.execute(query);
			
			result = true;
			
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
		
		return result;
		
	}
	
	public int getNoOfRecords() {
		return noOfRecords;
	}
	
}
