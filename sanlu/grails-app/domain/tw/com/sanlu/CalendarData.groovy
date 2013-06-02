package tw.com.sanlu

import java.util.Date;

/**
 * 帳單明細
 * @author rick
 */
class CalendarData {


	//行事曆類型
	String type
	//title
	//String title
	//內容
	String description
	//起始時間
	Date startTime
	//結束時間
	Date endTime
	//最後修改時間
	Date lastUpdated
	//最後修改人
	Employee lastModifyBy

	static constraints = {
	}
}