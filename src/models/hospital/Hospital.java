package models.hospital;

public class Hospital {

	private int id;
	private String name;
	
	public Hospital(int id, String name){
		this.id = id;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}
	
}
