package models.feedback;

public class Feedback {
	private int id;
	private int rate;
	private String comment;
	private int user_id;
	private int doctor_id;
	
	
	public Feedback(int id) {
		this.id = id;
	}
	public Feedback(int rate, String comment) {
		this.rate = rate;
		this.comment = comment;
	}
	public Feedback(int rate, String comment, int user_id, int doctor_id) {
		this.rate = rate;
		this.comment = comment;
		this.user_id = user_id;
		this.doctor_id = doctor_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getDoctor_id() {
		return doctor_id;
	}
	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
	}
	
	
}
