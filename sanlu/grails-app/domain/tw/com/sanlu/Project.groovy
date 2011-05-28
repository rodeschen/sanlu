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
	//禮儀公司
	FuneralCompany funeralCompany
	//禮儀師
	Funeraler funeraler
	//入館日期
	Date inDate
	//出館日期
	Date outDate
	//承辦業務
	Employee emp
	//備註
	String memo
	//消費總金額
	BigDecimal sallingTotal = BigDecimal.ZERO 
	//內帳銷售總金額
	BigDecimal total = BigDecimal.ZERO 
	//成本總金額
	BigDecimal costTotal = BigDecimal.ZERO 
	//最後修改日期
	Date lastUpdated
	//結帳日期
	Date closingDate
	//結帳人員
	Employee closer

	static hasMany = [bill:BillDetail]


	static constraints = {
		projectName maxSize:20
		memo nullable:true
		outDate(validator: { val, obj ->
			val?.after(obj.inDate)
		})
		outDate nullable:true
		closingDate nullable:true
		closer nullable:true
		
		
	}
}