package tw.com.sanlu

class ChineseDateStatus {
	
	String date
	String dateStatus
	
    static constraints = {
		date maxSize:10,unique:true
		dateStatus maxSize:10
    }
}
