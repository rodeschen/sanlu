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
	Double price
	//銷售單價
	Double sallingPrice
	//成本單價
	Double costPrice
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
		totalQuantity blank:false,nullable:false
		price nullable:false
		sallingPrice nullable:false
		costPrice nullable:false
		type nullable:false,blank:false
		unit nullable:false,blank:false
	}
}