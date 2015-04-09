package models.appointments;

import java.util.Date;

public class Appointment {

	public int id;
	public String name;
	public Date date;
	public String time;
	
	public Appointment(int id, String name, Date date, String time) {
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

	public Date getDate() {
		return date;
	}

	public String getTime() {
		return time;
	}
	
}
