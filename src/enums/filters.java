package enums;

public enum filters {

	SPECIALIZATION ("specialization"),
	CITY ("city"),
	HOSPITAL ("hospital");
	
	private final String text;

    private filters(final String text) {
        this.text = text;
    }

    @Override
    public String toString() {
        return text;
    }
}
