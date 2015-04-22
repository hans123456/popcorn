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
import tables.Cancelled_appointments_Table;
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
	
	public List<Appointment> getAppointmentForDoctor(String date, int did){
		
		List<Appointment> appointments = new ArrayList<Appointment>();
		Appointment appointment = null;
		
		Appointments_Table a = new Appointments_Table();
		Users_Table u = new Users_Table();
		Doctors_Table d = new Doctors_Table();
		Times_Table t = new Times_Table();
		
		String query = "SELECT * from " + a.TABLE_NAME + " WHERE " + a.DATE + " > NOW() and " + a.DOCTOR_ID + "=" + did + " and " +
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
	
	private int appointmentNoOfRecords;
	
	// for user profile
	public List<Appointment> getUserAppointments(int offset, int noOfRecords, int uid){
		
		List<Appointment> appointments = new ArrayList<Appointment>();
		Appointment appointment = null;
		
		Appointments_Table a = new Appointments_Table();
		Users_Table u = new Users_Table();
		Doctors_Table d = new Doctors_Table();
		Times_Table t = new Times_Table();
		
		String query2 = "";
		
		String query = "SELECT SQL_CALC_FOUND_ROWS " + a.ID + ", "+ 
				"DATE_FORMAT(" + a.DATE + ", '%d %M, %Y') as `date`, DATE_FORMAT("+ t.TIME + ",'%I%p') as `time`" + ", " + a.DOCTOR_ID + " FROM " + 
				a.TABLE_NAME + "," + u.TABLE_NAME + "," + d.TABLE_NAME + "," + t.TABLE_NAME +
				" WHERE " + d.USER_ID + "=" + a.DOCTOR_ID + " and " + a.USER_ID + "=" + u.ID + " and " + t.ID + "=" + a.TIME_ID + " and " + 
				a.DATE + " >= NOW() and " + u.ID + "=" + uid;
		
		query += " limit " + offset + ", " + noOfRecords;
		
		System.out.println(query);
		
		Statement stmt2 = null;
		
		try {
			
			connection = getConnection();
			stmt = connection.createStatement();
			stmt2 = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			ResultSet rs2 = null;
			ResultSet rs3 = null;

			rs3 = stmt.executeQuery("SELECT FOUND_ROWS()");
			   
			if(rs3.next())
				this.appointmentNoOfRecords = rs3.getInt(1);
			
			rs3.close();
			
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				
				int id = rs.getInt(1);
				String date = rs.getString(2);
				String time = rs.getString(3);
				int doctor_id = rs.getInt(4);
				String doctor_name = "";
				
				query2 = "SELECT CONCAT(" + u.FIRSTNAME + ",' '," + u.LASTNAME + ") as `name` " + " FROM " + 
						u.TABLE_NAME + "," + d.TABLE_NAME +
						" WHERE " + d.USER_ID + "=" + u.ID + " and " + d.ID + " = " + doctor_id;
				
				query2 += " limit 1";
				
				System.out.println(query2);
				
				rs2 = stmt2.executeQuery(query2);
				
				if(rs2.next()){
					doctor_name = rs2.getString(1);
				}
				rs2.close();
				
				appointment = new Appointment(id, doctor_id, doctor_name, doctor_name, date, time);
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
	
	public int appointmentGetNoOfRecords() {
		return appointmentNoOfRecords;
	}
	
	private int cancelledAppointmentNoOfRecords;
	
	// for user profile
	public List<CancelledAppointment> getUserCancelledAppointments(int offset, int noOfRecords, int uid){
		
		List<CancelledAppointment> appointments = new ArrayList<CancelledAppointment>();
		CancelledAppointment appointment = null;
		
		Cancelled_appointments_Table c = new Cancelled_appointments_Table();
		Users_Table u = new Users_Table();
		Doctors_Table d = new Doctors_Table();
		Times_Table t = new Times_Table();
		
		String query2 = "";
		
		String query = "SELECT SQL_CALC_FOUND_ROWS " + c.ID + ", "+ 
				"DATE_FORMAT(" + c.DATE + ", '%d %M, %Y') as `date`, DATE_FORMAT("+ t.TIME + ",'%I%p') as `time`" + ", " + c.DOCTOR_ID + 
				 ", " + c.REASON  + " FROM " + 
				c.TABLE_NAME + "," + u.TABLE_NAME + "," + d.TABLE_NAME + "," + t.TABLE_NAME +
				" WHERE " + d.USER_ID + "=" + c.DOCTOR_ID + " and " + c.USER_ID + "=" + u.ID + " and " + t.ID + "=" + c.TIME_ID + " and " + 
				c.DATE + " >= NOW() and " + u.ID + "=" + uid;
		
		query += " limit " + offset + ", " + noOfRecords;
		
		System.out.println(query);
		
		Statement stmt2 = null;
		
		try {
			
			connection = getConnection();
			stmt = connection.createStatement();
			stmt2 = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			ResultSet rs2 = null;
			ResultSet rs3 = null;

			rs3 = stmt.executeQuery("SELECT FOUND_ROWS()");
			   
			if(rs3.next())
				this.cancelledAppointmentNoOfRecords = rs3.getInt(1);
			
			rs3.close();
			
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				
				int id = rs.getInt(1);
				String date = rs.getString(2);
				String time = rs.getString(3);
				int doctor_id = rs.getInt(4);
				String reason = rs.getString(5);
				String doctor_name = "";
				
				query2 = "SELECT CONCAT(" + u.FIRSTNAME + ",' '," + u.LASTNAME + ") as `name` " + " FROM " + 
						u.TABLE_NAME + "," + d.TABLE_NAME +
						" WHERE " + d.USER_ID + "=" + u.ID + " and " + d.ID + " = " + doctor_id;
				
				query2 += " limit 1";
				
				System.out.println(query2);
				
				rs2 = stmt2.executeQuery(query2);
				
				if(rs2.next()){
					doctor_name = rs2.getString(1);
				}
				rs2.close();
				
				appointment = new CancelledAppointment(id, doctor_id, doctor_name, doctor_name, date, time, reason);
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
	
	public int cancelledAppointmentGetNoOfRecords() {
		return cancelledAppointmentNoOfRecords;
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
	
	public boolean deleteAppointment(int id, String reason){
		
		boolean result = true;
		Appointments_Table a = new Appointments_Table();
		Cancelled_appointments_Table c = new Cancelled_appointments_Table();
		
		//assume everyone has unique email...
		
		
		String query = "SELECT * FROM " + a.TABLE_NAME + " WHERE " + a.ID + " = " + id;
		System.out.println(query);
		
		String query2 = "";
		
		String query3 = "DELETE FROM " + a.TABLE_NAME + " WHERE " + a.ID + " = " + id;
		
		CancelledAppointment capp = null;
		
		try {
			connection = getConnection();
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				capp = new CancelledAppointment(rs.getInt(5), rs.getInt(4), rs.getString(2), rs.getInt(3), reason);
			}
			
			rs.close();
			
			if(capp != null) {
			query2 = "INSERT INTO " + c.TABLE_NAME + " ( " + c.DATE + ", " + c.TIME_ID + ", " + c.USER_ID + ", " + c.DOCTOR_ID + ", " + c.REASON
					+ " ) values ( '" + capp.getDate() + "', " + capp.getTimeId() + ", " + capp.getUserId() + ", " + capp.getDoctorId() + ", '" + capp.getReason()
					+ "')";
			}
			
			stmt.execute(query2);
			
			stmt.executeUpdate(query3);
			
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
