package models.doctor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Doctor {

	private int id;
	private Map<String,String> info;
	private Map<String, List<String>> schedule;
	
	public Doctor(int id){
		this.id = id;
		this.info = new HashMap<String, String>();
		this.schedule = new HashMap<String, List<String>>();
	}
	
	public Doctor(){
		this.id = 0;
		this.info = new HashMap<String, String>();
		this.schedule = new HashMap<String, List<String>>();
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
	
	public void setSchedule(String key, List<String> value){
		schedule.put(key, value);
	}
	
	public List<String> getSchedule(String key){
		return schedule.get(key);
	}
	
	public Map<String, List<String>> getSchedule(){
		return schedule;
	}
	
	public void setSchedule(Map<String, List<String>> schedule){
		this.schedule = schedule;
	}
}
