package utilities;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateParser {

	// outputs from materialize date picker for database format
	// defaults to current date if param format is invalid
	public static String parseDateForDatabase(String param_date){
		
		DateFormat input = new SimpleDateFormat("dd MMMMM, yyyy");
		DateFormat output = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		
		if(param_date!=null){
			try {
				date = input.parse(param_date);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return output.format(date);
		
	}
	
	public static Date parseStringToDate(String param_date){
		
		DateFormat output = new SimpleDateFormat("yyyy-MM-dd");
		
		if(param_date!=null){
			try {
				return output.parse(param_date);
			} catch (Exception e) {
			}
		}
		
		return null;
	}
	
}
