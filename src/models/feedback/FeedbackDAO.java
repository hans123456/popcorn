package models.feedback;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tables.Doctors_Table;
import tables.Feedbacks_Table;
import tables.Users_Table;
import models.DAO;
import models.doctor.Doctor;
import models.user.User;

public class FeedbackDAO extends DAO{
	
	public boolean addFeedback(User user, Doctor doctor, Feedback feedback){
		boolean result = true;
		Feedbacks_Table f = new Feedbacks_Table();
		Doctors_Table d = new Doctors_Table();
		Users_Table u = new Users_Table();
		
		String query = "INSERT INTO " + f.TABLE_NAME + " ( " + f.RATE + ", " + f.COMMENT + ", " +
						f.USER_ID + ", " + f.DOCTOR_ID + " ) VALUES ( " + feedback.getRate() + ", '" +
						feedback.getComment() + "', " + user.getId() + ", " + doctor.getId() + " )";
		
		try {
			connection = getConnection();
			stmt = connection.createStatement();
			stmt.execute(query);
			
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
	
	public List<Feedback> getFeedbacksofDoctor(Doctor doctor) {
		List<Feedback> feedbacks = null;
		
		Feedbacks_Table f = new Feedbacks_Table();
		Doctors_Table d = new Doctors_Table();
		
		String query = "SELECT " + f.RATE + ", " + f.COMMENT + " FROM " + f.TABLE_NAME +
						" WHERE " + f.DOCTOR_ID + " = " + doctor.getId();
		
		try {
			connection = getConnection();
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			feedbacks = new ArrayList();
			
			while(rs.next()){
				feedbacks.add(new Feedback(rs.getInt(1), rs.getString(2)));
			}
			
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
		
		return feedbacks;
	}

}
