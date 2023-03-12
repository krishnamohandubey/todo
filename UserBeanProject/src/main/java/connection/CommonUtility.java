package connection;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CommonUtility {
	public static String getCurrentDateTime() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
		LocalDateTime now = LocalDateTime.now();  
		String date= dtf.format(now);
		return date;
	}
	
	
}
