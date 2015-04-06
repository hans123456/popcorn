package enums;

import tables.Users_Table;

public enum user_registration_enum {

	FIRSTNAME (Users_Table.FIRSTNAME, "user_reg_first_name"),
	LASTNAME (Users_Table.LASTNAME, "user_reg_last_name"),
	EMAIL (Users_Table.EMAIL,"user_reg_email"),
	CONTACTNUMBER (Users_Table.CONTACTNUMBER,"user_reg_contact_number"),
	PASSWORD (Users_Table.PASSWORD, "user_reg_password"),
	CONFIRMPASSWORD (null, "user_reg_confirm_password");
	
	private final String database_column;
	private final String key;
	
    private user_registration_enum(final String database_column, final String key) {
        this.database_column = database_column;
        this.key = key;
    }

    public String getDatabaseColumn() {
        return database_column;
    }
    
    public String getKey(){
    	return key;
    }
}
