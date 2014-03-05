package tw.com.sanlu

import java.util.Date;

/**
 * 客戶
 * @author rickhuang
 *
 */
class Customer {	
	//姓名
	String custName
	//電話1
	String phone1
	//電話2
	String phone2
	//所屬禮儀公司
	static belongsTo =[funeralCommpany:FuneralCompany]
	//最後修改日期
	Date lastUpdated
	//最後修改人員
	Employee lastModifyBy
	static constraints = {
		custName maxSize:60, unique:true
		phone1 maxSize:20
		phone2 nullable:true,maxSize:20
	}
}
