package enums;

import tables.Users_Table;

public enum user_info_enum {
	
	NAME ("name"),
	EMAIL ("email"),
	CONTACTNUMBER ("contact"),
	GENDER ("gender"),
	BIRTHDATE ("birthdate");

	private final String key;
	
    private user_info_enum(final String key) {
        this.key = key;
    }
    
    public String getKey(){
    	return key;
    }
    
}
