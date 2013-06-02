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
	//一般商品類型 0:一般商品 1:一般商品且無庫存 2:代叫商品
	Integer productType
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
	//計價顯示單位
	String unit
	
	//計價單位類別  0:次  1:區間(時) 2:區間(天)
	Integer costUnit = 0
	
	//每次計價單位
	BigDecimal costRange
	
	//是否為場地類商品
	boolean hasPlace	
	//最後修改日期
	Date lastUpdated
	//最後修改人員
	Employee lastModifyBy
		
	static constraints = {
		productNo maxSize:6
		productName maxSize:60, unique:true		
		unit maxSize:10
		totalQuantity nullable:true
		price nullable:true,scale:0
		sallingPrice nullable:true,scale:0
		costPrice nullable:true,scale:0
		hasPlace nullable:true		
		costRange nullable:true,scale: 1
		productType nullable:true
	}
}