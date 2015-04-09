package enums;

public enum doctor_feedback_enum {
	COMMENT ("comment"),
	RATE ("rate"),
	USER_ID ("user_id"),
	DOCTOR_ID ("doctor_id");
	
	private final String key;
	
    private doctor_feedback_enum(final String key) {
        this.key = key;
    }

    @Override
    public String toString() {
        return key;
    }
    
}
