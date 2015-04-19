package enums;

public enum doctor_info_short_enum {

	NAME ("name", 2),
	CITY ("city", 3),
	SPECIALIZATION ("specialization", 4),
	HOSPITAL ("hospital", 5);
	
	private final String key;
	private final int column_no;
	
    private doctor_info_short_enum(final String key, final int column_no) {
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
