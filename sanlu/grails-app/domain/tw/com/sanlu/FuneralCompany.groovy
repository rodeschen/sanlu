package tw.com.sanlu
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
	String address
	static hasMany = [funer:Funeraler]
	
    static constraints = {
		funeralCompanyName maxSize:60,blank:false, unique:true
		phone1 maxSize:20
		phone2 nullable:true,maxSize:20
		address maxSize:100
    }
}
