package tw.com.sanlu

import java.util.Date;

/**
 * 參數檔
 * @author rick
 */
class Parameters {
	String type	
	String value	
	String description
	String memo
	//最後修改日期
	Date lastUpdate
	//最後修改人員
	Employee lastModifyBy
	
    static constraints = {
		type nullable:false,blank:false		
		value nullable:false,blank:false
		description nullable:false,blank:false
    }
}
