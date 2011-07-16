package tw.com.sanlu

import java.util.Date;

/**
 * 產品
 * @author rick
 *
 */
class Product {
	//商品代號
	String productNo
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
	//時間類型
	//String timeType
	//計價單位
	String unit
	//是否為場地類商品
	boolean hasPlace
	//是否為代叫項目
	boolean isAgency
	//最後修改日期
	Date lastUpdated
	//最後修改人員
	Employee lastModifyBy
	//呈現
	//	String toString(){
	//		return "${productName}-${empName}}"
	//	}
	
	static constraints = {
		productNo maxSize:6
		productName maxSize:60, unique:true
		//timeType maxSize:10
		unit maxSize:10
		totalQuantity nullable:true
		price nullable:true
		sallingPrice nullable:true
		costPrice nullable:true
		hasPlace nullable:true
		isAgency nullable:true
	}
}