package tw.com.sanlu

/**
 * 禮儀師
 * @author rickhuang
 *
 */
class Funeraler {
	
	//FuneralCompany funeralCommpany
	//禮儀師姓名
	String funeralerName
	//禮儀師電話1
	String phone1
	//禮儀師電話2
	String phone2
	//所屬禮儀公司
	static belongsTo =[funeralCommpany:FuneralCompany]
	static constraints = {
		funeralerName maxSize:60, unique:true
		phone1 maxSize:20
		phone2 nullable:true,maxSize:20
	}
}
