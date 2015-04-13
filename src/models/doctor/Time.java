package models.doctor;

public class Time {

	private int time_id;
	private String appointee_id;
	private String appointee_name;
	
	public Time(int time_id, String appointee_name, String appointee_id) {
		super();
		this.time_id = time_id;
		this.appointee_name = appointee_name;
		this.appointee_id = appointee_id;
	}

	public int getTimeId() {
		return time_id;
	}

	public String getAppointeeId() {
		return appointee_id;
	}

	public String getAppointeeName() {
		return appointee_name;
	}
	
}
