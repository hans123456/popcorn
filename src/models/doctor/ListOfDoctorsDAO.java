package models.doctor;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import tables.Cities_Table;
import tables.Doctors_Table;
import tables.Specializations_Table;
import tables.Users_Table;
import models.DAO;
import enums.doctor_info_short_enum;

public class ListOfDoctorsDAO extends DAO{
	
	private int noOfRecords;
	
	public List<Doctor> listOfDoctors(int offset, int noOfRecords, Map<String, String[]> constraints){

//		select CONCAT(u.first_name, " ", u.last_name) as `name`, c.name, s.name from doctors d, cities c, specializations s, 
//		users u where d.city_id = c.id and d.specialization_id = s.id and d.user_id = u.id limit 0, 10

		Doctors_Table d = new Doctors_Table();
		Users_Table u = new Users_Table();
		Cities_Table c = new Cities_Table();
		Specializations_Table s = new Specializations_Table();
		
		String query = "";
		
		query += "SELECT * FROM (SELECT " + d.ID + " as `id`, CONCAT(" + u.FIRSTNAME + ", ' ', " + u.LASTNAME + ") as `whole`, " + 
				 c.NAME + " as `city`, " + s.NAME + " as `specialization` ";
		
		query += " FROM " + d.TABLE_NAME + ", " + c.TABLE_NAME + ", " + s.TABLE_NAME + 
				 ", " + u.TABLE_NAME + " where " + d.CITY_ID + " = " + c.ID + " and " + 
				 d.SPECIALIZATION_ID + " = " + s.ID	+ " and " + d.USER_ID + " = " + u.ID;

		if(constraints.get("specialization")!=null)
			if(constraints.get("specialization")[0].equals("0")==false)
				query += " and " + d.SPECIALIZATION_ID + " = " + constraints.get("specialization")[0];
			
		if(constraints.get("city")!=null)
			if(constraints.get("city")[0].equals("0")==false)
				query += " and " + d.CITY_ID + " = " + constraints.get("city")[0];
			
		if(constraints.get("hospital")!=null)
			if(constraints.get("hospital")[0].equals("0")==false)
			 query += " and " + d.HOSPITAL_ID + " = " + constraints.get("hospital")[0];
		
		query += ") as `table` ";
		
		if(constraints.get("search")!=null)
			if(constraints.get("search")[0].equals("0")==false)
				query += " WHERE `table`.whole like '%" + constraints.get("search")[0] + "%'";
			
		query += " limit " + offset + ", " + noOfRecords;
		
		System.out.println(query);
		
		List<Doctor> list = new ArrayList<Doctor>();
		Doctor doctor = null;

		try {
			
			connection = getConnection();
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while (rs.next()) {
				doctor = new Doctor(rs.getInt(1));
				for(doctor_info_short_enum i : doctor_info_short_enum.values()){
					doctor.setInformation(i.toString(), rs.getString(i.getColumnNo()));
				}
				list.add(doctor);
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
		
		return list;
	
	}
	
	public int getNoOfRecords() {
		return noOfRecords;
	}
	
}
