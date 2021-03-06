package tw.com.sanlu

import java.util.Date;

/**
* 禮儀公司
* @author rick
*/
class FuneralCompany {
	//公司名
	String funeralCompanyName
	//電話1
	String phone1
	//電話2	
	String phone2	
	 //地址
	String contactAddrCity
	String contactAddrArea
	String contactAddr
	//最後修改日期
	Date lastUpdated
	//最後修改人員
	Employee lastModifyBy
	static hasMany = [funer:Funeraler]
	static mapping = {
		funer cascade:'all-delete-orphan'
	}
    static constraints = {
		funeralCompanyName maxSize:60,blank:false, unique:true
		phone1 maxSize:20
		phone2 nullable:true,maxSize:20
		contactAddrCity maxSize:12,nullable:true
		contactAddrArea maxSize:12,nullable:true
		contactAddr maxSize:100,nullable:true
    }
}
