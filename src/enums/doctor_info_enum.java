package enums;

public enum doctor_info_enum {

	NAME ("name", 2),
	CITY ("city", 3),
	HOSPITAL ("hospital", 4),
	SPECIALIZATION ("specialization", 5);
	
	private final String key;
	private final int column_no;
	
    private doctor_info_enum(final String key, final int column_no) {
        this.key = key;
        this.column_no = column_no;
    }

    @Override
    public String toString() {
        return key;
    }
    
    public int getColumnNo(){
    	return column_no;
    }
	
}
