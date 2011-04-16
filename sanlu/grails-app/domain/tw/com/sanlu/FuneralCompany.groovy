package tw.com.sanlu
/**
* 禮儀公司
* @author rick
*/
class FuneralCompany {
	//公司名
	String name
	//電話1
	String phone1
	//電話2	
	String phone2
	//電話3
	String phone3
	//地址
	String address
	
    static constraints = {
		name nullable:false,maxSize:60,blank:false, unique:true
		phone1 nullable:false,maxSize:20
		phone2 nullable:true,maxSize:20
		phone3 nullable:true,maxSize:20
		address maxSize:100
    }
}
