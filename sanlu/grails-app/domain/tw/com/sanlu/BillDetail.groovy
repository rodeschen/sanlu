package tw.com.sanlu

import java.util.Date;

/**
 * 帳單明細
 * @author rick
 */
class BillDetail {

	//是否顯示於外帳單
	boolean showBill = true
	//產品
	Product product
	//使用產品起始時間
	Date startTime
	//使用產品結束時間
	Date endTime
	//消費產品數量
	BigDecimal quantity
	//單價
	BigDecimal price
	//手動調整單價
	BigDecimal modifiedPrice
	//內帳單價
	BigDecimal internalPrice
	//手動調整內帳單價
	BigDecimal modifiedInternalPrice
	//場地
	Place place
	//進貨廠商
	String vendor
	//最後修改時間
	Date lastUpdated
	//最後修改人
	Employee lastModifyBy

	String color

	static belongsTo =[project:Project]

	static constraints = {
		color nullable:true
		place nullable:true
		vendor nullable:true
		quantity scale:0
		price scale:0
		modifiedPrice scale:0
		internalPrice scale:0
		modifiedInternalPrice scale:0
	}
}