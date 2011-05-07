package tw.com.sanlu

import java.io.Serializable;
import java.util.Date;

/**
 *	產品連結場地關係表
 */
class ProductLinkPlace implements Serializable{
	Product product
	Place place
	//內帳單價
	BigDecimal price
	//銷售單價
	BigDecimal sallingPrice
	//成本單價
	BigDecimal costPrice
	//最後修改日期
	Date lastUpdated
	//最後修改人員
	Employee lastModifyBy
	static mapping = {
		id composite:['product', 'place']
	}	
	static constraints = {
	}
}
