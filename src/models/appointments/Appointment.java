package models.appointments;

import java.util.Date;

public class Appointment {

	public int id;
	public String name;
	public String date;
	public String time;
	
	public Appointment(int id, String name, String date, String time) {
		super();
		this.id = id;
		this.name = name;
		this.date = date;
		this.time = time;
	}

	public int getId() {
		return id;
	}
	
	public String getName() {
		return name;
	}

	public String getDate() {
		return date;
	}

	public String getTime() {
		return time;
	}
	
}
