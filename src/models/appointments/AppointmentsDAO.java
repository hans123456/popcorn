package models.appointments;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.List;

import enums.user_registration_enum;
import models.ConnectionFactory;
import models.DAO;
import models.doctor.Doctor;
import models.user.User;
import tables.Appointments_Table;
import tables.Doctors_Table;
import tables.Times_Table;
import tables.Users_Table;
import utilities.DateParser;

public class AppointmentsDAO extends DAO{
	
	// for cancelling appointments user
	public List<Appointment> getUserAppointmentForDoctor(String date, int uid, int did){
		
		List<Appointment> appointments = new ArrayList<Appointment>();
		Appointment appointment = null;
		
		Appointments_Table a = new Appointments_Table();
		Users_Table u = new Users_Table();
		Doctors_Table d = new Doctors_Table();
		Times_Table t = new Times_Table();
		
		String query = "SELECT * from " + a.TABLE_NAME + " WHERE " + a.DATE + " > NOW() and " + a.DOCTOR_ID + "=" + did + " and " + a.USER_ID + "=" + uid + " and " +
						a.DATE + " = '" + date + "'";
		
		try {
			
			connection = getConnection();
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				appointment = new Appointment(rs.getInt(1), rs.getInt(5), rs.getInt(4), rs.getString(2), rs.getInt(3));
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
	
	// for user profile
	public List<Appointment> getUserAppointments(int uid){
		
		List<Appointment> appointments = new ArrayList<Appointment>();
		Appointment appointment = null;
		
		Appointments_Table a = new Appointments_Table();
		Users_Table u = new Users_Table();
		Doctors_Table d = new Doctors_Table();
		Times_Table t = new Times_Table();
		
		String query2 = "";
		
		String query = "SELECT " + a.ID + ", "+ 
						"DATE_FORMAT(" + a.DATE + ", '%d %M, %Y') as `date`, DATE_FORMAT("+ t.TIME + ",'%I%p') as `time`" + ", " + a.DOCTOR_ID + " FROM " + 
						a.TABLE_NAME + "," + u.TABLE_NAME + "," + d.TABLE_NAME + "," + t.TABLE_NAME +
						" WHERE " + d.USER_ID + "=" + a.DOCTOR_ID + " and " + a.USER_ID + "=" + u.ID + " and " + t.ID + "=" + a.TIME_ID + " and " + 
						a.DATE + " >= NOW() and " + u.ID + "=" + uid;
		
		Statement stmt2 = null;
		
		try {
			
			connection = getConnection();
			stmt = connection.createStatement();
			stmt2 = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			ResultSet rs2 = null;
			
			while(rs.next()) {
				
				int id = rs.getInt(1);
				String date = rs.getString(2);
				String time = rs.getString(3);
				int doctor_id = rs.getInt(4);
				String doctor_name = "";
				
				query2 = "SELECT CONCAT(" + u.FIRSTNAME + ",' '," + u.LASTNAME + ") as `name` " + " FROM " + 
						u.TABLE_NAME + "," + d.TABLE_NAME +
						" WHERE " + d.USER_ID + "=" + u.ID + " and " + u.ID + " = " + doctor_id;
				
				rs2 = stmt2.executeQuery(query2);
				
				if(rs2.next()){
				doctor_name = rs2.getString(1);
				}
				rs2.close();
				
				appointment = new Appointment(id, doctor_id, doctor_name, doctor_name, date, time);
				appointments.add(appointment);
				
			}
			
			rs.close();
			
			
			rs = stmt.executeQuery("SELECT FOUND_ROWS()");
			   
			if(rs.next())
				this.noOfRecords = rs.getInt(1);
			
			rs.close();
			
		} catch (SQLException e) {
		   e.printStackTrace();
		} catch (ClassNotFoundException e) {
		   e.printStackTrace();
		}finally {
			try {
				if(stmt != null)
					stmt.close();
				if(stmt2 != null)
					stmt2.close();
				if(connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return appointments;
		
	}
	
	// add appointment
	public static synchronized boolean addAppointment(String date, int time, int uid, int did){
		
		Appointments_Table a = new Appointments_Table();
		String query = "INSERT INTO " + a.TABLE_NAME + " (" + a.DATE + "," + a.TIME_ID + 
						"," + a.USER_ID + "," + a.DOCTOR_ID + ") VALUE (";		
		
		if(date==null)
			query += "NOW()";
		else if(date.equals(""))
			query += "NOW()";
		else 
			query += "'" + DateParser.parseDateForDatabase(date) + "'";
		
		query += "," + time + "," + uid + "," + did + ")";
		
		boolean result = false;
		
		Connection connection = null;
		Statement stmt = null;
		
		try {
			connection = ConnectionFactory.getInstance().getConnection();
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
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
	
	public boolean isAppointee(int uid, int did) {
		
		boolean result = false;
		
		Appointments_Table a = new Appointments_Table();
		
		String query = "SELECT * FROM " + a.TABLE_NAME + " WHERE " + a.DOCTOR_ID + "=" + did + " and " + a.USER_ID + "=" + uid + " LIMIT 1";
		
		try {
			
			connection = getConnection();
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				result = true;
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
		
		return result;
		
	}
	
public boolean deleteAppointment(int id){
		
		boolean result = true;
		Appointments_Table a = new Appointments_Table();
		
		//assume everyone has unique email...
		String query = "DELETE FROM " + a.TABLE_NAME + " WHERE " + a.ID + " = " + id;
		
		try {
			connection = getConnection();
			stmt = connection.createStatement();
			
			System.out.println(query);
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
