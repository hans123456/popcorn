package models.user;

import java.util.HashMap;
import java.util.Map;

public class User {

	private int id;
	//private String name;
	private Map<String, String> info;
	private boolean isDoctor;
	private int doctorId;
	
	public User(){
		super();
		this.info = new HashMap<String, String>();
	}
	
	public User(int id) {
		super();
		this.id = id;
		this.info = new HashMap<String, String>();
	}

	public boolean isDoctor() {
		return isDoctor;
	}

	public void setDoctor(int doctorId, boolean isDoctor) {
		this.doctorId = doctorId;
		this.isDoctor = isDoctor;
	}

	public int getDoctorId(){
		return doctorId;
	}
	
	public int getId() {
		return id;
	}
	
	public void setInformation(String key, String value){
		info.put(key, value);
	}
	
	public String getInformation(String key){
		return info.get(key);
	}

}
