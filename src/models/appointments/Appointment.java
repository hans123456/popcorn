package models.appointments;


public class Appointment {

	private int id;
	private String doctor_name;
	private String appointee_name;
	private String date;
	private String time;
	private int doctor_id;
	private int user_id;
	private int time_id;
	
	public Appointment(int id, int doctor_id, String doctor_name, String appointee_name, String date, String time) {
		super();
		this.id = id;
		this.doctor_id = doctor_id;
		this.doctor_name = doctor_name;
		this.appointee_name = appointee_name;
		this.date = date;
		this.time = time;
	}
	
	public Appointment(int id, int doctor_id, int user_id, String date, int time_id) {
		super();
		this.id = id;
		this.doctor_id = doctor_id;
		this.user_id = user_id;
		this.date = date;
		this.time_id = time_id;
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

	public int getDoctorId() {
		return doctor_id;
	}

	public int getUserId() {
		return user_id;
	}

	public int getTimeId() {
		return time_id;
	}
	
	public void setDoctorName(String doctor_name) {
		this.doctor_name = doctor_name;
	}

	
	
}
