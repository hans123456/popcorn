package models.doctor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Doctor {

	private int id;
	private Map<String,String> info;
	private Map<Integer, List<Integer>> schedule;
	
	public Doctor(int id){
		this.id = id;
		this.info = new HashMap<String, String>();
		this.schedule = new HashMap<Integer, List<Integer>>();
	}
	
	public Doctor(){
		this.id = 0;
		this.info = new HashMap<String, String>();
		this.schedule = new HashMap<Integer, List<Integer>>();
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
	
	public void setSchedule(Integer key, List<Integer> value){
		schedule.put(key, value);
	}
	
	public List<Integer> getSchedule(Integer key){
		return schedule.get(key);
	}
	
	public Map<Integer, List<Integer>> getSchedule(){
		return schedule;
	}
}
