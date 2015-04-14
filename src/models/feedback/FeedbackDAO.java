package models.feedback;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tables.Feedbacks_Table;
import models.DAO;

public class FeedbackDAO extends DAO{
	
	public boolean addFeedback(int userId, int doctor_id, Feedback feedback){
		boolean result = true;
		Feedbacks_Table f = new Feedbacks_Table();
		
		String query = "INSERT INTO " + f.TABLE_NAME + " ( " + f.RATE + ", " + f.COMMENT + ", " +
						f.USER_ID + ", " + f.DOCTOR_ID + " ) VALUES ( " + feedback.getRate() + ", '" +
						feedback.getComment() + "', " + userId + ", " + doctor_id + " )";
		
		System.out.println(query);
		
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
	
	private int noOfRecords;
	
	public List<Feedback> getFeedbacksofDoctor(int doctor_id) {
		List<Feedback> feedbacks = null;
		
		Feedbacks_Table f = new Feedbacks_Table();
		
		String query = "SELECT " + f.RATE + ", " + f.COMMENT + " FROM " + f.TABLE_NAME +
						" WHERE " + f.DOCTOR_ID + " = " + doctor_id;
		
		System.out.println(query);
		
		try {
			connection = getConnection();
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			feedbacks = new ArrayList();
			
			while(rs.next()){
				feedbacks.add(new Feedback(rs.getInt(1), rs.getString(2)));
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
				if(connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return feedbacks;
	}
	
	
	public int getNoOfRecords() {
		return noOfRecords;
	}
	
}
