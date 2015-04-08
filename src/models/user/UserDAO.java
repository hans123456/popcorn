package models.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import enums.user_info_enum;
import enums.user_registration_enum;
import models.DAO;
import sun.misc.UUDecoder;
import tables.Doctors_Table;
import tables.Users_Table;

public class UserDAO extends DAO{

	public User login(String email, String password){
		
		User user = new User();
		
		Users_Table u = new Users_Table();
		Doctors_Table d = new Doctors_Table();
		
		String query1 = "SELECT " + u.ID + ", CONCAT(" + u.FIRSTNAME + ", ' ', " + u.LASTNAME + ")` " + 
						"FROM " + u.TABLE_NAME + " where lower(" + u.EMAIL + ") = lower('" + email + "') " +
						"and " + u.PASSWORD + " = SHA2('" + password + "', 512)";
		
		String query2 = "SELECT " + d.ID + " FROM " + d.TABLE_NAME + " WHERE " + d.USER_ID + " = " + u.ID;
		
		try {
			
			connection = getConnection();
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query1);
			
			if(rs.next()){
				user = new User(rs.getInt(1));
				user.setInformation(user_info_enum.NAME.getKey(), rs.getString(2));
			}
			
			rs.close();
			
			rs = stmt.executeQuery(query2);
			
			if(rs.next()){
				user.setDoctor(rs.getInt(1), true);
			}else{
				user.setDoctor(0, false);
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
		
		return user;
		
	}
	
	public boolean registerUser(User user){
		
		boolean result = true;
		Users_Table u = new Users_Table();
		String query = "INSERT INTO " + u.TABLE_NAME + " ( " + u.FIRSTNAME + ", " +
						u.LASTNAME + ", " + u.GENDER + ", " + u.BIRTHDATE + ", " + u.CONTACTNUMBER +
						", " + u.EMAIL + ", " + u.PASSWORD + " ) values ('" +
						user.getInformation(user_registration_enum.FIRSTNAME.getKey()) + "', '" +
						user.getInformation(user_registration_enum.LASTNAME.getKey()) + "', '" +
						user.getInformation(user_registration_enum.GENDER.getKey()) + "', '" +
						user.getInformation(user_registration_enum.BIRTHDATE.getKey()) + "', '" +
						user.getInformation(user_registration_enum.CONTACTNUMBER.getKey()) + "', '" +
						user.getInformation(user_registration_enum.EMAIL.getKey()) + "', sha2('" +
						user.getInformation(user_registration_enum.PASSWORD.getKey()) + "', 512))";
		
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
	
}
