/**
 * 
 */
package tw.com.sanlu;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @author rick
 * 
 */
public class Utility {
	public final static SimpleDateFormat ADFormat = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm");
	public final static DateFormat shortFormat = DateFormat
			.getDateTimeInstance();
	public final static SimpleDateFormat dateFormat = new SimpleDateFormat(
			"yyyy-MM-dd");
	
	public final static SimpleDateFormat dateTimeFormat = new SimpleDateFormat(
			"M/d HH:mm");
	
	public final static String LOGSEXP = "^[a-z0-9.-]+$";

	public static Date stringToDate(String date, String formatter) {
		SimpleDateFormat sdf = new SimpleDateFormat(formatter);
		try {
			return sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			return new Date();
		}
	}

	public static String dateToString(Date date, String formatter) {
		SimpleDateFormat sdf = new SimpleDateFormat(formatter);
		return sdf.format(date);
	}

	/**
	 * 西元轉民國
	 * 
	 * @param AD
	 * @return
	 */
	public static String convertTWDate(String AD) {
		SimpleDateFormat df4 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat df2 = new SimpleDateFormat("/MM/dd HH:mm");
		Calendar cal = Calendar.getInstance();
		String TWDate = "";
		try {
			cal.setTime(df4.parse(AD));
			cal.add(Calendar.YEAR, -1911);
			TWDate = Integer.toString(cal.get(Calendar.YEAR))
					+ df2.format(cal.getTime());
			return TWDate;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 民國轉西元
	 * 
	 * @param AD
	 * @return
	 */
	public static String convertADDate(String TWDate) {
		SimpleDateFormat df4 = new SimpleDateFormat("-MM-dd HH:mm:ss");
		SimpleDateFormat df2 = new SimpleDateFormat("yyy/MM/dd HH:mm");
		Calendar cal = Calendar.getInstance();
		String ADDate = "";
		try {
			cal.setTime(df2.parse(TWDate));
			cal.add(Calendar.YEAR, +1911);
			ADDate = Integer.toString(cal.get(Calendar.YEAR))
					+ df4.format(cal.getTime());
			return ADDate;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
