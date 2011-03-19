package tw.com.sanlu

import java.util.Date;

/**
 * 專案
 * @author rick
 *
 */
class Project {
	//案名
	String projectName
	//禮儀公司/禮儀師
	String funeralCompany
	//String funeralDirector

	//入館日期
	Date inDate
	//出館日期
	Date outDate
	//承辦業務
	Employee emp
	//備註
	String memo
	//消費總金額
	Double sallingTotal
	//內帳銷售總金額
	Double total
	//成本總金額
	Double costTotal
	//結帳日期
	Date closingDate
	//結帳人員
	Employee closer
	
	static hasMany = {
		bill:BillDetail
	}
	static constraints = {
		projectName maxSize:20,nullable:false
		funeralCompany maxSize:60,nullable:false
		emp nullable:false
	}
}