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
	//手動調整消費產品數量
	Integer modifyQuantity
	//最後修改時間
	Date lostModifyTime
	//最後修改人
	Employee employee	
	
	String location
	String description
	String color
	
	static belongsTo =[projects:Project]	
	
    static constraints = {
		product nullable:false
		quantity nullable:false
    }
}