package enums;

public enum login_enum {

	EMAIL ("login_email"),
	PASSWORD ("login_password");
	
	private final String text;

    private login_enum(final String text) {
        this.text = text;
    }

    @Override
    public String toString() {
        return text;
    }
	
}
