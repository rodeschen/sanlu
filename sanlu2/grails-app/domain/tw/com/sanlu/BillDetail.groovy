package tw.com.sanlu

import java.util.Date;

/**
 * 帳單明細
 * @author rick
 */
class BillDetail {
	
	//產品
	Product product
	//使用產品起始時間
	Date startTime
	//使用產品結束時間
	Date endTime
	//消費產品數量
	Integer quantity
	//小計
	BigDecimal subtotal
	//手動調整小計
	BigDecimal modifySubtotal
	//最後修改時間
	Date lastUpdated
	//最後修改人
	Employee lastModifyBy	
	
	String location
	String description
	String color
	
	static belongsTo =[project:Project]	
	
    static constraints = {
		color nullable:true
		description nullable:true
		location nullable:true
    }
}