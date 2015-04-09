package models.appointments;

import java.sql.ResultSet;
import java.sql.SQLException;

import tables.Appointments_Table;
import tables.Users_Table;
import models.DAO;

public class AppointmentsDAO extends DAO{
	
	public boolean getUserAppointmentForDoctor(String date, int uid, int did){
		
		boolean result = false;
		
		Appointments_Table a = new Appointments_Table();
		Users_Table u = new Users_Table();
		
		String query = "SELECT * FROM " + a.TABLE_NAME + "," + u.TABLE_NAME + 
						" WHERE " + a.DOCTOR_ID + "=" + did + " and " +
						u.ID + "=" + uid + " and " + 
						a.DATE + "='" + date + "'";
		
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
	
}
