package enums;

public enum user_registration_enum {

	FIRSTNAME ("user_reg_first_name"),
	LASTNAME ("user_reg_last_name"),
	EMAIL ("user_reg_email"),
	CONTACTNUMBER ("user_reg_contact_number"),
	PASSWORD ("user_reg_password"),
	CONFIRMPASSWORD ("user_reg_confirm_password");
	
	private final String text;

    private user_registration_enum(final String text) {
        this.text = text;
    }

    @Override
    public String toString() {
        return text;
    }
	
}
