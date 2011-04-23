package tw.com.sanlu

/**
 * 產品
 * @author rick
 *
 */
class Product {
	Product parentOid
	//產品名稱
	String name	
	//庫存數量
	Integer totalQuantity
	//內帳銷售單價
	BigDecimal price
	//銷售單價
	BigDecimal sallingPrice
	//成本單價
	BigDecimal costPrice
	//時間類型
	String timeType
	//計價單位
	String unit
	//呈現
//	String toString(){
//		return "${productName}-${empName}}"
//	}
	
	static constraints = {
		name maxSize:60,blank:false, unique:true
		totalQuantity blank:false
		timeType maxSize:10,blank:false
		unit maxSize:10,blank:false,nullable:false
		
	}
}