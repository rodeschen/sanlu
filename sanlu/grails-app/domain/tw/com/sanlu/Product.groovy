package tw.com.sanlu

/**
 * 產品
 * @author rick
 *
 */
class Product {
	//產品名稱
	String productName
	//庫存數量
	Integer totalQuantity
	//內帳銷售單價
	BigDecimal price
	//銷售單價
	BigDecimal sallingPrice
	//成本單價
	BigDecimal costPrice
	//產品類型
	String type
	//單位
	String unit
	//呈現
//	String toString(){
//		return "${productName}-${empName}}"
//	}
	
	static constraints = {
		productName maxSize:60,blank:false, unique:true
		totalQuantity blank:false
		type blank:false
		unit blank:false
		
	}
}