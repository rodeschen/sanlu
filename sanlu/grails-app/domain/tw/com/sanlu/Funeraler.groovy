package tw.com.sanlu

import java.util.Date;

/**
 * 禮儀師
 * @author rickhuang
 *
 */
class Funeraler {	
	//禮儀師姓名
	String funeralerName
	//禮儀師電話1
	String phone1
	//禮儀師電話2
	String phone2
	//所屬禮儀公司
	static belongsTo =[funeralCommpany:FuneralCompany]
	//最後修改日期
	Date lastUpdated
	//最後修改人員
	Employee lastModifyBy
	static constraints = {
		funeralerName maxSize:60, unique:true
		phone1 maxSize:20
		phone2 nullable:true,maxSize:20
	}
}
