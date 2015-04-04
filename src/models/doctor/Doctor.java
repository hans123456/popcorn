package models.doctor;

import java.util.HashMap;
import java.util.Map;

public class Doctor {

	private int id;
	private Map<String ,String> info;
	
	public Doctor(int id){
		this.id = id;
		this.info = new HashMap<String, String>();
	}
	
	public int getId(){
		return id;
	}
	
	public void setInformation(String key, String value){
		info.put(key, value);
	}
	
	public String getInformation(String key){
		return info.get(key);
	}
	
}
