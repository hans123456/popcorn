package model;

public class User {

	private String id;
	private String name;
	private boolean isAdmin;
	private boolean isDoctor;
	
	public User(){
		super();
	}
	
	public User(String id, String name, boolean isDoctor, boolean isAdmin) {
		super();
		this.id = id;
		this.name = name;
		this.isDoctor = isDoctor;
		this.isAdmin = isAdmin;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public boolean isDoctor() {
		return isDoctor;
	}

}
