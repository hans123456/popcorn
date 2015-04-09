package models.appointments;


public class Appointment {

	private int id;
	private String doctor_name;
	private String appointee_name;
	private String date;
	private String time;
	
	public Appointment(int id, String doctor_name, String appointee_name, String date, String time) {
		super();
		this.id = id;
		this.doctor_name = doctor_name;
		this.appointee_name = appointee_name;
		this.date = date;
		this.time = time;
	}

	public int getId() {
		return id;
	}
	
	public String getDoctorName() {
		return doctor_name;
	}

	public String getAppointeeName() {
		return appointee_name;
	}
	
	public String getDate() {
		return date;
	}

	public String getTime() {
		return time;
	}
	
}
