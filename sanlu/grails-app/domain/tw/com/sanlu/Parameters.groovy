package tw.com.sanlu

/**
 * 參數檔
 * @author rick
 */
class Parameters {
	String type	
	String value	
	String description
	String memo
    static constraints = {
		type nullable:false,blank:false		
		value nullable:false,blank:false
		description nullable:false,blank:false
    }
}
