package models.user;

public class User {

	private int id;
	private String name;
	private boolean isAdmin;
	private boolean isDoctor;
	private int doctorId;
	
	public User(){
		super();
	}
	
	public User(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
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

	public String getName() {
		return name;
	}
	
	

}
