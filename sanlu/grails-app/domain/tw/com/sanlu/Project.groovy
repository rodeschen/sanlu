package tw.com.sanlu

/**
 * 專案
 * @author rick
 *
 */
class Project {
	//案名
	String projectName
	//禮儀公司/禮儀師
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
	BigDecimal sallingTotal
	//內帳銷售總金額
	BigDecimal total
	//成本總金額
	BigDecimal costTotal
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
		closingDate nullable:true
		closer nullable:true
		
	}
}